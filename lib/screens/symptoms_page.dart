import 'package:flutter/material.dart';

//ignore: must_be_immutable
class SymptomsScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  SymptomsScreen({this.color, this.imgPath});

  @override
  _SymptomsScreenState createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  int selectedIndex=0;

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
              color: widget.color,
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
                color: widget.color.withOpacity(0.2)),
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                //title
                Positioned.fill(
                  top: 20,
                  left: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Symptoms",
                      style: TextStyle(
                          color: widget.color,
                          fontFamily: "Montserrat",
                          fontSize: 31,
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
                        padding: EdgeInsets.only(right: 20.0),
                        child: Hero(
                            tag: widget.imgPath,
                            child: Image(
                              image: AssetImage(widget.imgPath),
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
                children: symptoms.asMap().entries.map((MapEntry entry) {
                  int index=entry.key;
                  return GestureDetector(
                    onTap: (){
                      setState(() {
                        selectedIndex=index;
                      });
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(15.0),
                      elevation: 5,
                      child: AnimatedContainer(
                        curve: Curves.fastOutSlowIn,
                        duration: Duration(milliseconds: 650),
                        decoration: BoxDecoration(
                          color: selectedIndex==index? Colors.teal[50]:Colors.white,
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        padding: const EdgeInsets.fromLTRB(14, 20, 14, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Image(
                              image: AssetImage(entry.value["imgPath"]),
                              height: 95.0,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${entry.value["symptom"]}",
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
                                "${entry.value['desc']}",
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

