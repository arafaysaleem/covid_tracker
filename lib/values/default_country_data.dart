class DefaultCountry{
  int color; String countryName, countryCode, flagPath;
  bool isIncreasing;
  int totalCases;

  DefaultCountry({this.color, this.countryName, this.countryCode, this.flagPath, this.isIncreasing, this.totalCases});

  Map<String, dynamic> toJson() => {
    'countryName': countryName,
    'countryCode': countryCode,
    'color': color,
    'flagPath': flagPath,
    'isIncreasing': isIncreasing,
    'totalCases': totalCases,
  };

  DefaultCountry fromJson(Map<String,dynamic> json){
    return DefaultCountry(
      countryName: json['countryName'],
      countryCode: json['countryCode'],
      color: json['color'],
      flagPath: json['flagPath'],
      isIncreasing: json['isIncreasing'],
      totalCases: json['totalCases'],
    );
  }
}

DefaultCountry defaultCountry=DefaultCountry();