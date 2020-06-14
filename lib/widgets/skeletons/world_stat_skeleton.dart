import 'package:flutter/material.dart';

class WorldStatLoader extends StatefulWidget {
  @override
  _WorldStatLoaderState createState() => _WorldStatLoaderState();
}

class _WorldStatLoaderState extends State<WorldStatLoader> with SingleTickerProviderStateMixin{
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
      child: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          //Back Arrow And Title
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Back Arrow
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                    size: 30,
                  ),
                ),

                SizedBox(
                  width:
                      MediaQuery.of(context).size.width > 360.0 ? 50.0 : 35.0,
                ),

                //Text
                Container(
                  height: 30,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 12),

          //Image Container
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 8,
                      width: double.infinity,
                    ),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),

          //Radial & Global Cases Container
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 308,
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Row of Case Types
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Active Cases
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                            width: 85,
                            height: 40,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width > 360.0
                                ? 20
                                : 10,
                          ),

                          //Deaths
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: 85,
                            height: 40,
                          ),

                          SizedBox(
                            width: MediaQuery.of(context).size.width > 360.0
                                ? 20
                                : 10,
                          ),

                          //Recoveries
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              height: 40,
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    //Row of Radial Dial and Case Count Column
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Radial Progress Indicator
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0, left: 10),
                            child: Container(
                              height: 165,
                              width: 165,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey,
                              ),
                            ),
                          ),

                          SizedBox(width: 10),

                          //Global Case Count Panels
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                //Affected Cases Panel
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey,
                                  ),
                                  height: 60,
                                  width: 155,
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                //Total Type Cases Panel
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey,
                                  ),
                                  height: 60,
                                  width: 155,
                                ),

                                SizedBox(
                                  height: 15,
                                ),

                                //New Cases Panel
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey,
                                  ),
                                  height: 60,
                                  width: 155,
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
                  color: Colors.grey[300],
                ),
                height: 225,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey,
                  ),
                  height: double.infinity,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
