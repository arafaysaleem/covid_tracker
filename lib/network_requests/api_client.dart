import 'dart:convert';
import 'dart:io';
import 'api_service.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';

class ApiClient{
  ApiService _apiService=ApiService();

  getResponse(String value) async {
    String endpoint=_getEndpoint(value);
    String url=_apiService.baseUrl+_apiService.query+"&"+_apiService.limit+"&"+endpoint+"&"+_apiService.apiKey;
    try{
      var response=await http.get(url);
      var json=jsonDecode(response.body);
      if(json['status']=="ok"){
        return json;
      }
      else if(json['status']=="error"){
        throw FetchDataException(json['code']+json['message']);
      }
    } on SocketException{
       throw FetchDataException('No Internet connection');
    }
    
  }

  _getEndpoint(String value){
    if(value=="Last Week"){
      return "from=${_getDate(7)}&sortBy=popular";
    }
    else if(value=="Last 15"){
      return "from=${_getDate(15)}&sortBy=popular";
    }
    else if(value=="Last Month"){
      return "from=${_getDate(30)}&sortBy=popular";
    }
    return "from=${_getDate(10)}&sortBy=$value";
  }

  _getDate(int days){
    var now=DateTime.now();
    now=now.subtract(Duration(days: days));
    var date=now.toString();
    date=date.split(" ")[0];
    return date;
  }

}