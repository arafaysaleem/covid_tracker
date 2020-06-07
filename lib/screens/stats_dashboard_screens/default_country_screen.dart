import '../../values/default_country_data.dart';
import '../../widgets/stats_widgets/country_stat_widget.dart';
import 'package:flutter/material.dart';

class DefaultCountryScreen extends StatelessWidget {
  final PageController controller;

  const DefaultCountryScreen({Key key, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(defaultCountry.countryName == null){
      return Padding(
        padding: const EdgeInsets.fromLTRB(15, 350, 15, 0),
        child: Column(
          children: <Widget>[
            Text(
              "No default country selected yet",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 20),

            //Choose default country
            InkWell(
              onTap: () {
                controller.animateToPage(1,
                    duration: Duration(milliseconds: 150),
                    curve: Curves.easeInOut);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(13),
                ),
                child: Center(
                  child: Text(
                    "Choose a default",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }
    return CountryStatWidget(
      onBackArrow: (){
        controller.animateToPage(0, duration: Duration(milliseconds: 150), curve: Curves.easeInOut);
      },
      countryName: defaultCountry.countryName,
      countryCode: defaultCountry.countryCode,
      color: defaultCountry.color,
      totalCases: defaultCountry.totalCases,
      flagPath: defaultCountry.flagPath,
      isIncreasing: defaultCountry.isIncreasing,
    );
  }
}
