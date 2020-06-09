import '../../values/country_color_data.dart';
import '../../models/summary_each_country.dart';
import 'package:flutter/material.dart';
import 'country_list_item.dart';

// ignore: must_be_immutable
class CountriesGrid extends StatefulWidget {
  List<SummaryEachCountry> list;
  
  CountriesGrid({this.list});
  
  @override
  _CountriesGridState createState() => _CountriesGridState();
}

class _CountriesGridState extends State<CountriesGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: BouncingScrollPhysics(),
      padding: const EdgeInsets.all(15),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 30,
        childAspectRatio: 2 / 2.9,
      ),
      itemCount: widget.list.length,
      itemBuilder: (ctx, i) {
        return CountryListItem(
          height: 180,
          countryName: widget.list[i].country,
          countryCode: widget.list[i].code,
          value: widget.list[i].totalCases,
          flagPath: widget.list[i].flagPath,
          isIncreasing: widget.list[i].isIncreasing,
          itemColorData: colordata[i % colordata.length],
        );
      },
    );
  }
}
