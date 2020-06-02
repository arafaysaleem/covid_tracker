import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryStatLoader extends StatefulWidget {
  @override
  _CountryStatLoaderState createState() => _CountryStatLoaderState();
}

class _CountryStatLoaderState extends State<CountryStatLoader> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        //Today / Yesterday Title
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "Today",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  color: Colors.grey[800],
                  fontSize: 22.0),
            ),
            SizedBox(width: 15),

            Text(
              "Yesterday",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
                fontSize: 13.0,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        //Case Boxes
        Column(
          children: <Widget>[
            //Row of affected and deaths
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                //New Affected
                Container(
                  width:175,
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      //Title
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 95,
                        height: 15,
                      ),

                      //Number
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 80,
                        height: 21,
                      ),
                    ],
                  ),
                ),

                SizedBox(width: 13),

                //New Deaths
                Expanded(
                  child: Container(
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Title
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 80,
                          height: 15,
                        ),

                        //Number
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 50,
                          height: 21,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 13),

            //Row of Tested and recovered
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                //New tested
                Expanded(
                  child: Container(
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Title
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 85,
                          height: 15,
                        ),

                        //Number
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          width: 115,
                          height: 21,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 13),

                //New Recovered || Probability
                Container(
                  width:175,
                  height: 95,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(13),
                  ),
                  padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Title
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 80,
                        height: 15,
                      ),

                      //Number
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        width: 80,
                        height: 21,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),

        SizedBox(height: 35),

        //Case Progress Bars
        Column(
          children: <Widget>[

            Text(
              "Overall Statistics",
              style: TextStyle(
                fontSize: 22,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w700,
                color: Colors.grey[800],
              ),
            ),

            SizedBox(height: 20),

            //Total active progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 65,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 50,
                  ),

                ],
              ),
            ),

            SizedBox(height: 10),

            //Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),
            ),

            SizedBox(height: 20),

            //Total Recovered Progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 80,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 45,
                  ),

                ],
              ),
            ),

            SizedBox(height: 10),

            //Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),
            ),

            SizedBox(height: 20),

            //Total Death Progress
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 65,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 14,
                    width: 42,
                  ),

                ],
              ),
            ),

            SizedBox(height: 10),

            //Slider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),
            ),
          ],
        ),

        SizedBox(height: 35),

        //Set as default button
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(6),
              ),
              height: 20,
              width: 120,
            ),
          ),
        ),
      ],
    );
  }
}
