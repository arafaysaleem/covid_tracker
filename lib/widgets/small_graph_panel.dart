import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'curve_painter.dart';

class SmallGraphPanel extends StatelessWidget {
  final String label;
  final IconData icon;
  final double value;
  final Color startColor;
  final Color fontColor;
  final Color iconColor;
  final Color lineColor;
  final bool isIncreasing;

  SmallGraphPanel({
    @required this.label,
    @required this.icon,
    @required this.value,
    @required this.startColor,
    @required this.fontColor,
    @required this.iconColor,
    @required this.lineColor,
    @required this.isIncreasing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 185,
      height: 62,
      padding: EdgeInsets.only(left: 5, right: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          colors: <Color>[startColor, Colors.white],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //Column of case label and case number
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                //Row of case label and icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    //Case Type Name
                    Text(
                      label,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: "Montserrat",
                        color: fontColor,
                        letterSpacing: 0.3,
                      ),
                    ),

                    //Arrow Icon
                    Icon(
                      icon,
                      size: 21,
                      color: iconColor,
                    )
                  ],
                ),

                //Cases Number
                Text(
                  (value / 1000).toStringAsPrecision(5) + "k",
                  style: TextStyle(
                    color: fontColor,
                    fontFamily: "Montserrat",
                    letterSpacing: 0.3,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            SizedBox(width: 5,),

            //Curve line
            CurvePainter(
              duration: Duration(seconds: 1),
              size: isIncreasing? Size(40, 20): Size(40, 10),
              color: lineColor,
              isIncreasing: isIncreasing,
            ),
          ],
        ),
      ),
    );
  }
}
