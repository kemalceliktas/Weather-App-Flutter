import 'package:animated_svg/animated_svg.dart';
import 'package:animated_svg/animated_svg_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';
import 'package:weather_app_first/controller/global_controller.dart';
import 'package:weather_app_first/utils/global_const.dart';

import '../model/models.dart';

class DetailWeather extends StatelessWidget {
  final WeatherResponse weatherResponse;
  DetailWeather({super.key, required this.weatherResponse});


  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Text(
            "Today",
            style: TextStyle(fontSize: GlobalConst.font20,fontWeight: FontWeight.bold,color: GlobalConst.primaryColor),
          ),
          
          alignment: Alignment.topCenter,
        ),
        SizedBox(
          height: GlobalConst.height10/2,
        ),
        
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: dailyList(),
        ),
      ],
    );
  }

  Widget dailyList() {
    return Container(
      height: GlobalConst.height45 * 3.5,
      padding: EdgeInsets.only(
          top: GlobalConst.height10, bottom: GlobalConst.height10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: dailyDetails(
              feels_like: weatherResponse.tempInfo!.feels_like,
              temp: weatherResponse.tempInfo!.temperature,
              temp_max: weatherResponse.tempInfo!.temp_max,
              temp_min: weatherResponse.tempInfo!.temp_min,
              weatherResponse: weatherResponse,
            ),
          ),
          
          
        ],
      ),
    );
  }
}

