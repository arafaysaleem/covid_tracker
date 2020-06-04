import '../widgets/home_categories.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        //TODO: Add a drawer
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_active,
              color: Colors.black,
            ),
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
      body: HomeCategories(),
    );
  }
}
