import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

class ItemColorData{
  final Color backgroundColor;
  final Color lineColor;
  final Color gradientColor;

  ItemColorData({this.backgroundColor, this.lineColor, this.gradientColor});
}

class CountryListItem extends StatelessWidget {
  final formatter = new NumberFormat("#,###");
  final double height;
  final ItemColorData itemColorData;
  final bool isIncreasing;
  final String countryName;
  final String countrySlug;
  final String countryCode;
  final String flagPath;
  final int value;
  final List<int> last7DayCases;

  CountryListItem({
    this.height,
    this.countryName,
    this.countrySlug,
    this.countryCode,
    this.itemColorData,
    this.flagPath,
    this.isIncreasing=false,
    this.value,
    this.last7DayCases
  });


  @override
  Widget build(BuildContext context) {
    double width = height*(2/3);
    Size size = Size(width, height/2);
    return GestureDetector(
      onTap: (){/*
        Navigator.of(context).pushNamed(
            DetailsScreen.routeName,
            arguments: {
              'slug' : countrySlug,
              'country' : countryName,
              'code' : countryCode
            }
        );
      */},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        width: width,
        decoration: BoxDecoration(
            color: itemColorData.backgroundColor,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(0,1),
              child:
              ClipPath(
                clipper: GradientBoxClipper(),
                child:
                Container(
                  height: size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      gradient: LinearGradient(
                          colors: <Color>[
                            itemColorData.gradientColor,
                            itemColorData.backgroundColor,
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0,1),
              child: CustomPaint(
                painter: CustomLinePainter(
                    color: itemColorData.lineColor,
                    lineWidth: 1
                ),
                size: Size(size.width,size.height),
              ),
            ),
            Align(
              alignment: Alignment(0,-0.6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //Image.asset('assets/usa_flag.png',width: 30,),
                  Image.asset(flagPath,width: 30,),
                  SizedBox(height: 10,),
                  Text(countryName,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500),textAlign: TextAlign.center,),
                  SizedBox(height: 6,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(formatter.format(value),style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.w500),),
                      SizedBox(width: 3,),
                      Transform.rotate(angle: isIncreasing? pi/4 : (pi/4)*3,child: Icon(Icons.arrow_upward,color: Colors.white,size: 15,))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Path getClip(Size size) {
  double width = size.width;
  double height = size.height;
  Path path = Path();
  path.moveTo(0, height/2);
  path.lineTo(width*0.65, height*0.30);
  path.lineTo(width, 0);
  return path;
}

class CustomLinePainter extends CustomPainter {
  final Color color;
  final double lineWidth;
  CustomLinePainter({this.color,this.lineWidth});
  @override
  void paint(Canvas canvas, Size size) {
    Paint path = Paint()..color=color..strokeWidth=lineWidth..style=PaintingStyle.stroke;
    canvas.drawPath(getClip(size), path);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

}

class GradientBoxClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    double width = size.width;
    double height = size.height;
    Path path = Path();
    path.moveTo(0, height/2);
    path.lineTo(0, height);
    path.lineTo(width,height);
    path.lineTo(width, 0);
    path.lineTo(width*0.65, height*0.30);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}