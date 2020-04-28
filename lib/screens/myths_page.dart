import 'package:flutter/material.dart';

class MythsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  const MythsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,size: 20,)
          ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Myths",
          style: TextStyle(
              fontFamily: "Montserrat",
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2)
            ),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  top: 40,
                  left: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                        child: Text(
                        "Symptoms",
                        style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                        ),
                    ),
                  ),
                ),
                Positioned.fill(
                    bottom: -20.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                      padding: EdgeInsets.only(right:25.0),
                        child: Hero(
                          tag: imgPath,
                          child: Image(image: AssetImage(imgPath),height: 210.0,)
                          )
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
