import 'package:flutter/material.dart';

class BarItem {
  final String text;
  final IconData icon;
  final double iconSize, textSize;
  final Color color;

  BarItem({this.text, this.icon, this.color, this.iconSize=24, this.textSize});
}