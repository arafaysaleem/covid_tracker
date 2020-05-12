import 'dart:math';
import 'package:flutter/material.dart';

class CurvePainter extends StatelessWidget {
  final Size size;
  final Duration duration;
  final Color color;
  final bool isIncreasing;

  CurvePainter({this.size, this.duration, this.color, this.isIncreasing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height,
      width: size.width,
      child: Stack(
        children: <Widget>[
          //Container for curve
          Container(
            width: size.width,
            height: size.height,
            color: Colors.transparent,
          ),

          //Painter for Curve line
          Transform.rotate(
            angle: isIncreasing ? -pi / 5 : pi / 4,
            child: TweenAnimationBuilder(
              duration: duration,
              tween: Tween<double>(begin: 0, end: size.width),
              builder: (ct, val, _) {
                return TweenAnimationBuilder(
                  duration: duration,
                  tween: Tween<double>(begin: 0, end: 2 * pi),
                  builder: (ctx, value, _) {
                    return CustomPaint(
                      size: Size(val, size.height),
                      painter: MyPainter(value, color),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double value;
  final Color color;

  MyPainter(this.value, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    List<Offset> offsets = [];
    for (int i = 0; i < size.width; i++) {
      double y = sin((value * i) / size.width);
      offsets.add(
        Offset(i.toDouble(), -y * (size.height / 4) + size.height / 2),
      );
    }
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    Path path = Path()..moveTo(0, 50);
    path.addPolygon(offsets, false);
    Paint circle = Paint()..color = color;
    if (offsets.length > 1) {
      canvas.drawCircle(offsets[offsets.length - 1], 2, circle);
    }
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
