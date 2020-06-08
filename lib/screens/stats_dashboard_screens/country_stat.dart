import '../../widgets/stats_widgets/country_stat_widget.dart';
import 'package:flutter/material.dart';

class CountryStatScreen extends StatefulWidget {
  final color, countryName, countryCode, flagPath, isIncreasing, totalCases;

  const CountryStatScreen(
      {Key key,
      this.color,
      this.countryName,
      this.countryCode,
      this.flagPath,
      this.isIncreasing,
      this.totalCases})
      : super(key: key);

  @override
  _CountryStatScreenState createState() => _CountryStatScreenState();
}

class _CountryStatScreenState extends State<CountryStatScreen>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: CountryStatWidget(
          color: widget.color,
          onBackArrow: (){
            Navigator.of(context).pop();
          },
          countryCode: widget.countryCode,
          countryName: widget.countryName,
          totalCases: widget.totalCases,
          flagPath: widget.flagPath,
          isIncreasing: widget.isIncreasing,
        ),
      ),
    );
  }
}
