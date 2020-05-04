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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Divider + DropDown
              Container(
                color: Colors.black,
                height: 2,
              ),
              SizedBox(height: 15),

              //DropDown
              Container(
                width: 200,
                padding: const EdgeInsets.only(left: 5, right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 55,
                child: Center(
                  child: Theme(
                    data: ThemeData(
                      canvasColor: Colors.white,
                    ),
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        itemHeight: 50,
                        value: dropDownValue,
                        style: TextStyle(
                          fontFamily: "Monsterrat",
                          fontSize: 19,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        underline: Container(
                          height: 0,
                        ),
                        elevation: 0,
                        iconSize: 28,
                        icon: Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                        items: <DropdownMenuItem<String>>[
                          DropdownMenuItem(
                            value: "publishedAt",
                            child: Text(
                              "Published Date",
                              style: TextStyle(
                                fontFamily: "Monsterrat",
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Latest",
                            child: Text(
                              "Latest",
                              style: TextStyle(
                                fontFamily: "Monsterrat",
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Last Week",
                            child: Text(
                              "Last Week",
                              style: TextStyle(
                                fontFamily: "Monsterrat",
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Last 15",
                            child: Text(
                              "Last 15 days",
                              style: TextStyle(
                                fontFamily: "Monsterrat",
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          DropdownMenuItem(
                            value: "Last Month",
                            child: Text(
                              "Last Month",
                              style: TextStyle(
                                fontFamily: "Monsterrat",
                                fontSize: 19,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
