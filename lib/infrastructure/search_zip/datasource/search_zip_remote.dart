import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class SearchZipRemoteDataSource{
  Future<List<String>> search(String zipCode)async{
    List<String> result = [];
    try{
      String googleAPIKey = "Google Api Key";
      String baseURL = 'https://maps.googleapis.com/maps/api/place/autocomplete/json';
      String request = '$baseURL?input=$zipCode&components=country:in&key=$googleAPIKey';
      var response = await http.get(Uri.parse(request));git commit -m "first commit"
      if(response.statusCode==200){
        var parsed = json.decode(utf8.decode(response.bodyBytes));
        List predictions = parsed['predictions'];
        log(predictions.toString());
        for(int i=0;i<predictions.length;i++){
          result.add(parsed['predictions'][i]['description']);
        }
      }else{
        debugPrint(response.statusCode.toString());
      }
    }catch(exception){
      log(exception.toString());
    }
    return result;
  }
}