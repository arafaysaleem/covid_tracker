import 'dart:convert';
import 'dart:io';
import 'api_service.dart';
import 'package:http/http.dart' as http;
import 'exceptions.dart';
import 'package:flutter/material.dart';

class ApiClient {
  ApiService _apiService = ApiService();

  getNewsResponse(String value) async {
    String endpoint = _getNewsEndpoint(value);
    String url = _apiService.newsUrl +
        _apiService.query +
        "&" +
        _apiService.limit +
        "&" +
        endpoint +
        "&" +
        _apiService.apiKey;
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      if (json['status'] == "ok") {
        return json;
      } else if (json['status'] == "error") {
        throw FetchDataException(json['code'] + json['message']);
      }
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  getStatsResponse(StateLocation stateLocation,{String code=""}) async {
    String todayEndpoint=_getStatsEndpoint(location: stateLocation,code: code);
    String yestEndpoint=_getStatsEndpoint(code: code, location: stateLocation,yesterday: true);
    String todayUrl=_apiService.statsUrl+todayEndpoint;
    String yestUrl=_apiService.statsUrl+yestEndpoint;
    var todayResponse = await http.get(todayUrl);
    if(todayResponse.statusCode==200){
      var todayJSON=json.decode(todayResponse.body);
      var yestResponse=await http.get(yestUrl);
      if(yestResponse.statusCode==200){
        var yestJSON=json.decode(yestResponse.body);
        if(stateLocation==StateLocation.TOP_FIVE){
          for(int i=0;i<5;i++){
            int newRecovered=todayJSON[i]["recovered"]-yestJSON[i]["recovered"];
            todayJSON[i]["newRecovered"]=newRecovered;
          }
        }
        else if(stateLocation==StateLocation.SPECIFIC || stateLocation==StateLocation.GLOBAL){
          int newRecovered=todayJSON["recovered"]-yestJSON["recovered"];
          todayJSON["newRecovered"]=newRecovered;
        }
        else{
          todayJSON.asMap().forEach((index,countryMap){
            int newRecovered=countryMap["recovered"]-yestJSON[index]["recovered"];
            todayJSON[index]["newRecovered"]=newRecovered;
          });
        }
        return todayJSON;
      }
      else{
        //If yesterday data not fetched, set newRecovered to unavailable;
        if(stateLocation==StateLocation.TOP_FIVE){
          for(int i=0;i<5;i++){
            todayJSON[i]["newRecovered"]="Unavailable";
          }
        }
        else if(stateLocation==StateLocation.SPECIFIC || stateLocation==StateLocation.GLOBAL){
          todayJSON["newRecovered"]="Unavailable";
        }
        else{
          todayJSON.asMap().forEach((index,countryMap){
            todayJSON[index]["newRecovered"]="Unavailable";
          });
        }
        return todayJSON;
      }
    }
    else{
      throw FetchDataException("Failed to load stats");
    }
  }

  _getStatsEndpoint({@required String code,bool yesterday = false,@required StateLocation location}) {
    if (location == StateLocation.GLOBAL) return "all?yesterday=$yesterday";
    String endpoint = "countries";

    if (location == StateLocation.SPECIFIC) {
      endpoint += "/" + code + "?strict=false&";
    } else if(location==StateLocation.TOP_FIVE){
      endpoint+="?sort=cases&";
    } else if(location==StateLocation.ALL){
      endpoint+="?";
    }
    return endpoint + "allowNull=false&yesterday=$yesterday";
  }

  _getNewsEndpoint(String value) {
    if (value == "Last Week") {
      return "from=${_getDate(7)}&sortBy=popular";
    } else if (value == "Last 15") {
      return "from=${_getDate(15)}&sortBy=popular";
    } else if (value == "Last Month") {
      return "from=${_getDate(30)}&sortBy=popular";
    }
    return "from=${_getDate(10)}&sortBy=$value";
  }

  _getDate(int days) {
    var now = DateTime.now();
    now = now.subtract(Duration(days: days));
    var date = now.toString();
    date = date.split(" ")[0];
    return date;
  }
}

enum StateLocation { GLOBAL, SPECIFIC, ALL, TOP_FIVE }
