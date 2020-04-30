import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SymptomsScreen extends StatelessWidget {
  final imgPath;
  final Color color;
  List<Map<String, String>> symptoms = [
    {
      "symptom": "Fever",
      "desc":
          "A temperature that's higher than normal.\nTypically around 98.6°F (37°C)",
      "imgPath": "assets/symptoms/high_fever.png",
    },
    {
      "symptom": "Sore Throat",
      "desc":
          "A sore throat is a painful, dry, or scratchy feeling in the throat.",
      "imgPath": "assets/symptoms/sore_throat.png",
    },
    {
      "symptom": "Dry Cough",
      "desc": "A cough that doesn't bring up mucus.",
      "imgPath": "assets/symptoms/cough.png",
    },
    {
      "symptom": "Fatigue",
      "desc":
          "You have no energy, no motivation and overall feeling of tiredeness.",
      "imgPath": "assets/symptoms/headache.png",
    },
    {
      "symptom": "Runny Nose",
      "desc": "Mucus draining or dripping from the nostril.",
      "imgPath": "assets/symptoms/high_fever.png",
    },
    {
      "symptom": "Tough Breathing",
      "desc":
          "You feel shortness of breath and a tight sensation in your chest",
      "imgPath": "assets/symptoms/sore_throat.png",
    },
  ];

  SymptomsScreen({this.color, this.imgPath});

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
          //Image container
          Container(
            height: 230,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  bottomRight: Radius.circular(25.0),
                ),
                color: color.withOpacity(0.2)),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                //title
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
                          fontSize: 33,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                //image
                Positioned.fill(
                  bottom: -20.0,
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        padding: EdgeInsets.only(right: 25.0),
                        child: Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: 230.0,
                            ))),
                  ),
                ),
              ],
            ),
          ),

          //Symptom Card
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
                children: symptoms.map((symptom) {
                  return Material(
                    borderRadius: BorderRadius.circular(15.0),
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Image(
                            image: AssetImage(symptom["imgPath"]),
                            height: 95.0,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${symptom["symptom"]}",
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
                              "${symptom['desc']}",
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
