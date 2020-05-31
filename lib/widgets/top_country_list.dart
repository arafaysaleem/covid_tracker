import '../models/item_color_data.dart';
import 'package:flutter/material.dart';
import '../models/summary_each_country.dart';
import '../widgets/country_list_item.dart';

final List<ItemColorData> colordata = <ItemColorData>[
  ItemColorData(
    backgroundColor: Color(0xff008e7b),
    gradientColor: Color(0xff009a88),
    lineColor: Color(0xff5bc8b7),
  ),
  ItemColorData(
    backgroundColor: Color(0xffff775e),
    gradientColor: Color(0xffff8d77),
    lineColor: Color(0xffffc4b7),
  ),
  ItemColorData(
    backgroundColor: Color(0xffffcb0f),
    gradientColor: Color(0xffffd747),
    lineColor: Color(0xfffff199),
  ),
  ItemColorData(
    backgroundColor: Color(0xff6078ff),
    gradientColor: Color(0xff758aff),
    lineColor: Color(0xffe7e9fb),
  )
];

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
