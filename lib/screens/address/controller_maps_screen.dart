import 'dart:async';
import 'dart:math';

import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:modular_ui_package/utils/utils.dart';

class ControllerMapsScreen extends GetxController{
  GoogleMapController? mapController;
  Set<Marker> markerSet={};
  String address="";
  bool loading=false;
  String latitude="";
  String longitude="";
  String? pinCode;
  TextEditingController textEditingController=TextEditingController();

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }
  getCurrentLocation() async {
    loc.Location instance=loc.Location.instance;
    loc.PermissionStatus permissionStatus=await instance.hasPermission();
    print(permissionStatus);
    if(permissionStatus!=loc.PermissionStatus.granted){
      await instance.requestPermission();
    }
    bool serviceEnabled=await instance.serviceEnabled();
    if(!serviceEnabled){
      await instance.requestService();
    }
    permissionStatus=await instance.hasPermission();
    serviceEnabled=await instance.serviceEnabled();
    if(permissionStatus!=loc.PermissionStatus.granted) return showToast("Permission not allowed");
    if(!serviceEnabled) return showToast("Location service not enabled");
    loc.LocationData locationData=await instance.getLocation();

    LatLng latLng=LatLng(locationData.latitude!, locationData.longitude!);
    BitmapDescriptor pin=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), AppImages.pin,);
    markerSet={
      Marker(markerId: MarkerId("1"),position: latLng,)
    };
    mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:latLng,zoom: 17)));
    decodeLocation(latLng.latitude, latLng.longitude);

    update();
  }



  setMarkerOnMap(latLng){
    markerSet={
      Marker(markerId: MarkerId("1"),position: latLng)
    };
    mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: latLng,zoom: 17)));
    update();
  }

  decodeLocation(double lat,double lng) async {
    loading=true;
    latitude=lat.toString();
    longitude=lng.toString();
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

    address="${placemarks.first.name}, ${placemarks.first.subLocality!.isEmpty?"": "${placemarks.first.subLocality}, "}${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.country} ${placemarks.first.postalCode}";
    print(address);
    loading=false;
    update();
  }
}