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
  Color radialStartClr, radialEndClr, radialBgClr;
  Color panelStartClr, panelFontClr, panelIconClr, panelLineClr;
  double progress;
  Duration caseTypeDuration = Duration(milliseconds: 400);
  Curve caseTypeCurve = Curves.ease;
  ApiClient _client = ApiClient();
  Map<String, dynamic> globalData;

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: FutureBuilder<Map<String, dynamic>>(
          future: getGlobalData(),
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
                return ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    //Image Container
                    Padding(
                      padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                      child: Material(
                        elevation: 6,
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.purple[900],
                              borderRadius: BorderRadius.circular(16)),
                          height: MediaQuery.of(context).size.width > 360.0
                              ? 215
                              : 200,
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          child: Column(
                            children: <Widget>[
                              //Back Arrow And Title
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  //Back Arrow
                                  InkWell(
                                    onTap: () => Navigator.of(context).pop(),
                                    child: Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                      size: 26,
                                    ),
                                  ),

                                  SizedBox(
                                    width: MediaQuery.of(context).size.width >
                                            360.0
                                        ? 65.0
                                        : 50.0,
                                  ),

                                  //Text
                                  Text(
                                    "Global Statistics",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Montserrat",
                                        fontSize: 21,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 17,
                              ),

                              //Stats Image
                              Container(
                                child: Image(
                                  width:
                                      MediaQuery.of(context).size.width > 360.0
                                          ? 350
                                          : 300,
                                  fit: BoxFit.fitWidth,
                                  image: AssetImage(
                                      "assets/stats/global_stats.png"),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 25,
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
                          height: 301,
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
                                height: 15,
                              ),

                              //Row of Radial Dial and Case Count Column
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 7, left: 4),
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
                      height: 25,
                    ),

                    //Affected Areas Text
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Text(
                        "Affected Areas",
                        style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 20,
                            letterSpacing: 0.5,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                    ),

                    SizedBox(
                      height: 15,
                    ),

                    //World Map Image
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 15),
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(16.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.fromLTRB(8, 25, 8, 20),
                          child: Image(
                            image: AssetImage("assets/stats/map.png"),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 25),

                    //Top Countries List
                    Container(
                      height: 250,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Title
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                //Top Country
                                Text(
                                  "Top Countries",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                                ),

                                //View all
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "View all",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.purple[800]),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 15,
                          ),

                          //Country Cards List
                          Expanded(
                            child: FutureBuilder<List<SummaryEachCountry>>(
                              future: getTopSix(),
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
                                    : Center(
                                        //TODO: Make a custom shimmer loader
                                        child: CircularProgressIndicator(),
                                      );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
            } else {
              return Center(
                //TODO: Make a custom shimmer loader
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
