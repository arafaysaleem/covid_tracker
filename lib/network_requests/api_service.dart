class ApiService{
  final String _apiKey="apiKey=97d1baa2908948848db9c62c7d1ff94f";
  final String _newsUrl="http://newsapi.org/v2/everything?";
  final String _statsUrl="https://disease.sh/v2/";
  final String _query="q=covid%2019%20vaccine";
  final String _limit="pageSize=10&page=1";

  String get apiKey => _apiKey;
  String get query => _query;
  String get newsUrl => _newsUrl;
  String get statsUrl => _statsUrl;
  String get limit => _limit;
}