import 'package:covidtracker/widgets/home_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryTab> categories = [
    CategoryTab(
      imgPath: "assets/symptoms/symptoms.png",
      tabName: "Symptoms",
      tabDesc: "Top covid-19 symptoms",
      color: Colors.teal[800],
    ),
    CategoryTab(
      imgPath: "assets/prevention/boy.png",
      imgHeight: 140.0,
      imgBottom: 0.0,
      tabName: "Precautions",
      tabDesc: "Top covid-19 symptoms",
      color: Colors.lightBlue,
    ),
    CategoryTab(
      imgPath: "assets/myths.png",
      tabName: "Myths",
      imgBottom: -20.0,
      imgLeft: 25.0,
      imgHeight: 160.0,
      tabDesc: "Top covid-19 myths",
      color: Colors.redAccent[700],
    ),
    CategoryTab(
      imgBottom: 15.0,
      imgLeft: -20.0,
      tabName: "Virus",
      imgHeight: 120.0,
      tabDesc: "Top covid-19 symptoms",
      imgPath: "assets/corona.png",
      color: Colors.orange[700],
    ),
    CategoryTab(
      imgPath: "assets/symptoms/symptoms.png",
      tabName: "Updates",
      tabDesc: "Top covid-19 symptoms",
      color: Colors.greenAccent[700],
    ),
    CategoryTab(
      imgLeft: -45.0,
      imgBottom: 10.0,
      imgHeight: 120.0,
      imgPath: "assets/stats.png",
      tabName: "Statistics",
      tabDesc: "Top covid-19 symptoms",
      color: Colors.deepPurpleAccent,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Home",
          style: TextStyle(
              fontFamily: "Montserrat",
              color: Colors.black,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: categories,
      )
    );
  }
}
