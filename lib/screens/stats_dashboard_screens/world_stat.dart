import 'package:covidtracker/widgets/radial_progress.dart';
import 'package:covidtracker/widgets/small_graph_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CaseType { ACTIVE, DEATHS, RECOVERED }

class WorldStatScreen extends StatefulWidget {
  @override
  _WorldStatScreenState createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
  CaseType _caseType;
  Color startClr, endClr, bgClr;
  double progress;
  Duration caseTypeDuration = Duration(milliseconds: 400);
  Curve caseTypeCurve = Curves.ease;

  void updateRadialDial() {
    if (_caseType == CaseType.ACTIVE) {
      startClr = Colors.orangeAccent[100];
      endClr = Colors.orangeAccent[700];
      bgClr = Colors.orange[50];
      progress = 0.85;
    } else if (_caseType == CaseType.DEATHS) {
      startClr = Colors.redAccent[100];
      endClr = Colors.redAccent[700];
      bgClr = Colors.red[50];
      progress = 0.43;
    } else if (_caseType == CaseType.RECOVERED) {
      startClr = Colors.greenAccent[100];
      endClr = Colors.greenAccent[700];
      bgClr = Colors.green[50];
      progress = 0.57;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _caseType = CaseType.ACTIVE;
    updateRadialDial();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: ListView(
            children: <Widget>[
              //Back Icon and Image
              Container(
                decoration: BoxDecoration(
                    color: Colors.purple[900],
                    borderRadius: BorderRadius.circular(16)),
                height: MediaQuery.of(context).size.width > 360.0 ? 210 : 200,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Column(
                  children: <Widget>[
                    //Back Arrow And Title
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          width: 0,
                        ),

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
                          width: 65,
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
                        width: MediaQuery.of(context).size.width > 360.0
                            ? 310
                            : 300,
                        fit: BoxFit.fitWidth,
                        image: AssetImage("assets/stats/global_stats.png"),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //Case Types Container
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 8,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  height: 265,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      //Row of Case Types
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Active Cases
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _caseType = CaseType.ACTIVE;
                                  updateRadialDial();
                                });
                              },
                              child: AnimatedContainer(
                                duration: caseTypeDuration,
                                curve: caseTypeCurve,
                                decoration: BoxDecoration(
                                    color: _caseType == CaseType.ACTIVE
                                        ? Colors.orangeAccent[100]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width > 360.0
                                          ? 16
                                          : 14,
                                  vertical: 12,
                                ),
                                child: Center(
                                  child: Text(
                                    "Active",
                                    style: TextStyle(
                                      color: Colors.orangeAccent[700],
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
                              width: MediaQuery.of(context).size.width > 360.0
                                  ? 15
                                  : 6,
                            ),

                            //Deaths
                            InkWell(
                              onTap: () {
                                setState(() {
                                  _caseType = CaseType.DEATHS;
                                  updateRadialDial();
                                });
                              },
                              child: AnimatedContainer(
                                duration: caseTypeDuration,
                                curve: caseTypeCurve,
                                decoration: BoxDecoration(
                                    color: _caseType == CaseType.DEATHS
                                        ? Color(0xffffc8c4)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      MediaQuery.of(context).size.width > 360.0
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
                              width: MediaQuery.of(context).size.width > 360.0
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
                                  });
                                },
                                child: AnimatedContainer(
                                  curve: caseTypeCurve,
                                  duration: caseTypeDuration,
                                  decoration: BoxDecoration(
                                      color: _caseType == CaseType.RECOVERED
                                          ? Color(0xffdbffe5)
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
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
                        height: 25,
                      ),

                      //Row of Radial Dial and Case Count Column
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            //Radial Progress Indicator
                            RadialProgress(
                              progressValue: progress,
                              startClr: startClr,
                              endClr: endClr,
                              bgClr: bgClr,
                            ),

                            //Global Case Count Data
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[

                                //Affected Cases Panel
                                SmallGraphPanel(
                                  label: "Affected",
                                  value: 1341300,
                                  icon: Icons.arrow_drop_up,
                                  fontColor: endClr,
                                  iconColor: endClr,
                                  startColor: startClr,
                                  lineColor: endClr,
                                  size: Size(40, 20),
                                ),

                                SizedBox(
                                  height: 20,
                                ),

                                //Active Cases Panel
                                SmallGraphPanel(
                                  label: "Active",
                                  value: 991240,
                                  icon: Icons.arrow_drop_up,
                                  fontColor: endClr,
                                  iconColor: endClr,
                                  startColor: startClr,
                                  lineColor: endClr,
                                  size: Size(40, 20),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /*
              Container for global stats
                -Radial Progress Widget
                  -animate progress when type changed
                  -change color when type changed
                  -show percentage out of total
                -InkWells for case type
                  -Total Affected
                  -Active Cases
                    -Red Color
                    -Stack
                      -Mini Graph
                      -A dropdown/dropup arrow icon
                      -Number of stats
                  -Recovered
                    -Green Color
                    -Stack
                      -Mini Graph
                      -A dropdown/dropup arrow icon
                      -Number of stats
                  -Total Deaths
                   - Orange Color
                    -Stack
                      -Mini Graph
                      -A dropdown/dropup arrow icon
                      -Number of stats

              -Container for World Map Image
                -Purple/Black Color
                -Heatmap points

              -Container for top countries
                -GridView
                  -Top 4 countries
                    -US, UK, ITALY, PAKISTAN
                      -InkWell
                        -ListTile
                          -Flag Image
                          -Country Name
                          -Mini Graph
                          -Dropdowm/up arrow icon
                          -Random Vivid Color
                          -Total Cases
              */
            ],
          ),
        ),
      ),
    );
  }
}
