import '../../models/bottom_bar_item.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnimatedBottomBar extends StatefulWidget {
  final List<BarItem> barItems;
  int currBarItem;
  final Duration animationDuration;
  final double elevation;
  final ValueChanged<int> onItemTap;

  AnimatedBottomBar(
      {this.barItems,
        this.animationDuration = const Duration(milliseconds: 500),
        this.elevation,this.onItemTap, this.currBarItem});

  @override
  _AnimatedBottomBarState createState() => _AnimatedBottomBarState();
}

class _AnimatedBottomBarState extends State<AnimatedBottomBar> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: widget.elevation,
      child: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _barItemBuilder(),
        ),
      ),
    );
  }

  List<Widget> _barItemBuilder() {
    List<Widget> barWidgets = [];
    for (int i = 0; i < widget.barItems.length; i++) {
      BarItem barItem = widget.barItems[i];
      bool isSelected = widget.currBarItem == i;
      barWidgets.add(AnimatedContainer(
        padding: isSelected? const EdgeInsets.symmetric(horizontal: 18, vertical: 8) :const EdgeInsets.symmetric(horizontal: 0,vertical: 8),
        duration: widget.animationDuration,
        decoration: BoxDecoration(
          color: isSelected? barItem.color.withOpacity(0.15): Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {
            widget.onItemTap(i);
          },
          child: Row(
            children: <Widget>[
              Icon(
                barItem.icon,
                color: isSelected ? barItem.color : Colors.black,
                size: barItem.iconSize,
              ),
              SizedBox(
                width: 5,
              ),
              AnimatedSize(
                curve: Curves.easeInOut,
                duration: widget.animationDuration,
                vsync: this,
                child: Text(
                  isSelected ? "${barItem.text}" : "",
                  style: TextStyle(
                      color: barItem.color,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      fontSize: barItem.textSize,
                  ),
                ),
              )
            ],
          ),
        ),
      ));
    }

    return barWidgets;
  }
}
