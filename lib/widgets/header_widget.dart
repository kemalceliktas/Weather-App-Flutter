import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weather_app_first/controller/global_controller.dart';
import 'package:weather_app_first/model/models.dart';
import 'package:weather_app_first/utils/global_const.dart';
import 'package:weather_app_first/widgets/comfortable.dart';

class HeaderWidget extends StatefulWidget {
 
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  
  String city = "";
  String date = DateFormat("yMMMMd").format(DateTime.now());
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
      
        

  @override
  void initState() {
    // TODO: implement initState
    getAddress(globalController.getLattitude().value,
        globalController.getLongtitude().value);
    super.initState();
  }

  getAddress(lat, lon) async {
    List<Placemark> placeMark = await placemarkFromCoordinates(lat, lon);
    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:  EdgeInsets.only( right: GlobalConst.width10*2),
              alignment: Alignment.topLeft,
              child: Text(
                city,
                style: TextStyle(
                  fontSize: 30,
                  height: 2,
                ),
              ),
            ),
            Container(
              margin:  EdgeInsets.only(bottom: GlobalConst.width20),
              alignment: Alignment.topLeft,
              child: Text(
                date,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blueGrey[700],
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
        ComfortLevel(weatherResponse: globalController.getData()),
      ],
    );
  }
}
