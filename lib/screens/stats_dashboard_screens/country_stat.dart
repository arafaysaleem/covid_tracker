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
                              padding: EdgeInsets.all(9),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.white60,
                                size: 23,
                              ),
                            ),
                          ),

                          //Name and flag
                          Padding(
                            padding: const EdgeInsets.only(top:8,left: 2),
                            child: Row(
                              children: <Widget>[
                                //Flag
                                Image.asset(
                                  widget.flagPath,
                                  width: 37,
                                ),

                                SizedBox(width: 17),

                                //Country Name
                                Text(
                                  widget.countryName,
                                  style: TextStyle(
                                    fontFamily: "Montserrat",
                                    color: Colors.white,
                                    fontSize: 25,
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
                                size: 34,
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 18,
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
                                  fontSize: 40,
                                  letterSpacing: 1.1,
                                  fontWeight: FontWeight.w700),
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

              Positioned(
                top: 170,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 160,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
