import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SymptomCardGrid extends StatefulWidget {
  @override
  _SymptomCardGridState createState() => _SymptomCardGridState();
}

class _SymptomCardGridState extends State<SymptomCardGrid> {
  int selectedIndex=0;
  final List<Map<String, String>> symptoms = const [
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

  static AutoSizeGroup titleGrp=AutoSizeGroup();
  static AutoSizeGroup descGrp=AutoSizeGroup();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360.0,
      child: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding:
        const EdgeInsets.symmetric(horizontal: 14.0, vertical: 20.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 15.0,
          crossAxisCount: 2,
          childAspectRatio: 0.70,
        ),
        scrollDirection: Axis.vertical,
        itemCount: symptoms.length,
        itemBuilder: (context,index){
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
                child: LayoutBuilder(
                  builder: (ctx, constraint) => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Image(
                        image: AssetImage(symptoms[index]["imgPath"]),
                        height: constraint.maxHeight * 0.46,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight * 0.1,
                        child: AutoSizeText(
                          "${symptoms[index]["symptom"]}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontFamily: "Montserrat",
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                          maxFontSize: 14,
                          maxLines: 1,
                          minFontSize: 11,
                          stepGranularity: 1,
                          group: titleGrp,
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      LimitedBox(
                        maxHeight: constraint.maxHeight*0.30,
                        child: AutoSizeText(
                          "${symptoms[index]['desc']}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            fontFamily: "Montserrat",
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                          maxFontSize: 12,
                          minFontSize: 9,
                          group: descGrp,
                          stepGranularity: 1,
                          maxLines: 4,
                        ),
                      ),
                      SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
