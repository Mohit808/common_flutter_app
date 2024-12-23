import 'package:common_flutter_app/a_share_wheels/location_fork/decode_location_function.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:modular_ui_package/utils/utils.dart';


class ControllerWheelShareHome extends GetxController{
  GoogleMapController? mapController;

  LatLng? latLngSelected;
  RxString address="".obs;

  bool permissionAllowed=true;
  bool serviceEnabled=true;
  bool locationFetching=false;
  // double? latitude;
  // double? longitude;

  final markers = RxSet<Marker>({
    // Marker(markerId: MarkerId("1"), position: LatLng(24.165850, 78.327712))
  });

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
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
    markers.clear();
    markers.add(
      Marker(
        markerId: MarkerId("12"),
        position: LatLng(pos.latitude, pos.longitude),
      ),
    );
    mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(pos.latitude, pos.longitude),zoom: 17)));

    // locationFetching=false;
    // update();
    // latitude=pos.latitude;
    // longitude=pos.longitude;
    // DecodeLocationFunction().decodeLocation(pos.latitude, pos.longitude);
  }
}