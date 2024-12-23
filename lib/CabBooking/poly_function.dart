import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
class PolyFunction{

  // Position? position;
  // GoogleMapController? googleMapController;
  static Set<Marker> markers={};
  static Set<Polyline> polyLines={};
  static BitmapDescriptor? cars;
  static BitmapDescriptor? bike;
  static String? distance;
  // StreamSubscription? listener;
  static bool journeyStarted=false;
  static String? time;


  static RxBool waitingForBook=false.obs;
  static RxBool endRide=false.obs;

  static getPrice(index){
    double nightFactor=1;
    if(DateTime.now().hour>18) nightFactor=2;
    if(index==0) return double.parse(GetUtils.numericOnly(PolyFunction.distance!)) * nightFactor;
    if(index==1) return double.parse("${GetUtils.numericOnly(PolyFunction.distance!)}")* 1.5 *nightFactor;

  }

  static makePolyLine(latOrigin,lngOrigin,latDestination,lngDestination) async {
    String url = "https://maps.googleapis.com/maps/api/directions/json?origin=${latOrigin},${lngOrigin}&destination=$latDestination,$lngDestination&key=AIzaSyA1bL9RQecZMr-Tv4tegqZOxTGRz7f8CJM";
    http.Response response = await http.get(Uri.parse(url),headers: {"Access-Control-Allow-Origin": "*","Access-Control-Allow-Methods": "GET, HEAD","Access-Control-Allow-Credentials": "true"});
    print(url);
    Map values = jsonDecode(response.body);

    polyLines={};
    markers={};
    markers.add(Marker(markerId: MarkerId('loc'),position: LatLng(double.parse("$latOrigin"),double.parse("$lngOrigin")),infoWindow: InfoWindow(title: "My Loc",),));//icon: cars!

    polyLines.add(Polyline(
        polylineId: PolylineId("1"),
        width: 4,
        points: _convertToLatLng(_decodePoly(values["routes"][0]["overview_polyline"]["points"])),
        color: Colors.red,startCap: Cap.roundCap));

    distance=values['routes'][0]["legs"][0]["distance"]['text'];
    time=values['routes'][0]["legs"][0]["duration"]['text'];


    print('Last POLY ${polyLines.last.points.last}');
    // markers.add(Marker(markerId: MarkerId('loc2'),position: LatLng(polyLines.last.points.last.latitude, polyLines.last.points.last.longitude),infoWindow: InfoWindow(title: "My Loc"),icon: bike!));

    polyLines.add(Polyline(polylineId: PolylineId('112'),color: Colors.red,visible: true,width: 4,points: [LatLng(polyLines.last.points.last.latitude,polyLines.last.points.last.longitude),LatLng(double.parse(latDestination),double.parse(lngDestination))],geodesic: true,jointType: JointType.round,patterns: [PatternItem.dash(8), PatternItem.gap(15),]));
    polyLines.add(Polyline(polylineId: PolylineId('121'),color: Colors.red,visible: true,width: 4,points: [LatLng(double.parse("$latOrigin"), double.parse("$lngOrigin")),LatLng(polyLines.first.points.first.latitude,polyLines.first.points.first.longitude)],geodesic: true,jointType: JointType.round,patterns: [PatternItem.dash(8), PatternItem.gap(15),]));
    markers.add(Marker(markerId: MarkerId('loc2'),position: LatLng(double.parse("$latDestination"), double.parse("$lngDestination")),infoWindow: InfoWindow(title: "Destination"),));//icon: bike!

  }
  static List<LatLng> _convertToLatLng(List points) {
    List<LatLng> result = <LatLng>[];
    for (int i = 0; i < points.length; i++) {
      if (i % 2 != 0) {
        result.add(LatLng(points[i - 1], points[i]));
      }
    }
    return result;
  }
  static List _decodePoly(String poly) {
    var list = poly.codeUnits;
    var lList = [];
    int index = 0;
    int len = poly.length;
    int c = 0;
    do {
      var shift = 0;
      int result = 0;
      do {
        c = list[index] - 63;
        result |= (c & 0x1F) << (shift * 5);
        index++;
        shift++;
      }
      while (c >= 32);
      if (result & 1 == 1) {
        result = ~result;
      }
      var result1 = (result >> 1) * 0.00001;
      lList.add(result1);
    } while (index < len);
    for (var i = 2; i < lList.length; i++)
      lList[i] += lList[i - 2];
    // print(lList.toString());
    return lList;
  }
}