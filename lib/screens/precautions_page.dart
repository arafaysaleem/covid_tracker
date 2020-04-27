import 'package:flutter/material.dart';

class PrecautionsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  const PrecautionsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()=>Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back,color: color,size: 28,)
          ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          ClipRRect(
              borderRadius: BorderRadius.only(
                bottomRight:Radius.circular(25),
              ),
              child: Container(
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

                  //Name
                  Positioned.fill(
                    top: 40,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                          child: Text(
                          "Precautions",
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
                      bottom: -30.0,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Hero(
                          tag: imgPath,
                          child: Image(image: AssetImage(imgPath),height: 210.0,)
                          ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
