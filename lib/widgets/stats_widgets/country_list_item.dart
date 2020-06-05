import '../../screens/stats_dashboard_screens/country_stat.dart';
import '../../models/item_color_data.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class CountryListItem extends StatelessWidget {
  static final formatter = NumberFormat("#,###");
  final double height;
  final ItemColorData itemColorData;
  final bool isIncreasing;
  final String countryName;
  final String countryCode;
  final String flagPath;
  final int value;

  const CountryListItem({
    this.height,
    this.countryName,
    this.countryCode,
    this.itemColorData,
    this.flagPath,
    this.isIncreasing = false,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    double width = height * (2 / 3) + 15;
    Size size = Size(width, height / 2);
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>CountryStatScreen(
            color: itemColorData.backgroundColor,
            countryName: countryName,
            countryCode: countryCode,
            totalCases: value,
            isIncreasing: isIncreasing,
            flagPath: flagPath,
          ),
        ));
      },
      child: UnconstrainedBox(
        alignment: Alignment.topCenter,
        child: Material(
          elevation: 7,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: itemColorData.backgroundColor,
                borderRadius: BorderRadius.circular(20)),
            child: Stack(
              children: <Widget>[

                //Gradient
                Align(
                  alignment: Alignment(0, 1),
                  child: ClipPath(
                    clipper: GradientBoxClipper(),
                    child: Container(
                      height: size.height,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(bottom: Radius.circular(20)),
                        gradient: LinearGradient(
                            colors: <Color>[
                              itemColorData.gradientColor,
                              itemColorData.backgroundColor,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                    ),
                  ),
                ),

                //Line Graph
                Align(
                  alignment: Alignment(0, 1),
                  child: CustomPaint(
                    painter: CustomLinePainter(
                        color: itemColorData.lineColor, lineWidth: 1),
                    size: Size(size.width, size.height),
                  ),
                ),

                //Country Details Column
                Align(
                  alignment: Alignment(0, -0.65),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[

                      //TODO: Optimize rebuilding of images
                      //Flag
                      Image.asset(
                        flagPath,
                        width: 40,
                      ),

                      SizedBox(
                        height: 8,
                      ),

                      //Country Name
                      Text(
                        countryName,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(
                        height: 4,
                      ),

                      //Number of Cases
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(width:6),

                          //Number
                          Text(
                            formatter.format(value),
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                color: Colors.white,
                                fontSize: 19,
                                letterSpacing: 1,
                                fontWeight: FontWeight.w700),
                          ),

                          SizedBox(
                            width: 3,
                          ),

                          //Arrow
                          Transform.rotate(
                              angle: isIncreasing ? pi / 4 : (pi / 4) * 3,
                              child: Icon(
                                Icons.arrow_upward,
                                color: Colors.white,
                                size: 19.5,
                              ))
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Path getClip(Size size) {
  double width = size.width;
  double height = size.height;
  Path path = Path();
  path.moveTo(0, height / 2);
  path.lineTo(width * 0.65, height * 0.30);
  path.lineTo(width, 0);
  return path;
}

class CustomLinePainter extends CustomPainter {
  final Color color;
  final double lineWidth;

  CustomLinePainter({this.color, this.lineWidth});

  @override
  void paint(Canvas canvas, Size size) {
    Paint path = Paint()
      ..color = color
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;
    canvas.drawPath(getClip(size), path);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class GradientBoxClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.moveTo(0, height / 2);
    path.lineTo(0, height);
    path.lineTo(width, height);
    path.lineTo(width, 0);
    path.lineTo(width * 0.65, height * 0.30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
