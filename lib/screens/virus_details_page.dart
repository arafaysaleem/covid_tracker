import 'package:flutter/material.dart';

class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  const VirusDetailsScreen({Key key, this.imgPath, this.color}) : super(key: key);

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

                //Title
                Positioned.fill(
                  top: 40,
                  left: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                        child: Text(
                        "CoronaVirus",
                        style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 30,
                            fontWeight: FontWeight.w700
                        ),
                    ),
                  ),
                ),

                //Image
                Positioned.fill(
                  right: 10,
                  bottom: 10,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                        tag: imgPath,
                        child: Image(image: AssetImage(imgPath),height: 170.0,)
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
