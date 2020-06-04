import '../../screens/stats_dashboard_screens/country_list.dart';
import '../../widgets/skeletons/top_country_list_skeleton.dart';
import '../../widgets/skeletons/world_stat_skeleton.dart';
import '../../widgets/top_country_list.dart';
import '../../models/summary_each_country.dart';
import '../../network_requests/api_client.dart';
import '../../network_requests/exceptions.dart';
import '../../widgets/radial_progress.dart';
import '../../widgets/small_graph_panel.dart';
import 'package:flutter/material.dart';

enum CaseType { ACTIVE, DEATHS, RECOVERED }

class WorldStatScreen extends StatefulWidget {
  @override
  _WorldStatScreenState createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
  CaseType _caseType;
  Color radialStartClr, radialEndClr, radialBgClr,panelStartClr, panelFontClr, panelIconClr, panelLineClr;
  double progress;
  Duration caseTypeDuration = Duration(milliseconds: 400);
  Curve caseTypeCurve = Curves.ease;
  ApiClient _client = ApiClient();
  Map<String, dynamic> globalData;
  Future<Map<String,dynamic>> _globalFuture;
  Future<List<SummaryEachCountry>> _topSixFuture;

  void updateRadialDial() {
    if (_caseType == CaseType.ACTIVE) {
      radialStartClr = Colors.purpleAccent[100];
      radialEndClr = Colors.purpleAccent[700];
      radialBgClr = Color(0xfffde6ff);
      progress = (globalData["active"] + 0.0) / globalData["cases"];
    } else if (_caseType == CaseType.DEATHS) {
      radialStartClr = Colors.redAccent[100];
      radialEndClr = Colors.redAccent[700];
      radialBgClr = Colors.red[50];
      progress = (globalData["deaths"] + 0.0) / globalData["cases"];
    } else if (_caseType == CaseType.RECOVERED) {
      radialStartClr = Colors.greenAccent[100];
      radialEndClr = Colors.greenAccent[700];
      radialBgClr = Colors.green[50];
      progress = (globalData["recovered"] + 0.0) / globalData["cases"];
    }
  }

