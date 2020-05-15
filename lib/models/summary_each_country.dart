import 'package:covidtracker/values/country_flag_codes.dart';

class SummaryEachCountry {
  final String country;
  final String slug;
  final String code;
  final String flagPath;
  final int newConfirmed;
  final int totalConfirmed;
  final int newDeaths;
  final int totalDeaths;
  final int newRecovered;
  final int totalRecovered;
  final bool isIncreasing;

  SummaryEachCountry({
    this.country,
    this.slug,
    this.code,
    this.flagPath,
    this.newConfirmed,
    this.totalConfirmed,
    this.newDeaths,
    this.totalDeaths,
    this.newRecovered,
    this.totalRecovered,
    this.isIncreasing
  });

  SummaryEachCountry formMap(Map<String,dynamic> data){
    String code = data["CountryCode"];
    code = code.toLowerCase();
    String countryName =  flagCodes[code.toUpperCase()];

    return SummaryEachCountry(
        country: countryName,
        slug: data['Slug'],
        code : code,
        flagPath: 'assets/flags/'+code+'.png',
        newConfirmed: data["NewConfirmed"],
        totalConfirmed: data['TotalConfirmed'],
        newDeaths: data['NewDeaths'],
        totalDeaths: data['TotalDeaths'],
        newRecovered: data['NewRecovered'],
        totalRecovered: data['TotalRecovered'],
        isIncreasing: data["NewConfirmed"]>0? true : false
    );
  }
}