class SummaryEachCountry {
  final String country;
  final String code;
  final String flagPath;
  final int todayCases;
  final int totalCases;
  final int newDeaths;
  final int critical;
  final int active;
  final int totalDeaths;
  final int totalRecovered;
  final bool isIncreasing;
  final int testsConducted;

  SummaryEachCountry({
    this.country,
    this.code,
    this.flagPath,
    this.todayCases,
    this.totalCases,
    this.active,
    this.newDeaths,
    this.totalDeaths,
    this.totalRecovered,
    this.isIncreasing,
    this.critical,
    this.testsConducted
  });

  SummaryEachCountry formMap(Map<String,dynamic> data){
    String countryName =  data["country"];
    Map<String,dynamic> countryInfo=data["countryInfo"];
    String code=countryInfo["iso2"];
    return SummaryEachCountry(
        country: countryName,
        code : code,
        flagPath: 'assets/flags/'+code.toLowerCase()+'.png',
        todayCases: data["todayCases"],
        totalCases: data['cases'],
        active: data["active"],
        newDeaths: data['todayDeaths'],
        totalDeaths: data['deaths'],
        totalRecovered: data['recovered'],
        critical: data["critical"],
        testsConducted: data["tests"],
        isIncreasing: data["todayCases"]>0? true : false
    );
  }
}