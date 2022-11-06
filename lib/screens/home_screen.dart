
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weather_app_first/controller/global_controller.dart';

import 'package:weather_app_first/utils/global_const.dart';

import 'package:weather_app_first/widgets/current_weather.dart';
import 'package:weather_app_first/widgets/detail_weather.dart';

import 'package:weather_app_first/widgets/header_widget.dart';
import 'package:weather_app_first/widgets/next_days_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  

  // call get provider
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      backgroundColor: GlobalConst.mainBgColor,
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    HeaderWidget(),
                    CurrentWeather(weatherResponse: globalController.getData()),
                    DetailWeather(weatherResponse: globalController.getData()),
                    TestWidget(newModel: globalController.getModel()),
                  ],
                ),
        ),
      ),
    );
  }
}
