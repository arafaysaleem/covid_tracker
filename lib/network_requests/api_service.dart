class ApiService{
  final String _apiKey="apiKey=97d1baa2908948848db9c62c7d1ff94f";
  final String _baseUrl="http://newsapi.org/v2/everything?";
  final String _query="q=covid%2019%20vaccine";
  final String _limit="pageSize=10&page=1";

  String get apiKey => _apiKey;
  String get query => _query;
  String get baseUrl => _baseUrl;
  String get limit => _limit;
}