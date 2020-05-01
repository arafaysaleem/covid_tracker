import 'package:flutter/material.dart';

class UpdatesScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  UpdatesScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  String dropDownValue = "Latest";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          "Covid-19 Updates",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              height: 50,
              child: DropdownButton<String>(
                value: dropDownValue,
                style: TextStyle(
                  fontFamily: "Monsterrat",
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
                underline: Container(
                  height: 0,
                ),
                elevation: 0,
                iconSize: 26,
                icon: Icon(Icons.arrow_drop_down),
                items: <DropdownMenuItem<String>>[
                  DropdownMenuItem(
                    value: "publishedAt",
                    child: Text("Published Date"),
                  ),
                  DropdownMenuItem(
                    value: "Latest",
                    child: Text(
                      "Latest",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Last Week",
                    child: Text(
                      "Last Week",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Last 15",
                    child: Text(
                      "Last 15 days",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: "Last Month",
                    child: Text(
                      "Last Month",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
                onChanged: (String newValue) {
                  setState(() {
                    dropDownValue = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
