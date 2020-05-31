import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class CountryStatScreen extends StatefulWidget {
  final color, countryName, flagPath, isIncreasing, totalCases;

  const CountryStatScreen(
      {Key key,
      this.color,
      this.countryName,
      this.flagPath,
      this.isIncreasing,
      this.totalCases})
      : super(key: key);

  @override
  _CountryStatScreenState createState() => _CountryStatScreenState();
}

class _CountryStatScreenState extends State<CountryStatScreen> {
  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: widget.color,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              //Country Details
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      //Flag and Name
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Back Button
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.white60,
                                    width: 1.8,
                                  )),
                              margin: EdgeInsets.only(left: 20),
                              padding: EdgeInsets.all(7),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white60,
                                size: 21,
                              ),
                            ),
                          ),

                          //Name and flag
                          Padding(
                            padding: const EdgeInsets.only(top:6,left: 4),
                            child: Row(
                              children: <Widget>[
                                //Flag
                                Image.asset(
                                  widget.flagPath,
                                  width: 32,
                                ),

                                SizedBox(width: 10),

                                //Country Name
                                Text(
                                  widget.countryName,
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),

                          //Filter Icon
                          Padding(
                            padding: const EdgeInsets.only(right: 13,top: 3),
                            child: InkWell(
                              child: Icon(
                                Icons.tune,
                                color: Colors.white60,
                                size: 30,
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 30,
                      ),

                      //Number of Cases
                      Padding(
                        padding: const EdgeInsets.only(left: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Number
                            Text(
                              formatter.format(widget.totalCases),
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  color: Colors.white,
                                  fontSize: 37,
                                  letterSpacing: 1.1,
                                  fontWeight: FontWeight.w600),
                            ),

                            SizedBox(
                              width: 10,
                            ),

                            //Arrow
                            Icon(
                              widget.isIncreasing
                                  ? Icons.arrow_upward
                                  : Icons.arrow_downward,
                              color: Colors.white,
                              size: 28,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),


              //White Details Card
              Positioned(
                top: 170,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: <Widget>[
                        
                        //Today / Yesterday Title
                        Text(
                          "Last 24 Hours",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "Montserrat",
                            fontWeight: FontWeight.w700,
                            color: widget.color,
                          ),
                        ),

                        SizedBox(height: 7),

                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          color: widget.color,
                          height: 2,
                          width: double.infinity,
                        ),

                        SizedBox(height: 15),

                        //Row of affected and deaths
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            //New Affected
                            Container(
                              width:175,
                              height: 95,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Affected",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "30000",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: 10),

                            //New Deaths
                            Expanded(
                              child: Container(
                                height: 95,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Deaths",
                                      style: TextStyle(
                                        fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                        color: widget.color,
                                      ),
                                    ),
                                    Text(
                                      "30000",
                                      style: TextStyle(
                                        fontSize: 23,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                        color: widget.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10),

                        //Row of Tested and recovered
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            //New tested
                            Expanded(
                              child: Container(
                                height: 95,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(13),
                                ),
                                padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "Tested",
                                      style: TextStyle(
                                        fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                        color: widget.color,
                                      ),
                                    ),
                                    Text(
                                      "30000",
                                      style: TextStyle(
                                        fontSize: 23,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                        color: widget.color,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            SizedBox(width: 10),

                            //New Recovered
                            Container(
                              width:175,
                              height: 95,
                              decoration: BoxDecoration(
                                color: widget.color,
                                borderRadius: BorderRadius.circular(13),
                              ),
                              padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Recovered",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "30000",
                                    style: TextStyle(
                                      fontSize: 23,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
