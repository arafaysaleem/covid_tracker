import '../../widgets/stats_widgets/affected_map_container.dart';
import '../../widgets/stats_widgets/global_case_container.dart';
import '../../widgets/stats_widgets/world_stats_image.dart';
import '../../screens/stats_dashboard_screens/country_list.dart';
import '../../widgets/skeletons/top_country_list_skeleton.dart';
import '../../widgets/skeletons/world_stat_skeleton.dart';
import '../../widgets/stats_widgets/top_country_list.dart';
import '../../models/summary_each_country.dart';
import '../../network_requests/api_client.dart';
import '../../network_requests/exceptions.dart';
import 'package:flutter/material.dart';

enum CaseType { ACTIVE, DEATHS, RECOVERED }

class WorldStatScreen extends StatefulWidget {
  @override
  _WorldStatScreenState createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
  ApiClient _client = ApiClient();
  Map<String, dynamic> globalData;
  Future<Map<String,dynamic>> _globalFuture;
  Future<List<SummaryEachCountry>> _topSixFuture;


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

                //Actual Body
                return ListView(
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
                    WorldStatsImage(),

                    SizedBox(
                      height: 20,
                    ),

                    //Global Cases Container
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      child: GlobalCaseContainer(globalData: globalData,),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Affected Areas Map Container
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: AffectedAreasContainer(),
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
