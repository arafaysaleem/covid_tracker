import 'package:flutter/material.dart';

class CountryListLoader extends StatefulWidget {
  @override
  _CountryListLoaderState createState() => _CountryListLoaderState();
}

class _CountryListLoaderState extends State<CountryListLoader> with SingleTickerProviderStateMixin{
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller=AnimationController(vsync: this,duration: Duration(milliseconds: 700),lowerBound: 0.5)
      ..addStatusListener((status) {
        if(status==AnimationStatus.completed) _controller.reverse();
        else if(status==AnimationStatus.dismissed) _controller.forward();
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          SizedBox(height: 15),

          //Row 1
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Card 1
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                    height: 170,
                    width: 135,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 43,
                          height: 27,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 30),

                //Card 2
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                    height: 170,
                    width: 135,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 43,
                          height: 27,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          //Row 2
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Card 1
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                    height: 170,
                    width: 135,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 43,
                          height: 27,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(width: 30),

                //Card 2
                Material(
                  elevation: 7,
                  borderRadius: BorderRadius.circular(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.grey[300],
                    ),
                    height: 170,
                    width: 135,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 43,
                          height: 27,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 16,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                          width: 90,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 25),

          //Row 3
          Flexible(
            fit: FlexFit.loose,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Card 1
                  Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      height: 170,
                      width: 135,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                            width: 43,
                            height: 27,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            width: 90,
                            height: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                            width: 90,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 30),

                  //Card 2
                  Material(
                    elevation: 7,
                    borderRadius: BorderRadius.circular(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Colors.grey[300],
                      ),
                      height: 170,
                      width: 135,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                            width: 43,
                            height: 27,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.grey,
                            ),
                            width: 90,
                            height: 16,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey,
                            ),
                            width: 90,
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
