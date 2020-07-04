import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Introduction",
      "desc":
          "Coronavirus is an enveloped, positive single-strand RNA virus. " +
              "It belongs to the Coronavirus subfamily, as the name, with" +
              " the characteristic “crown-like” spikes on their surfaces.",
    },
    {
      "detail": "Origin",
      "desc": "The virus is believed to have originated late last year in a food market" +
          " in the Chinese city of Wuhan that was illegally selling wildlife. Health" +
          " experts think it may have originated in bats and then passed to humans," +
          " possibly via another animal species.\n\nThere are also reports that the " +
          "intermediate host could be pangolins."
    },
    {
      "detail": "How dangerous is it?",
      "desc": "Coronavirus infections have a several of symptoms, including fever, " +
          "cough, shortness of breath, and breathing difficulties.\n\nIt is unclear how deadly" +
          " the new virus is. Although severe cases can cause pneumonia and death, there may" +
          " be many cases of milder disease going undetected. Many of those who have died had" +
          " prior medical conditions or were elderly with weakened immune systems.",
    },
    {
      "detail": "How is it transmitted?",
      "desc": "The new coronavirus can be transmitted from person to person, although it is" +
          " not clear how easily that happens.\n\nTransmission happens most likely through close contact" +
          " with an infected person via particles in the air from coughing or sneezing, or by " +
          "someone touching an infected person or object with the virus on it and then touching" +
          " their mouth, nose or eyes.",
    },
    {
      "detail": "Are there any vaccines for the coronavirus?",
      "desc": "To date, there is no specific medicine recommended to prevent or treat the new coronavirus." +
          "However, those infected with the virus should receive appropriate care to relieve" +
          " and treat symptoms\n\nSome specific treatments are under investigation, and will be tested through" +
          " clinical trials. Some doctors are trying out a potent brew of anti-retroviral and flu" +
          " drugs to treat those infected, but the science is inconclusive as to whether they " +
          "are effective.",
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VirusDetailsScreen({Key key, this.imgPath, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
              width: MediaQuery.of(context).size.width,
              child: LayoutBuilder(
                builder: (ctx, constraint) => Stack(
                  children: <Widget>[
                    //Title
                    Positioned(
                      top: constraint.maxHeight * 0.45,
                      left: 20,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: constraint.maxWidth * 0.55,
                          child: AutoSizeText(
                            "SARS-CoV-2",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                              tag: imgPath,
                              child: Image(
                                image: AssetImage(imgPath),
                                height: constraint.maxHeight * 0.92,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
            Container(
              height: pageHeight - 220,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => LimitedBox(
                        maxWidth: constraint.maxWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            AutoSizeText(
                              "${details[index]["detail"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                              maxFontSize: 28,
                              stepGranularity: 2,
                              maxLines: 3,
                              group: titleGrp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              maxFontSize: 18,
                              group: descGrp,
                              stepGranularity: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
