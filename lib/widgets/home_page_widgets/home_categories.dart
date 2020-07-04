import 'package:flutter/material.dart';
import 'home_category.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  const HomeCategories();
  static AutoSizeGroup titleGrp=AutoSizeGroup();
  static AutoSizeGroup descGrp=AutoSizeGroup();

  static List<Map<String,dynamic>> categoryData=[
    {
      "imgLeft": 5.0,
      "imgBottom": 19.0,
      "imgHeight": 122.0,
      "imgPath": "assets/stats.png",
      "tabName": "Statistics",
      "tabDesc": "See how it is affecting the world",
      "color": Colors.deepPurpleAccent,
    },
    {
      "imgLeft": 15.0,
      "imgBottom": -8.0,
      "imgHeight": 150.0,
      "imgPath": "assets/symptoms/symptoms.png",
      "tabName": "Symptoms",
      "tabDesc": "Top covid-19 symptoms",
      "color": Colors.teal[800],
    },
    {
      "imgPath": "assets/prevention/boy.png",
      "imgHeight": 140.0,
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "tabName": "Precautions",
      "tabDesc": "How to prevent being a victim",
      "color": Colors.lightBlue[700],
    },
    {
      "imgPath": "assets/myths/myths.png",
      "tabName": "Myths",
      "imgBottom": -30.0,
      "imgLeft": 20.0,
      "imgHeight": 170.0,
      "tabDesc": "Get rid of false assumptions",
      "color": Colors.redAccent[700],
    },
    {
      "imgBottom": 10.0,
      "imgLeft": 3.0,
      "tabName": "Virus",
      "imgHeight": 130.0,
      "tabDesc": "Know more about the virus",
      "imgPath": "assets/corona.png",
      "color": Colors.orange[700],
    },
    {
      "imgBottom": -4.0,
      "imgLeft": 8.0,
      "imgPath": "assets/updates/updates.png",
      "tabName": "Updates",
      "imgHeight": 146.0,
      "tabDesc": "View the latest news related to the virus",
      "color": Colors.greenAccent[700],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: categoryData.length,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
        var cat=categoryData[index];
        return CategoryTab(
          titleGrp: titleGrp,
          descGrp: descGrp,
          imgPath: cat["imgPath"],
          imgBottom: cat["imgBottom"],
          imgHeight: cat["imgHeight"],
          imgLeft: cat["imgLeft"],
          tabDesc: cat["tabDesc"],
          tabName: cat["tabName"],
          color: cat["color"],
        );
      },
    );
  }

}