  void updateCasesPanel() {
    if (_caseType == CaseType.ACTIVE) {
      panelFontClr = Color(0xff7f2d91); //Color(0xff684024);
      panelStartClr = Color(0xfff7deff); //Color(0xffffe9d4);
      panelIconClr = Color(0xffcc00ff); //Color(0xffff9900);
      panelLineClr = Color(0xffca4eff); //Color(0xffff8c4e);
    } else if (_caseType == CaseType.DEATHS) {
      panelFontClr = Color(0xff682429);
      panelStartClr = Color(0xfffbe7e8);
      panelIconClr = Color(0xffff000f);
      panelLineClr = Color(0xffff4e5d);
    } else if (_caseType == CaseType.RECOVERED) {
      panelFontClr = Color(0xff1d5422);
      panelStartClr = Color(0xffe8f3f2);
      panelIconClr = Color(0xff00c261);
      panelLineClr = Color(0xff44db6c);
    }
  }

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
    _caseType = CaseType.ACTIVE;
    updateCasesPanel();
    _globalFuture=getGlobalData();
    _topSixFuture=getTopSix();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add a bottom navigation bar with Home,CountryList,DefaultCountry,Info tabs
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: _globalFuture,
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.hasError) {

              //error container
              return Container(
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xfff3cfff),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    snapshot.error.toString(),
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            }

            if (snapshot.hasData) {
              if (snapshot.data is FetchDataException) {
                return Container(
                  decoration: BoxDecoration(
                    color: Color(0xfff3cfff),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        fontSize: 21,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              } else {

                globalData = snapshot.data;
                updateRadialDial();

                //Actual Body
                return ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[

                    //Back Arrow And Title
                    Padding(
                      padding: const EdgeInsets.only(top:15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          //Back Arrow
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.purple[900],
                                size: 26,
                              ),
                            ),
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width >
                                360.0
                                ? 55.0
                                : 40.0,
                          ),

                          //Text
                          Text(
                            "Global Statistics",
                            style: TextStyle(
                                color: Colors.purple[900],
                                fontFamily: "Montserrat",
                                fontSize: 21,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height:10),

                    //Image Container
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[900],
                              borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
                          child: Container(
                            child: Image(
                              width:
                                  MediaQuery.of(context).size.width > 360.0
                                      ? 350
                                      : 300,
                              fit: BoxFit.fitWidth,
                              image: AssetImage(
                                  "assets/stats/global_stats.png"),
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Radial & Global Cases Container
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: Material(
                        borderRadius: BorderRadius.circular(16),
                        elevation: 4,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16)),
                          height: 298,
                          padding: EdgeInsets.fromLTRB(5, 16, 5, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //Row of Case Types
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //Active Cases
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _caseType = CaseType.ACTIVE;
                                          updateRadialDial();
                                          updateCasesPanel();
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: caseTypeDuration,
                                        curve: caseTypeCurve,
                                        decoration: BoxDecoration(
                                            color: _caseType == CaseType.ACTIVE
                                                ? Color(
                                                    0xfff3cfff) //Color(0xffffd9b5)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  360.0
                                              ? 16
                                              : 14,
                                          vertical: 12,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Active",
                                            style: TextStyle(
                                              color: Colors.purpleAccent[700],
                                              fontFamily: "Montserrat",
                                              fontSize: 16,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width >
                                              360.0
                                          ? 15
                                          : 6,
                                    ),

                                    //Deaths
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          _caseType = CaseType.DEATHS;
                                          updateRadialDial();
                                          updateCasesPanel();
                                        });
                                      },
                                      child: AnimatedContainer(
                                        duration: caseTypeDuration,
                                        curve: caseTypeCurve,
                                        decoration: BoxDecoration(
                                            color: _caseType == CaseType.DEATHS
                                                ? Color(0xffffcfcc)
                                                : Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        padding: EdgeInsets.symmetric(
                                          horizontal: MediaQuery.of(context)
                                                      .size
                                                      .width >
                                                  360.0
                                              ? 16
                                              : 14,
                                          vertical: 12,
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Deaths",
                                            style: TextStyle(
                                              color: Colors.redAccent[700],
                                              fontFamily: "Montserrat",
                                              fontSize: 16,
                                              letterSpacing: 0.5,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(
                                      width: MediaQuery.of(context).size.width >
                                              360.0
                                          ? 15
                                          : 6,
                                    ),

                                    //Recoveries
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _caseType = CaseType.RECOVERED;
                                            updateRadialDial();
                                            updateCasesPanel();
                                          });
                                        },
                                        child: AnimatedContainer(
                                          curve: caseTypeCurve,
                                          duration: caseTypeDuration,
                                          decoration: BoxDecoration(
                                              color: _caseType ==
                                                      CaseType.RECOVERED
                                                  ? Color(0xffdbffe5)
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Recovered",
                                              style: TextStyle(
                                                color: Colors.greenAccent[700],
                                                fontFamily: "Montserrat",
                                                fontSize: 16,
                                                letterSpacing: 0.5,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(
                                height: 12,
                              ),

                              //Row of Radial Dial and Case Count Column
                              Padding(
                                padding: const EdgeInsets.only(right: 7),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //Radial Progress Indicator
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10.0),
                                      child: RadialProgress(
                                        progressValue: progress,
                                        startClr: radialStartClr,
                                        endClr: radialEndClr,
                                        bgClr: radialBgClr,
                                      ),
                                    ),

                                    //Global Case Count Panels
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: <Widget>[
                                          //Affected Cases Panel
                                          SmallGraphPanel(
                                            label: "Confirmed",
                                            value: globalData["cases"] + 0.0,
                                            icon: Icons.arrow_drop_up,
                                            fontColor: panelFontClr,
                                            iconColor: panelIconClr,
                                            startColor: panelStartClr,
                                            lineColor: panelLineClr,
                                            isIncreasing: true,
                                          ),

                                          SizedBox(
                                            height: 12,
                                          ),

                                          //Total Type Cases Panel
                                          SmallGraphPanel(
                                            label: _caseType == CaseType.ACTIVE
                                                ? "Active"
                                                : _caseType == CaseType.DEATHS
                                                    ? "Deaths"
                                                    : "Recovered",
                                            value: _caseType == CaseType.ACTIVE
                                                ? globalData["active"] + 0.0
                                                : _caseType == CaseType.DEATHS
                                                    ? globalData["deaths"] + 0.0
                                                    : globalData["recovered"] +
                                                        0.0,
                                            icon: Icons.arrow_drop_up,
                                            fontColor: panelFontClr,
                                            iconColor: panelIconClr,
                                            startColor: panelStartClr,
                                            lineColor: panelLineClr,
                                            isIncreasing: true,
                                          ),

                                          SizedBox(
                                            height: 12,
                                          ),

                                          //New Cases Panel
                                          SmallGraphPanel(
                                            label:
                                                _caseType == CaseType.RECOVERED
                                                    ? "Per Million"
                                                    : "Today",
                                            value: _caseType == CaseType.ACTIVE
                                                ? globalData["todayCases"] + 0.0
                                                : _caseType == CaseType.DEATHS
                                                    ? globalData[
                                                            "todayDeaths"] +
                                                        0.0
                                                    : globalData[
                                                            "recoveredPerOneMillion"] +
                                                        0.0,
                                            icon: Icons.arrow_drop_up,
                                            fontColor: panelFontClr,
                                            iconColor: panelIconClr,
                                            startColor: panelStartClr,
                                            lineColor: panelLineClr,
                                            isIncreasing: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //World Map Container
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.fromLTRB(15, 0, 3, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    //Affected Areas Text
                                    Text(
                                      "Affected Areas",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 17,
                                          letterSpacing: 0.5,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.black),
                                    ),

                                    //More horiz icon
                                    IconButton(
                                      icon: Icon(
                                        Icons.more_horiz,
                                        color: Colors.purple[700],
                                        size: 28,
                                      ),
                                      onPressed: () {},
                                    )
                                  ],
                                ),
                              ),

                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(20, 0, 17, 14),
                                child: Image(
                                  image: AssetImage("assets/stats/map.png"),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    //Top Countries List
                    Container(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Title and View All
                          Padding(
                            padding: EdgeInsets.fromLTRB(15, 0, 6, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Top Country
                                Text(
                                  "Top Countries",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),

                                //View all
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => CountriesScreen()
                                    ));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                                    child: Text(
                                      "View all",
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.purple[800]),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),

                          //Country Cards List
                          Expanded(
                            child: FutureBuilder<List<SummaryEachCountry>>(
                              future: _topSixFuture,
                              builder: (context,
                                  AsyncSnapshot<List<SummaryEachCountry>>
                                      snapshot) {
                                if (snapshot.hasError) {
                                  return Container(
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 15.0),
                                    decoration: BoxDecoration(
                                      color: Color(0xfff3cfff),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: Text(
                                        snapshot.error.toString(),
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 21,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return snapshot.hasData
                                    ? snapshot.data is FetchDataException
                                        ? Container(
                                            decoration: BoxDecoration(
                                              color: Color(0xfff3cfff),
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            child: Center(
                                              child: Text(
                                                snapshot.data.toString(),
                                                style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ),
                                          )
                                        : TopCountryList(
                                            topSixList: snapshot.data,
                                          )
                                    : TopCountryLoader();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            }
            else {
              return WorldStatLoader();
            }
          },
        ),
      ),
    );
  }
}
