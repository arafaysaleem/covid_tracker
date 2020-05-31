import 'package:flutter/material.dart';

class CaseBars extends StatefulWidget {
  final color;

  const CaseBars({Key key, this.color}) : super(key: key);

  @override
  _CaseBarsState createState() => _CaseBarsState();
}

class _CaseBarsState extends State<CaseBars> {
  Duration _progressDuration=Duration(milliseconds: 300);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        Text(
          "Overall Statistics",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w600,
            color: Colors.grey[800],
          ),
        ),

        SizedBox(height: 20),

        //Total active progress
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                ),
                width: 8,
                height: 8,
              ),

              SizedBox(width: 15),

              Expanded(
                child: Text(
                  "Total Active",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),

              Text(
                "30,076",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),

            ],
          ),
        ),

        SizedBox(height: 10),

        //Slider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),

              AnimatedContainer(
                duration: _progressDuration,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 250,
                height: 5,
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        //Total Recovered Progress
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                ),
                width: 8,
                height: 8,
              ),

              SizedBox(width: 15),

              Expanded(
                child: Text(
                  "Total Recovered",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),

              Text(
                "10,114",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),

            ],
          ),
        ),

        SizedBox(height: 10),

        //Slider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),

              AnimatedContainer(
                duration: _progressDuration,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 136,
                height: 5,
              ),
            ],
          ),
        ),

        SizedBox(height: 20),

        //Total Death Progress
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(2),
                ),
                width: 8,
                height: 8,
              ),

              SizedBox(width: 15),

              Expanded(
                child: Text(
                  "Total Deaths",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                ),
              ),

              Text(
                "2,004",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
              ),

            ],
          ),
        ),

        SizedBox(height: 10),

        //Slider
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: double.infinity,
                height: 5,
              ),

              AnimatedContainer(
                duration: _progressDuration,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(5),
                ),
                width:70,
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
