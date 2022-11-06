/* 

{
    "coord": {
        "lon": -122.4064,
        "lat": 37.7858
    },
    "weather": [
        {
            "id": 801,
            "main": "Clouds",
            "description": "few clouds",
            "icon": "02n"
        }
    ],
   
    "main": {
        "temp": 286.2,
        "feels_like": 283.67,
        "temp_min": 281.47,
        "temp_max": 286.44,
    },
    "wind": {
        "speed": 5.14,
        "deg": 280
    },
    "clouds": {
        "all": 20
    },

    "name": "San Francisco",
    "cod": 200
} 

*/
/*   class ForecastInfo {
  final double? temp;
  final List? main;
  ForecastInfo({this.temp,this.main});

  factory ForecastInfo.fromJson(Map<String, dynamic> json) {
    final main=json["main"];
    final temp = json["temp"];

    return ForecastInfo(temp: temp,main: main);
  }
} 
 */

class NewModel{
 final List? daily;

 NewModel({this.daily});

 factory NewModel.fromJson(Map json){
   final daily=json["list"];

    return NewModel(daily: daily);
  }

  
}


class NewModelResponse{

}

class WeatherInfo {
  final String? description;
  final int? id;
  final String? icon;
  final String? main;

  WeatherInfo({this.description, this.id, this.icon, this.main});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    final description = json["description"];
    final icon = json["icon"];
    final main = json["main"];
    final id = json["id"];

    return WeatherInfo(
        description: description, id: id, icon: icon, main: main);
  }
}

 /* class ForecastInfoResponse{
  final ForecastInfo? forecastInfo;

  ForecastInfoResponse(
      {this.forecastInfo});

  factory ForecastInfoResponse.fromJson(Map<String, dynamic> json) {
    
    final forecastInfoJson = json["list"];
    final forecastInfo = ForecastInfo.fromJson(forecastInfoJson);
    

    return ForecastInfoResponse(
        forecastInfo:forecastInfo);
  }
}   */



class WindInfo {
  final double? speed;
  final int? deg;

  WindInfo({this.speed, this.deg});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    final speed = json["speed"];
    final deg = json["deg"];

    return WindInfo(
      speed: speed,
      deg: deg,
    );
  }
}



class TemperatureInfo {
  final double? temperature;
  final int? humidity;
  final double? feels_like;
  final double? temp_min;
  final double? temp_max;

  TemperatureInfo(
      {this.temperature,
      this.humidity,
      this.feels_like,
      this.temp_min,
      this.temp_max});

  factory TemperatureInfo.fromJson(Map<String, dynamic> json) {
    final temperature = json["temp"];
    final humidity = json["humidity"];
    final feels_like = json["feels_like"];
    final temp_min = json["temp_min"];
    final temp_max = json["temp_max"];

    return TemperatureInfo(
      temperature: temperature,
      humidity: humidity,
      feels_like: feels_like,
      temp_max: temp_max,
      temp_min: temp_min,
    );
  }
}

class CloudsInfo {
  final int? all;

  CloudsInfo({this.all});

  factory CloudsInfo.fromJson(Map<String, dynamic> json) {
    final all = json["all"];

    return CloudsInfo(all: all);
  }
}

class WeatherResponse {
  final String? cityName;
  final TemperatureInfo? tempInfo;
  final WeatherInfo? weatherInfo;
  final WindInfo? windInfo;
  final CloudsInfo? cloudsInfo;

  WeatherResponse(
      {this.weatherInfo,
      this.cityName,
      this.tempInfo,
      this.windInfo,
      this.cloudsInfo});

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final cityName = json["name"];
    final tempInfoJson = json["main"];
    final cloudsInfoJson = json["clouds"];
    final cloudsInfo = CloudsInfo.fromJson(cloudsInfoJson);
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);
    final weatherInfoJson = json["weather"][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);
    final windInfoJson = json["wind"];
    final windInfo = WindInfo.fromJson(windInfoJson);

    return WeatherResponse(
        cityName: cityName,
        tempInfo: tempInfo,
        weatherInfo: weatherInfo,
        windInfo: windInfo,
        cloudsInfo: cloudsInfo);
  }
}



