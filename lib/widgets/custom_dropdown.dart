import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {

  final String text;

  const CustomDropdown({Key key, @required this.text}) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  GlobalKey actionKey;
  double height,width,xPos,yPos;
  bool isDropped=false;

  @override
  void initState() {
    super.initState();
    actionKey=LabeledGlobalKey(widget.text);

  }

  void findDropdownData(){
    RenderBox renderBox=actionKey.currentContext.findRenderObject();
    height=renderBox.size.height;
    width=renderBox.size.width;
    Offset offset=renderBox.localToGlobal(Offset.zero);
    xPos=offset.dx;
    yPos=offset.dy;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            findDropdownData();

            setState(() {
              isDropped=!isDropped;
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
