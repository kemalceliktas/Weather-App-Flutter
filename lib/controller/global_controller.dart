import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:weather_app_first/api/fetch_weather.dart';
import 'package:weather_app_first/model/models.dart';





class GlobalController extends GetxController {
  // create varius values
  final RxBool _isLoading = true.obs;
  final RxDouble _lattitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;
  final RxInt  _currentIndex=0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLattitude() => _lattitude;
  RxDouble getLongtitude() => _longitude;

  final weatherData = WeatherResponse().obs;
  final newModel= NewModel().obs;

  getData(){
    return weatherData.value;
  }

  getModel(){
    return newModel.value;
  }
 
  @override
  void onInit() {
    // TODO: implement onInit
    if (_isLoading.isTrue) {
      getLocation();
      
    }else{
      getIndex();
    }
    super.onInit();
  }
 
 
      
  getLocation() async {
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Future.error("Location not enabled");
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission are denied Forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    // gettin the corrent position

    return await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high)
        .then((value) {
      //update or lattitude and langitute

      _lattitude.value = value.latitude;
      _longitude.value = value.longitude;
          //calling our weather api

          
          return DataService().getWeather(value.latitude, value.longitude).then((value){
                  weatherData.value=value;

                DataService().gelenData().then((value){
                   newModel.value=value!;
                   _isLoading.value=false;
                });   
                
               
      
            
                  
          });


          
    


     
        
      

    
    
     

     

    });
  }


  RxInt getIndex(){
    return _currentIndex;
  }
}
