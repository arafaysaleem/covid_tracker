import '../widgets/home_page_widgets/symptom_card_grid.dart';
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
                        padding: const EdgeInsets.only(right: 20.0),
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
            child: SymptomCardGrid(),
          )
        ],
      ),
    );
  }
}

