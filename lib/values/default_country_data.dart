import 'package:flutter/material.dart';

class DefaultCountry{
  Color color; String countryName, countryCode, flagPath;
  bool isIncreasing;
  int totalCases;

  DefaultCountry({this.color, this.countryName, this.countryCode, this.flagPath, this.isIncreasing, this.totalCases});
}

DefaultCountry defaultCountry=DefaultCountry(countryName: null);