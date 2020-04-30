import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;
  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "SARS-CoV-2 disease CANNOT be transmitted through mosquito bites",
      "desc": "It's a respiratory virus which spreads primarily " +
          "through droplets of an infected person's coughs or sneezes," +
          " saliva or discharge from the nose.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth":
          "COVID-19 virus can be transmitted in areas with hot and humid climates",
      "desc":
          "There is no reason to believe that hot weather can kill the new coronavirus" +
              " or other diseases. It can be transmitted in any climate.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "Garlic DOES NOT protect against infection from the coronavirus",
      "desc": "Garlic may have some anti microbial properties." +
          " However, no evidence suggests that garlic" +
          " can protect people against COVID-19 virus.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "Antibiotics DO NOT work against viruses, only bacteria",
      "desc": "The new coronavirus (2019-nCoV) is a virus and, therefore, " +
          "antibiotics should not be used as a means of prevention or treatment.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "Parcels from China CANNOT spread coronavirus",
      "desc":
          "Scientists believe that the virus can't survive on letters or packages"+
          " for an extended period of time. There is very " +
          "low risk of spread from shipped products or packages",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "Cats and dogs DON'T spread coronavirus",
      "desc":
          "Currently, there is little evidence to suggest that SARS-CoV-2 can infect" +
              " cats and dogs. Scientists are still debating" +
              " the importance of this case to the outbreak.",
      "imgPath": "assets/myths/dogs.png",
    },
    {
      "myth": "All age groups CAN contact SARS-CoV-2",
      "desc": "It can infect people of any age, including children." +
          " However, older adults and individuals with prior health conditions" +
          " are more likely to become severely ill.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({Key key, this.imgPath, this.color}) : super(key: key);

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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //Cover Image Container
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
                //Title
                Positioned.fill(
                  top: 40,
                  left: 20,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Virus Myths",
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
                  bottom: -17.0,
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

          //Myth card
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
              width: MediaQuery.of(context).size.width > 360.0
                  ? MediaQuery.of(context).size.width - 31.0
                  : MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    //Details
                    Flexible(
                      fit: FlexFit.loose,
                      child: PageView.builder(
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          itemCount: myths.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(23, 35, 23, 15),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Image(
                                    image: AssetImage(
                                        "${myths[index]["imgPath"]}"),
                                    height: 100.0,
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "${myths[index]["myth"]}",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 19,
                                      height: 1.1,
                                      fontFamily: "Montserrat",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 13,
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${myths[index]['desc']}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16.5,
                                        height: 1.4,
                                        fontFamily: "Montserrat",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),

                    //Dot Indicator
                    Container(
                      margin: EdgeInsets.only(bottom: 25),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: myths.length,
                        effect: WormEffect(
                            dotHeight: 11,
                            dotWidth: 11,
                            spacing: 12.0,
                            strokeWidth: 1.2,
                            dotColor: Colors.grey[400],
                            paintStyle: PaintingStyle.stroke,
                            activeDotColor: Colors.redAccent[700]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
