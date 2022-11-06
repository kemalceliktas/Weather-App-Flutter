

import 'dart:convert';

import 'package:weather_app_first/api/api_key.dart';

import 'package:http/http.dart' as http;
import 'package:weather_app_first/model/models.dart';


class DataService{
  WeatherResponse? weatherResponse;
  NewModel? newModel;

  Future<WeatherResponse> getWeather(lat,lon)async{
    var response = await http.get(Uri.parse(apiURL(lat, lon)));
    var jsonString = jsonDecode(response.body);

    weatherResponse=WeatherResponse.fromJson(jsonString);
   
    return weatherResponse!;
    

   
  }


  Future<NewModel?> gelenData() async {
    var response = await http.get(Uri.parse(
        "https://api.openweathermap.org/data/2.5/forecast?lat=37.75905715488574&lon=-122.44086156595975&appid=a73a568925c1fcfbba54017d585c8a79&units=metric"));

    Map gelenJson = jsonDecode(response.body);
    newModel = NewModel.fromJson(gelenJson);
    
    print(newModel?.daily![2]["main"]["temp"]);

    return newModel;
    
  }


}




String apiURL(var lat,var lon){
  String url;
  url="https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=$apiKey&units=metric";
  return url;
}




/* https://api.openweathermap.org/data/2.5/forecast?lat=37.75905715488574&lon=-122.44086156595975&appid=a73a568925c1fcfbba54017d585c8a79&units=metric */