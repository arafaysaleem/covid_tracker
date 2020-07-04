import 'package:auto_size_text/auto_size_text.dart';

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
            children: <Widget>[

              AnimatedBarItem(
                currBarItem: widget.currBarItem,
                isSelected: widget.currBarItem == 0,
                animationDuration: widget.animationDuration,
                barItem: widget.barItems[0],
                elevation: widget.elevation,
                onItemTap: widget.onItemTap,
                thisItemIndex: 0,
              ),

              AnimatedBarItem(
                currBarItem: widget.currBarItem,
                isSelected: widget.currBarItem == 1,
                animationDuration: widget.animationDuration,
                barItem: widget.barItems[1],
                elevation: widget.elevation,
                onItemTap: widget.onItemTap,
                thisItemIndex: 1,
              ),

              AnimatedBarItem(
                currBarItem: widget.currBarItem,
                isSelected: widget.currBarItem == 2,
                animationDuration: widget.animationDuration,
                barItem: widget.barItems[2],
                elevation: widget.elevation,
                onItemTap: widget.onItemTap,
                thisItemIndex: 2,
              ),

              AnimatedBarItem(
                currBarItem: widget.currBarItem,
                isSelected: widget.currBarItem == 3,
                animationDuration: widget.animationDuration,
                barItem: widget.barItems[3],
                elevation: widget.elevation,
                onItemTap: widget.onItemTap,
                thisItemIndex: 3,
              ),
            ],
          ),
        ),
    );
  }
}

// ignore: must_be_immutable
class AnimatedBarItem extends StatefulWidget {
  bool isSelected;int currBarItem;BarItem barItem;
  int thisItemIndex;
  final Duration animationDuration;
  final double elevation;
  final ValueChanged<int> onItemTap;
  
  AnimatedBarItem({this.isSelected, this.thisItemIndex,this.barItem,this.currBarItem,this.animationDuration, this.elevation, this.onItemTap});
  @override
  _AnimatedBarItemState createState() => _AnimatedBarItemState();
}

class _AnimatedBarItemState extends State<AnimatedBarItem> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      padding: widget.isSelected? EdgeInsets.symmetric(horizontal: 18, vertical: 8) :EdgeInsets.symmetric(horizontal: 0,vertical: 8),
      duration: widget.animationDuration,
      decoration: BoxDecoration(
        color: widget.isSelected? widget.barItem.color.withOpacity(0.15): Colors.transparent,
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          widget.onItemTap(widget.thisItemIndex);
        },
        child: Row(
          children: <Widget>[
            Icon(
              widget.barItem.icon,
              color: widget.isSelected ? widget.barItem.color : Colors.black,
              size: widget.barItem.iconSize,
            ),
            SizedBox(
              width: 5,
            ),
            AnimatedSize(
              curve: Curves.easeInOut,
              duration: widget.animationDuration,
              vsync: this,
              child: LimitedBox(
                maxWidth: 70,
                child: AutoSizeText(
                  widget.isSelected ? "${widget.barItem.text}" : "",
                  style: TextStyle(
                    color: widget.barItem.color,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w600,
                    fontSize: widget.barItem.textSize,
                  ),
                  maxFontSize: widget.barItem.textSize,
                  maxLines: 1,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

