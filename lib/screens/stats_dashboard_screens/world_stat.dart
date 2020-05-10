import 'package:covidtracker/widgets/radial_progress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WorldStatScreen extends StatefulWidget {
  @override
  _WorldStatScreenState createState() => _WorldStatScreenState();
}

class _WorldStatScreenState extends State<WorldStatScreen> {
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
                height: 200,
                child: Stack(
                  children: <Widget>[
                    //Back Arrow
                    Positioned(
                      top: 20,
                      left: 10,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    //Stats Image
                    Positioned(
                      left: 10,
                      top: 60,
                      child: Container(
                        child: Image(
                          height: 100,
                          fit: BoxFit.cover,
                          image: AssetImage("assets/stats/global_stats.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 30,
              ),

              //Case Types Container
              Material(
                borderRadius: BorderRadius.circular(16),
                elevation: 8,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  height: 260,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 15, 20, 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      //Row of Case Types
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[

                          //Active Cases
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.greenAccent[100],
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Center(
                              child: Text("Active"),
                            ),
                          ),

                          //Deaths
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.greenAccent[100],
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Center(
                              child: Text("Active"),
                            ),
                          ),

                          //Recoveries
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.greenAccent[100],
                                borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 10),
                            child: Center(
                              child: Text("Active"),
                            ),
                          ),
                        ],
                      ),

                      //Row of Radial Dial and Case Count Column
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          //Radial Progress Indicator
                          RadialProgress(
                              progressValue: 0.7,
                              startClr: Colors.greenAccent[100],
                              endClr: Colors.greenAccent[700],
                              bgClr: Colors.green[50]),
                        ],
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