class dailyDetails extends StatelessWidget {
  final WeatherResponse weatherResponse;
  double? temp;
  double? temp_max;
  double? temp_min;
  double? feels_like;
  dailyDetails(
      {super.key,
      required this.feels_like,
      required this.temp,
      required this.temp_max,
      required this.temp_min,
      required this.weatherResponse});
RxInt cardIndex = GlobalController().getIndex();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            cardIndex.value= 0;
          },
          child: Container(
            height: GlobalConst.height45 * 3,
            width: GlobalConst.width20 * 6,
            margin: EdgeInsets.symmetric(horizontal: GlobalConst.height10),
            padding: EdgeInsets.all(GlobalConst.height10),
            decoration: BoxDecoration(
              boxShadow: [
                    GlobalConst.boxShadow,
                  ],
                color:GlobalConst.bgColor,
                borderRadius: BorderRadius.circular(GlobalConst.radius20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Daily Temp",style: TextStyle(color: Colors.blueAccent,fontSize: GlobalConst.font20/1.4,fontWeight: FontWeight.bold),),
                ),
                
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      temp!.toStringAsFixed(0)+"°",
                      style: TextStyle(
                        fontSize: GlobalConst.font26,
                      ),
                    ),
                    Image.asset("assets/weather/${weatherResponse.weatherInfo!.icon}.png",
                    width: GlobalConst.width20*2,
                    height: GlobalConst.width20*2,
                    
                    ),
                    
                  ],
                ),
               Column(
                      
                      children: [
                        Text(weatherResponse.weatherInfo!.main.toString(),
                            style: TextStyle(fontSize:GlobalConst.font20)),
                        Text(
                          weatherResponse.weatherInfo!.description.toString(),
                          style: TextStyle(
                              fontSize: GlobalConst.font20/2,
                              fontWeight: FontWeight.bold,
                              color: GlobalConst.primaryColor),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            cardIndex.value= 1;
            print("Hello");
          },
          child: Container(
            height: GlobalConst.height45 * 3,
            width: GlobalConst.width20 * 6,
            margin: EdgeInsets.symmetric(horizontal: GlobalConst.height10),
            padding: EdgeInsets.all(GlobalConst.height10),
            decoration: BoxDecoration(
              boxShadow: [
                    GlobalConst.boxShadow,
                  ],
                color: GlobalConst.bgColor,
                borderRadius: BorderRadius.circular(GlobalConst.radius20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Temp Max",style: TextStyle(color: Colors.blueAccent,fontSize: GlobalConst.font20/1.4,fontWeight: FontWeight.bold),),
                ),
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      temp_max!.toStringAsFixed(0)+"°",
                      style: TextStyle(
                        fontSize: GlobalConst.font26,
                      ),
                    ),
                    Image.asset("assets/weather/${weatherResponse.weatherInfo!.icon}.png",
                    width: GlobalConst.width20*2,
                    height: GlobalConst.width20*2,
                    
                    ),
                    
                  ],
                ),
               Column(
                      
                      children: [
                        Text(weatherResponse.weatherInfo!.main.toString(),
                            style: TextStyle(fontSize:GlobalConst.font20)),
                        Text(
                          weatherResponse.weatherInfo!.description.toString(),
                          style: TextStyle(
                              fontSize: GlobalConst.font20/2,
                              fontWeight: FontWeight.bold,
                              color: GlobalConst.primaryColor),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            cardIndex.value= 2;
          },
          child: Container(
            height: GlobalConst.height45 * 3,
            width: GlobalConst.width20 * 6,
            margin: EdgeInsets.symmetric(horizontal: GlobalConst.height10),
            padding: EdgeInsets.all(GlobalConst.height10),
            decoration: BoxDecoration(
                 boxShadow: [
                    GlobalConst.boxShadow,
                  ],
                color: GlobalConst.bgColor,
                borderRadius: BorderRadius.circular(GlobalConst.radius20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Temp Min",style: TextStyle(color: Colors.blueAccent,fontSize: GlobalConst.font20/1.4,fontWeight: FontWeight.bold),),
                ),
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      temp_min!.toStringAsFixed(0)+"°",
                      style: TextStyle(
                        fontSize: GlobalConst.font26,
                      ),
                    ),
                    Image.asset("assets/weather/${weatherResponse.weatherInfo!.icon}.png",
                    width: GlobalConst.width20*2,
                    height: GlobalConst.width20*2,
                    
                    ),
                    
                  ],
                ),
               Column(
                      
                      children: [
                        Text(weatherResponse.weatherInfo!.main.toString(),
                            style: TextStyle(fontSize:GlobalConst.font20)),
                        Text(
                          weatherResponse.weatherInfo!.description.toString(),
                          style: TextStyle(
                              fontSize: GlobalConst.font20/2,
                              fontWeight: FontWeight.bold,
                              color: GlobalConst.primaryColor),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            cardIndex.value= 3;
          },
          child: Container(
            height: GlobalConst.height45 * 3,
            width: GlobalConst.width20 * 6,
            margin: EdgeInsets.symmetric(horizontal: GlobalConst.height10),
            padding: EdgeInsets.all(GlobalConst.height10),
            decoration: BoxDecoration(
                 boxShadow: [
                    GlobalConst.boxShadow,
                  ],
                color: GlobalConst.bgColor,
                borderRadius: BorderRadius.circular(GlobalConst.radius20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Feels Like",style: TextStyle(color: Colors.blueAccent,fontSize: GlobalConst.font20/1.4,fontWeight: FontWeight.bold),),
                ),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      feels_like!.toStringAsFixed(0)+"°",
                      style: TextStyle(
                        fontSize: GlobalConst.font26,
                      ),
                    ),
                    Image.asset("assets/weather/${weatherResponse.weatherInfo!.icon}.png",
                    width: GlobalConst.width20*2,
                    height: GlobalConst.width20*2,
                    
                    ),
                    
                  ],
                ),
               Column(
                      
                      children: [
                        Text(weatherResponse.weatherInfo!.main.toString(),
                            style: TextStyle(fontSize:GlobalConst.font20)),
                        Text(
                          weatherResponse.weatherInfo!.description.toString(),
                          style: TextStyle(
                              fontSize: GlobalConst.font20/2,
                              fontWeight: FontWeight.bold,
                              color: GlobalConst.primaryColor),
                        ),
                      ],
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
