import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_first/model/models.dart';
import 'package:weather_app_first/utils/global_const.dart';

class TestWidget extends StatelessWidget {
  final NewModel? newModel;
  const TestWidget({super.key, required this.newModel});

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat("h:mm  a  EEE").format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: GlobalConst.height45 * 10,
      margin: EdgeInsets.only(left: GlobalConst.height20,right: GlobalConst.height20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: GlobalConst.bgColor,
        borderRadius: BorderRadius.circular(GlobalConst.radius20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(bottom:GlobalConst.height10/2),
            child: Text(
              "Next Days",
              style: TextStyle(
                color: GlobalConst.primaryColor,
                fontSize: GlobalConst.font20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          dailyList(),
        ],
      ),
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: GlobalConst.height45 * 8,
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: newModel!.daily!.length > 7 ? 7 : newModel!.daily!.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  height: GlobalConst.height10 * 6,
                  padding: EdgeInsets.only(left: GlobalConst.width10/2, right: GlobalConst.width10/2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: GlobalConst.width10 * 8,
                        child: Text(
                          getDay(newModel!.daily![index]["dt"]),
                          style: TextStyle(
                              color: GlobalConst.primaryColor,
                              fontSize: GlobalConst.font20 / 1.4),
                        ),
                      ),
                
                      SizedBox(
                        height: GlobalConst.height10*3,
                        width: GlobalConst.width10*3,
                        child: Image.asset("assets/weather/${newModel!.daily![index]['weather'][0]['icon']}.png"),
                      ),
                      Text(newModel!.daily![index]['main']['temp_min'].toStringAsFixed(0)+"° / "+newModel!.daily![index]['main']['temp_max'].toStringAsFixed(0)+"°"),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }
}






/* ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: newModel!.daily!.length>5 ? 5:newModel!.daily!.length,
          itemBuilder: (context,index){
            return Column(
              children: [
                Text(newModel!.daily![index]["main"]["temp"].toString()),
              ],
            );
          }), */