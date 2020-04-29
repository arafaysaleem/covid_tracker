import 'package:flutter/material.dart';

class MythsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "The SARS-CoV-2 CANNOT be transmitted through mosquito bites",
      "desc": "It is a respiratory virus which spreads primarily "+ 
              "through droplets of an infected person's coughs or sneezes,"+ 
              " saliva or discharge from the nose.",
      "imgPath": "assets/myths/mask.png",
    },
    {
      "myth": "COVID-19 virus can be transmitted in areas with hot and humid climates",
      "desc": "There is no reason to believe that hot weather can kill the new coronavirus"+
              " or other diseases. It can be transmitted in any climate.",
      "imgPath": "assets/myths/wash.png",
    },
    {
      "myth": "Garlic DOES NOT protect against infection from the coronavirus",
      "desc": "Garlic may have some anti microbial properties."+
              " However, COVID-19 is caused by a virus, and no evidence suggests that garlic"+
              " can protect people against COVID-19.",
      "imgPath": "assets/myths/coughCover.png",
    },
    {
      "myth": "Antibiotics do not work against viruses, only bacteria",
      "desc": "The new coronavirus (2019-nCoV) is a virus and, therefore, "+
              "antibiotics should not be used as a means of prevention or treatment.",
      "imgPath": "assets/myths/sanitizer.png",
    },
    {
      "myth": "Parcels from China CANNOT spread coronavirus",
      "desc":"Scientists believe that the virus cannot survive on letters or packages"+
             " for an extended period of time. There is likely very "+
             "low risk of spread from shipped products or packages",
      "imgPath": "assets/myths/touch.png",
    },
    {
      "myth": "Cats and dogs DON'T spread coronavirus",
      "desc": "Currently, there is little evidence to suggest that SARS-CoV-2 can infect"+
              " cats and dogs. Scientists are still debating"+
              " the importance of this case to the outbreak.",
      "imgPath": "assets/myths/socialDistance.png",
    },
    {
      "myth": "All age groups can contact SARS-CoV-2",
      "desc": "It can infect people of any age, including children."+
              " However, older adults and individuals with pre-existing health conditions"+
              " are more likely to become severely ill.",
      "imgPath": "assets/myths/socialDistance.png",
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
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),

                //Image
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
                              height: 210.0,
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
              width: 360.0,
              child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: myths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(18, 22, 18, 15),
                      child: Material(
                        borderRadius: BorderRadius.circular(15.0),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(20,30, 20, 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Image(
                                image: AssetImage("assets/updates.png"),
                                height: 165.0,
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
                                    fontSize: 16,
                                    height: 1.4,
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
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
