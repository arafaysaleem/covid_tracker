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
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: <Color>[startColor, Colors.white],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                children: <Widget>[

                  //Case Type Name
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 10,
                      fontFamily: "Montserrat",
                      color: fontColor,
                    ),
                  ),

                  //Arrow Icon
                  Icon(
                    icon,
                    size: 16,
                    color: iconColor,
                  )
                ],
              ),

              //Cases Number
              Text(
                (value/1000).toStringAsPrecision(5),
                style: TextStyle(
                  color: fontColor,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),

          SizedBox(
            width: 5,
          ),

          //Curve line
          CurvePainter(
            duration: Duration(seconds: 1),
            size: size,
            color: lineColor,
            isIncreasing: true,
          ),

          // Stack(
          //   children: <Widget>[
          //     ClipPath(
          //      clipper: GradientClipper(offsets: offsets),
          //       child: Container(
          //         height: size.height,
          //         width: size.width,
          //         decoration: BoxDecoration(
          //           gradient: LinearGradient(
          //             colors: [
          //               //Color(0xffffb8ba),
          //               //Color(0xfffbe7e8)
          //               lineShadowColor,
          //               startColor
          //             ],
          //             begin: Alignment.topCenter,
          //             end: Alignment.bottomCenter
          //           ),
          //           //border: Border(top: BorderSide(color: Colors.red,width: 2))
          //         ),
          //       ),
          //     ),
          //     CustomPaint(
          //       painter: LinePainter(
          //         color: lineColor,
          //         offsets: offsets,
          //         lineWidth: 1
          //       ),
          //       size: size,
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
