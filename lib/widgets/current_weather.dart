import 'package:flutter/material.dart';

import 'package:weather_app_first/model/models.dart';

import '../utils/global_const.dart';

class CurrentWeather extends StatelessWidget {
  final WeatherResponse weatherResponse;
  const CurrentWeather({super.key, required this.weatherResponse});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),
        SizedBox(
          height: GlobalConst.height20,
        ),
        
        currentWeatherMoreDetailsWidget(),
        SizedBox(
          height: 20,
        ),
        /* Text(weatherResponse.tempInfo!.temp_min.toString()), */
      ],
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: GlobalConst.height20 * 3,
              width: GlobalConst.width20 * 3,
              padding: EdgeInsets.all(GlobalConst.height15),
              decoration: BoxDecoration(
                boxShadow: [
                  GlobalConst.boxShadow,
                ],
                color: GlobalConst.bgColor,
                borderRadius: BorderRadius.circular(GlobalConst.radius20),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
            Container(
              height: GlobalConst.height20 * 3,
              width: GlobalConst.width20 * 3,
              padding: EdgeInsets.all(GlobalConst.height15),
              decoration: BoxDecoration(
                  color: GlobalConst.bgColor,
                  borderRadius: BorderRadius.circular(GlobalConst.radius20),
                  boxShadow: [
                    GlobalConst.boxShadow,
                  ]),
              child: Image.asset("assets/icons/clouds.png"),
            ),
            Container(
              height: GlobalConst.height20 * 3,
              width: GlobalConst.width20 * 3,
              padding: EdgeInsets.all(GlobalConst.height15),
              decoration: BoxDecoration(
                  color: GlobalConst.bgColor,
                  borderRadius: BorderRadius.circular(GlobalConst.radius20),
                  boxShadow: [
                    GlobalConst.boxShadow,
                  ]),
              child: Image.asset("assets/icons/humidity.png"),
            ),
          ],
        ),
        SizedBox(
          height: GlobalConst.height10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: GlobalConst.height20,
              width: GlobalConst.width20 * 3,
              child: Text(
                "${weatherResponse.windInfo!.speed}km/h",
                style: TextStyle(
                  fontSize: GlobalConst.font20 / 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: GlobalConst.height20,
              width: GlobalConst.width20 * 3,
              child: Text(
                "${weatherResponse.cloudsInfo!.all}%",
                style: TextStyle(
                  fontSize: GlobalConst.font20 / 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: GlobalConst.height20,
              width: GlobalConst.width20 * 3,
              child: Text(
                "${weatherResponse.tempInfo!.humidity}km/h",
                style: TextStyle(
                  fontSize: GlobalConst.font20 / 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherResponse.weatherInfo!.icon.toString()}.png",
          height: GlobalConst.height20 * 4,
          width: GlobalConst.width20 * 4,
        ),
        Container(
          height: GlobalConst.height45,
          width: 1,
          color: Colors.grey,
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text:
                    "${weatherResponse.tempInfo!.temperature?.toStringAsFixed(0)}°",
                style: const TextStyle(
                  color: GlobalConst.primaryColor,
                  fontWeight: FontWeight.w700,
                  fontSize: 68,
                ),
              ),
              TextSpan(
                text: "${weatherResponse.weatherInfo!.description}",
                style: const TextStyle(
                  color: GlobalConst.secondColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
