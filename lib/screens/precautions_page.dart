import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PrecautionsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  List<Map<String, String>> preventions = [
    {
      "prevention": "Protective Mask",
      "desc":
      "Always remember to wear a protective mask when stepping out.",
      "imgPath": "assets/prevention/mask.png",
    },
    {
      "prevention": "Wash Hands",
      "desc": "Wash your hands often with soap and water and for 20 seconds atleast.",
      "imgPath": "assets/prevention/wash.png",
    },
    {
      "prevention": "Cover Cough",
      "desc": "Cough or sneeze into your elbow or cover your mouth with a disposable napkin.",
      "imgPath": "assets/prevention/coughCover.png",
    },
    {
      "prevention": "Sanitize Often",
      "desc": "Use alchohol based sanitizer if water and soap are unavailable.",
      "imgPath": "assets/prevention/sanitizer.png",
    },
    {
      "prevention": "No Face Touching",
      "desc": "Don't touch your eyes, nose or mouth often and with unwashed hands.",
      "imgPath": "assets/prevention/touch.png",
    },
    {
      "prevention": "Social Distancing",
      "desc":
      "Keep 7m distance from other people. Stay at home and avoid gatherings.",
      "imgPath": "assets/prevention/socialDistance.png",
    },
  ];

  PrecautionsScreen({this.imgPath, this.color});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //image container
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
            ),
            child: Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
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
                            fontSize: 33,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    bottom: -25.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Hero(
                          tag: imgPath,
                          child: Image(
                            image: AssetImage(imgPath),
                            height: 230.0,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Precaution Card Grid
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              width: 360.0,
              child: GridView.count(
                physics: BouncingScrollPhysics(),
                padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 15.0,
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                childAspectRatio: 0.70,
                children: preventions.map((prevention) {
                  print(MediaQuery.of(context).size.width);
                  return Material(
                    borderRadius: BorderRadius.circular(15.0),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 16, 14, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image(
                            image: AssetImage(prevention["imgPath"]),
                            height: 100.0,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${prevention["prevention"]}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Expanded(
                            child: Text(
                              "${prevention['desc']}",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: "Montserrat",
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
