import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app_first/model/models.dart';
import 'package:weather_app_first/utils/global_const.dart';

class ComfortLevel extends StatelessWidget {
  final WeatherResponse? weatherResponse;
  const ComfortLevel({super.key, required this.weatherResponse});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundColor: GlobalConst.bgColor,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SleekCircularSlider(
          min: 0,
          max: 100,
          appearance: CircularSliderAppearance(
            infoProperties: InfoProperties(
              bottomLabelText: "Humidity",
              bottomLabelStyle: TextStyle(fontSize: GlobalConst.font20/1.7,color: GlobalConst.primaryColor,fontWeight: FontWeight.bold),
              mainLabelStyle: TextStyle(fontSize: GlobalConst.font20,color: Colors.blueAccent)
            ),
            animationEnabled: true,
            size: 100,
            customColors: CustomSliderColors(
              progressBarColor: Colors.blueAccent,
              trackColor: GlobalConst.primaryColor,
              
              
            )
          ),
          initialValue: weatherResponse!.tempInfo!.humidity!.toDouble(),
          
        ),
      ),
    );
  }
}


/* child: SleekCircularSlider(
              min: 0,
              max: 100,
              initialValue: weatherResponse!.tempInfo!.humidity!.toDouble(),
            ), */