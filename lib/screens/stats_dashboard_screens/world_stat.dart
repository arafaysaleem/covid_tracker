import '../../widgets/stats_widgets/animated_bottom_bar.dart';
import '../../models/bottom_bar_item.dart';
import '../../screens/credits_page.dart';
import '../../screens/stats_dashboard_screens/default_country_screen.dart';
import '../../screens/stats_dashboard_screens/global_stat.dart';
import '../../values/default_country_data.dart';
import '../../screens/stats_dashboard_screens/country_list.dart';
import '../../models/summary_each_country.dart';
import '../../network_requests/api_client.dart';
import 'package:flutter/material.dart';

enum CaseType { ACTIVE, DEATHS, RECOVERED }

class WorldStatScreen extends StatefulWidget {
  @override
  _WorldStatScreenState createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
  ApiClient _client = ApiClient();
  Map<String, dynamic> globalData;
  Future<Map<String, dynamic>> _globalFuture;
  Future<List<SummaryEachCountry>> _topSixFuture;
  PageController _controller;
  int selectedBottomBarIndex = 0;
  List<Widget> pages;
  List<BarItem> barItems;

  Future<List<SummaryEachCountry>> getTopSix() async {
    List<SummaryEachCountry> listTopSix = [];
    List<dynamic> json;
    json = await _client.getStatsResponse(StateLocation.TOP_FIVE);
    //Initially i fetched top 5 and added pakistan details following that
    //Because i wanted to show pakistan details in top 6 stats :)
    var pakStats =
        await _client.getStatsResponse(StateLocation.SPECIFIC, code: "PK");
    json.insert(0, pakStats);

    json.forEach((country) {
      SummaryEachCountry summary = SummaryEachCountry().formMap(country);
      listTopSix.add(summary);
    });

    return listTopSix;
  }

  Future<Map<String, dynamic>> getGlobalData() async {
    var json = await _client.getStatsResponse(StateLocation.GLOBAL);
    return json;
  }

  @override
  void initState() {
    super.initState();
    _controller = new PageController(initialPage: selectedBottomBarIndex);
    pages=[
      GlobalStatScreen(controller: _controller,),
      CountriesScreen(),
      DefaultCountryScreen(controller: _controller),
      CreditsScreen(controller: _controller,),
    ];
    barItems = [
      BarItem(
        icon: Icons.insert_chart,
        iconSize: 24,
        text: "Global",
        textSize: 18,
        color: Colors.purpleAccent[700],
      ),
      BarItem(
        icon: Icons.search,
        iconSize: 24,
        text: "Search",
        textSize: 18,
        color: Color(0xff6078ff),
      ),
      BarItem(
        icon: Icons.flag,
        iconSize: 24,
        text: "Default",
        textSize: 18,
        color: Colors.red,
      ),
      BarItem(
        icon: Icons.info_outline,
        iconSize: 24,
        text: "Credits",
        textSize: 18,
        color: Color(0xff009a88),
      ),
    ];
    _globalFuture = getGlobalData();
    _topSixFuture = getTopSix();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color getScaffoldColor(){
    if(selectedBottomBarIndex==0) return Colors.grey[100];
    else if(selectedBottomBarIndex==1 || selectedBottomBarIndex==3) return Colors.white;
    return defaultCountry.countryName==null?Colors.white:defaultCountry.color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add a bottom navigation bar with Home,CountryList,DefaultCountry,Info tabs
      extendBodyBehindAppBar: true,
      backgroundColor: getScaffoldColor(),
      body: SafeArea(
        child: PageView.builder(
          itemCount: 4,
          physics: BouncingScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              selectedBottomBarIndex = index;
            });
          },
          controller: _controller,
          itemBuilder: (context, index) => pages[index],
        ),
      ),
      bottomNavigationBar: AnimatedBottomBar(
        onItemTap: (index) {
          setState(() {
            _controller.animateToPage(index,
                duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
          });
        },
        barItems: barItems,
        currBarItem: selectedBottomBarIndex,
        animationDuration: Duration(milliseconds: 150),
        elevation: 15,
      ),
    );
  }
}
