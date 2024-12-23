import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:modular_ui_package/utils/utils.dart';
import '../utils/app_images.dart';

class ControllerPickupWheel extends GetxController{

  TextEditingController textEditingControllerFrom=TextEditingController();
  TextEditingController textEditingControllerTo=TextEditingController();

  GoogleMapController? mapController;
  Set<Marker> markerSet={};
  bool loading=false;
  dynamic latitude;
  dynamic longitude;
  String? pinCode;
  dynamic dropLat;
  dynamic dropLng;
  dynamic fullAdd;
  dynamic fullAddDrop;
  bool permissionAllowed=true;
  bool serviceEnabled=true;
  bool locationFetching=false;



  @override
  void onInit() {
    super.onInit();
    textEditingControllerFrom.text="Current Location";
    getCustomMarker();
    getCurrentLocation();
  }



  getCustomMarker() async {
    PolyFunction.cars=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), AppImages.car);
    PolyFunction.bike=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), AppImages.bike);
  }

  getCurrentLocation() async {
    loc.Location instance=loc.Location.instance;
    loc.PermissionStatus permissionStatus=await instance.hasPermission();
    if(permissionStatus!=loc.PermissionStatus.granted){
      await instance.requestPermission();
    }
    bool serviceEnabled=await instance.serviceEnabled();
    if(!serviceEnabled){
      await instance.requestService();
    }
    permissionStatus=await instance.hasPermission();
    serviceEnabled=await instance.serviceEnabled();
    if(permissionStatus!=loc.PermissionStatus.granted) {
      permissionAllowed=false;
      update();
      return showToast("Permission not allowed");
    }
    if(!serviceEnabled) {
      serviceEnabled=false;
      update();
      return showToast("Location service not enabled");
    }
    Position? pos=await Geolocator.getLastKnownPosition();

    if(pos== null){
      return;
    }
    locationFetching=false;
    update();
    latitude=pos.latitude;
    longitude=pos.longitude;
    decodeLocation(pos.latitude, pos.longitude);
  }

  decodeLocation(double lat,double lng) async {
    loading=true;
    update();
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    print("${placemarks.first.name}");
    print("${placemarks.first.locality}");
    print("${placemarks.first.administrativeArea}");
    print("${placemarks.first.street}");
    // print("${placemarks.first.subAdministrativeArea}");
    print("${placemarks.first.subLocality}");
    print("${placemarks.first.postalCode}");
    if(placemarks.first.postalCode!=null){
      pinCode=placemarks.first.postalCode;
    }

    fullAdd="${placemarks.first.name}, ${placemarks.first.subLocality!.isEmpty?"": "${placemarks.first.subLocality}, "}${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.country} ${placemarks.first.postalCode}";
    textEditingControllerFrom.text="Current Location : $fullAdd";
    loading=false;
    update();
  }
}