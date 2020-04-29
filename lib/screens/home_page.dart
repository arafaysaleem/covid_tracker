import 'package:covidtracker/widgets/home_category.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryTab> categories = [
    CategoryTab(
      imgLeft: 5.0,
      imgBottom: 19.0,
      imgHeight: 122.0,
      imgPath: "assets/stats.png",
      tabName: "Statistics",
      tabDesc: "See how it is affecting the world",
      color: Colors.deepPurpleAccent,
    ),
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
      tabDesc: "How to prevent being a victim",
      color: Colors.lightBlue[700],
    ),
    CategoryTab(
      imgPath: "assets/myths/myths.png",
      tabName: "Myths",
      imgBottom: -30.0,
      imgLeft: 20.0,
      imgHeight: 170.0,
      tabDesc: "Get rid of false assumptions",
      color: Colors.redAccent[700],
    ),
    CategoryTab(
      imgBottom: 10.0,
      imgLeft: 3.0,
      tabName: "Virus",
      imgHeight: 130.0,
      tabDesc: "Know more about the virus",
      imgPath: "assets/corona.png",
      color: Colors.orange[700],
    ),
    CategoryTab(
      imgBottom: -4.0,
      imgLeft: 8.0,
      imgPath: "assets/updates.png",
      tabName: "Updates",
      imgHeight: 146.0,
      tabDesc: "View the latest news related to the virus",
      color: Colors.greenAccent[700],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.menu,color: Colors.black,),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.notifications_active,color: Colors.black,),
            )
          ],
          centerTitle: true,
          title: Text(
            "Covid-19 Tracker",
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Montserrat",
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: categories,
        ));
  }
}
