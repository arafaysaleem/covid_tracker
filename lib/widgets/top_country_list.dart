import '../models/item_color_data.dart';
import 'package:flutter/material.dart';
import '../models/summary_each_country.dart';
import '../widgets/country_list_item.dart';

final List<ItemColorData> colordata = <ItemColorData>[
  ItemColorData(
      backgroundColor: Color(0xff008e7b),
      gradientColor: Color(0xff009a88),
      lineColor: Color(0xff5bc8b7)),
  ItemColorData(
      backgroundColor: Color(0xffff775e),
      gradientColor: Color(0xffff8d77),
      lineColor: Color(0xffffc4b7)),
  ItemColorData(
      backgroundColor: Color(0xfff2d65d),
      gradientColor: Color(0xfff2d65d),
      lineColor: Color(0xfffeedb2)),
  ItemColorData(
      backgroundColor: Color(0xff6078ff),
      gradientColor: Color(0xff758aff),
      lineColor: Color(0xffe7e9fb))
];

class TopCountryList extends StatelessWidget {
  final List<SummaryEachCountry> topSixList;
  final double height = 180;

  const TopCountryList({Key key, this.topSixList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 20, right: 20),
        primary: true,
        scrollDirection: Axis.horizontal,
        itemCount: topSixList.length,
        itemBuilder: (BuildContext ctx, int i) {
          return CountryListItem(
            height: height,
            countryName: topSixList[i].country,
            countryCode: topSixList[i].code,
            value: topSixList[i].totalCases,
            flagPath: topSixList[i].flagPath,
            isIncreasing: topSixList[i].isIncreasing,
            itemColorData: colordata[i % colordata.length],
          );
        },
      ),
    );
  }
}
