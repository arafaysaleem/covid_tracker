import '../../values/country_color_data.dart';
import 'package:flutter/material.dart';
import '../../models/summary_each_country.dart';
import 'country_list_item.dart';

class TopCountryList extends StatelessWidget {
  final List<SummaryEachCountry> topSixList;
  final double height = 180;

  const TopCountryList({Key key, this.topSixList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      primary: true,
      scrollDirection: Axis.horizontal,
      itemCount: topSixList.length,
      separatorBuilder: (context, i) => SizedBox(width: 18),
      itemBuilder: (BuildContext ctx, int i) {
        return Padding(
          padding: EdgeInsets.only(
              left: i == 0 ? 20 : 0,
              right: i == topSixList.length - 1 ? 20.0 : 0),
          child: CountryListItem(
            height: height,
            countryName: topSixList[i].country,
            countryCode: topSixList[i].code,
            value: topSixList[i].totalCases,
            flagPath: topSixList[i].flagPath,
            isIncreasing: topSixList[i].isIncreasing,
            itemColorData: colordata[i % colordata.length],
          ),
        );
      },
    );
  }
}
