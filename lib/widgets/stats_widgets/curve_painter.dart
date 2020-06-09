import 'dart:math';
import 'package:flutter/material.dart';

class CurvePainter extends StatefulWidget {
  final Size size;
  final Duration duration;
  final Color color;
  final bool isIncreasing;

  CurvePainter({this.size, this.duration, this.color, this.isIncreasing});

  @override
  _CurvePainterState createState() => _CurvePainterState();
}

class _CurvePainterState extends State<CurvePainter>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _widthAnimation;
  Animation<double> _curveAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _widthAnimation = Tween<double>(begin: 0, end: widget.size.width).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _curveAnimation = Tween<double>(begin: 0, end: 2 * pi).animate(
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn));
    _controller.forward();
  }

  @override
  void didUpdateWidget(CurvePainter oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.color!=widget.color){
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height,
      width: widget.size.width,
      child: Stack(
        children: <Widget>[
          //Container for curve
          Container(
            width: widget.size.width,
            height: widget.size.height,
            color: Colors.transparent,
          ),

          //Painter for Curve line
          Transform.rotate(
            angle: widget.isIncreasing ? -pi / 5 : pi / 4,
            child: AnimatedBuilder(
              animation: _widthAnimation,
              builder: (ct, _) {
                return AnimatedBuilder(
                  animation: _curveAnimation,
                  builder: (ctx, _) {
                    return CustomPaint(
                      size: Size(_widthAnimation.value, widget.size.height),
                      painter: MyPainter(_curveAnimation.value, widget.color),
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
