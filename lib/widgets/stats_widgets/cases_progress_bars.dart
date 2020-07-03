import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class CaseBars extends StatefulWidget {
  final color;
  int totalActive,totalDeaths,totalRecovered,totalCases;

  CaseBars({Key key, this.color,this.totalActive,this.totalDeaths,this.totalRecovered,this.totalCases}) : super(key: key);

  @override
  _CaseBarsState createState() => _CaseBarsState();
}

class _CaseBarsState extends State<CaseBars> {
  Duration _progressDuration=Duration(milliseconds: 300);
  final formatter = new NumberFormat("#,###");

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[

        AutoSizeText(
          "Overall Statistics",
          style: TextStyle(
            fontSize: 22,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.w700,
            color: Colors.grey[800],
          ),
          maxFontSize: 22,
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
                child: const AutoSizeText(
                  "Total Active",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                  maxFontSize: 14,
                ),
              ),

              AutoSizeText(
                "${formatter.format(widget.totalActive)}",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
                maxFontSize: 14,
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
                width: widget.totalActive/widget.totalCases*MediaQuery.of(context).size.width,
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
                child: AutoSizeText(
                  "Total Recovered",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                  maxFontSize: 14,
                ),
              ),

              AutoSizeText(
                "${formatter.format(widget.totalRecovered)}",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
                maxFontSize: 14,
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
                width: widget.totalRecovered/widget.totalCases*MediaQuery.of(context).size.width,
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
                child: const AutoSizeText(
                  "Total Deaths",
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF424242),
                  ),
                  maxFontSize: 14,
                ),
              ),

              AutoSizeText(
                "${formatter.format(widget.totalDeaths)}",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Montserrat",
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                ),
                maxFontSize: 14,
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
                width:widget.totalDeaths/widget.totalCases*MediaQuery.of(context).size.width+30,
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
