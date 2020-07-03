import 'package:flutter/material.dart';

class CountryStatLoader extends StatefulWidget {
  final Color color;
  final bool isDefault;

  const CountryStatLoader({Key key, this.color, this.isDefault}) : super(key: key);


  @override
  _CountryStatLoaderState createState() => _CountryStatLoaderState();
}

class _CountryStatLoaderState extends State<CountryStatLoader> with TickerProviderStateMixin{
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
    return Column(
      mainAxisSize: MainAxisSize.max,
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
            SizedBox(width: 25),

            Text(
              "Yesterday",
              style: TextStyle(
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
                fontSize: 15.4,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        //Case Boxes
        FadeTransition(
          opacity: _controller,
          child: Column(
            children: <Widget>[
              //Row of affected and deaths
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[

                  //New Affected
                  Expanded(
                    child: Container(
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(13),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[

                          //Title
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(13),
                            ),
                            width: 95,
                            height: 15,
                          ),

                          //Number
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            width: 75,
                            height: 21,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(width: 13),

                  //New Deaths
                  Container(
                    width: 145,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Title
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: 80,
                          height: 15,
                        ),

                        //Number
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: 45,
                          height: 21,
                        ),
                      ],
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
                  Container(
                    width: 145,
                    height: 95,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(13),
                    ),
                    padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //Title
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: 100,
                          height: 15,
                        ),

                        //Number
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(7),
                          ),
                          width: 100,
                          height: 21,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(width: 13),

                  //New Recovered || Probability
                  Expanded(
                    child: Container(
                      width:175,
                      height: 95,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(13),
                      ),
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Title
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            width: 80,
                            height: 15,
                          ),

                          //Number
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(7),
                            ),
                            width: 75,
                            height: 21,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        SizedBox(height: 25),

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

            SizedBox(height: 10),

            FadeTransition(
              opacity: _controller,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 16),
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(13),
                ),
                child: Column(
                  children: <Widget>[
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
                            height: 12,
                            width: 65,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 12,
                            width: 50,
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    //Slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
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
                            height: 12,
                            width: 80,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 12,
                            width: 45,
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    //Slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
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
                            height: 12,
                            width: 65,
                          ),

                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            height: 12,
                            width: 42,
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 12),

                    //Slider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        width: double.infinity,
                        height: 5,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        Expanded(child: SizedBox(height: 20)),

        //Set as default button
        if(!widget.isDefault) Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: widget.color,
            borderRadius: BorderRadius.circular(13),
          ),
          child: Center(
            child: const Text(
              "Set as default",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
