import 'package:covidtracker/widgets/radial_progress.dart';
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
          child: ListView(
            children: <Widget>[
              //Back Icon and Image
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      left: 15,
                      child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RadialProgress(progressValue: 0.7,startClr: Colors.greenAccent[100],
                        endClr: Colors.greenAccent[700],
                        bgClr:Colors.green[50]),
                  ],
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
