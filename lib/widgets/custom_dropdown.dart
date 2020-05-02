import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final String text;

  const CustomDropdown({Key key, @required this.text}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey;
  double height, width, xPos, yPos;
  bool isDropped = false;
  OverlayEntry floatingDropdown;

  @override
  void initState() {
    super.initState();
    actionKey = LabeledGlobalKey(widget.text);
  }

  void findDropdownData() {
    RenderBox renderBox = actionKey.currentContext.findRenderObject();
    height = renderBox.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPos = offset.dx;
    yPos = offset.dy;
  }

  OverlayEntry _floatingDropdown() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPos,
        width: width,
        top: yPos + height,
        height: height * 4 + 40,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isDropped) {
          floatingDropdown.remove();
        } else {
          findDropdownData();
          floatingDropdown = _floatingDropdown();
          Overlay.of(context).insert(floatingDropdown);
        }

        setState(() {
          isDropped = !isDropped;
        });
      },
      child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey,
          ),
          child: Row(
            children: <Widget>[
              Text(
                "${widget.text}",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Spacer(),
              IconButton(
                icon: Icon(Icons.arrow_drop_down),
                onPressed: () {},
              )
            ],
          )),
    );
  }
}

class Dropdown extends StatelessWidget {
  final double itemHeight;

  const Dropdown({Key key, this.itemHeight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 5),
          child: Icon(Icons.arrow_drop_up),
        ),
        Material(
          elevation: 20,
          child: Container(
            height: 4 * itemHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: <Widget>[
                DropDownItem(
                  text: "Latest",
                  value: "publishedAt",
                  isSelected: true,
                  isFirst: true,
                ),
                DropDownItem(
                  text: "Last Week",
                  value: "7",
                  isSelected: false,
                ),
                DropDownItem(
                  text: "Last 15 days",
                  value: "15",
                  isSelected: false,
                ),
                DropDownItem(
                  text: "Last Month",
                  value: "30",
                  isLast: true,
                  isSelected: false,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DropDownItem extends StatelessWidget {
  final text, isSelected, value, isFirst, isLast;

  const DropDownItem(
      {Key key,
      this.text,
      this.isSelected,
      this.value,
      this.isFirst = false,
      this.isLast = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(isFirst ? 10.0 : 0),
          bottom: Radius.circular(isLast ? 10.0 : 0.0),
        ),
        color: isSelected ? Colors.grey[700] : Colors.grey,
      ),
      padding: EdgeInsets.all(10),
      child: Text(
        "$text",
        style: TextStyle(
          fontSize: 20,
          fontFamily: "Montserrat",
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
