import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'curve_painter.dart';

class SmallGraphPanel extends StatelessWidget {
  final String label;
  final IconData icon;
  final double value;
  final Size size;
  final Color startColor;
  final Color fontColor;
  final Color iconColor;
  final Color lineColor;

  SmallGraphPanel({
    @required this.label,
    @required this.icon,
    @required this.value,
    @required this.size,
    @required this.startColor,
    @required this.fontColor,
    @required this.iconColor,
    @required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      width: 160,
      height: 65,
      padding: EdgeInsets.only(left:5,right: 10),
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
          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                        fontSize: 15,
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
                  (value/1000).toStringAsPrecision(5)+"k",
                  style: TextStyle(
                    color: fontColor,
                    fontFamily: "Montserrat",
                    letterSpacing: 0.3,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),

            //Curve line
            CurvePainter(
              duration: Duration(seconds: 1),
              size: Size(40,20),
              color: lineColor,
              isIncreasing: true,
            ),

          ],
        ),
      ),
    );
  }
}
