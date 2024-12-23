import 'dart:async';
import 'dart:convert';

import 'package:common_flutter_app/CabBooking/PolyForDriverFunction.dart';
import 'package:common_flutter_app/CabBooking/choose_ride_molecule.dart';
import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:common_flutter_app/CabBooking/waiting_for_driver_screen.dart';
import 'package:common_flutter_app/screens/address/controller_maps_screen.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:lottie/lottie.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:google_maps_flutter_platform_interface/src/types/marker.dart' as mark;
import 'package:geolocator/geolocator.dart';


class BookingHome extends StatefulWidget {
  BookingHome({super.key,this.addFrom,this.latitudeFrom,this.longitudeFrom,this.addTo,this.latitudeTo,this.longitudeTo});

  dynamic addFrom;
  dynamic latitudeFrom;
  dynamic longitudeFrom;
  dynamic addTo;
  dynamic latitudeTo;
  dynamic longitudeTo;

  @override
  State<BookingHome> createState() => _BookingHomeState();
}

class _BookingHomeState extends State<BookingHome> {

  StreamSubscription? listener;
  Position? position;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }
  getLocation() async {
    // LocationPermission permission=await Geolocator.checkPermission();
    //
    // if(permission==LocationPermission.denied){
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     return Future.error('Location permissions are denied');
    //   }
    // }
    position=await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('First time Location $position');
    // markers.add(Marker(markerId: MarkerId('loc2'),position: LatLng(28.620859, 77.382314),infoWindow: InfoWindow(title: "My Loc"),icon: bike!));
    // googleMapController!.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(zoom: 17,target: LatLng(position!.latitude,position!.longitude))));
    // setState(() {
    // });

    listener=Geolocator.getPositionStream(locationSettings: LocationSettings(accuracy: LocationAccuracy.high)).listen((event) {
      position=event;
      // markers={};
      // print(markers.length);

      // print(event.heading);

      // double bearing = Geolocator.bearingBetween(
      //   event.latitude,
      //   event.longitude, 28.628374, 77.392018
      // );

      // print('${event.latitude}  ${event.longitude}');


      if(PolyFunction.polyLines.isNotEmpty){
        // print('FIRSTTT ${polyLines.first.points..toList()[1]}');
        // print('FIRSTTT22 ${polyLines.first.points.toList()[2]}');
        // print(polyLines.toList().join(","));
        // print('FIRSTTT ${polyLines.toList()[1].points.toList()[0].latitude}');
        // var laaaa=polyLines.first.points.toList()[0].latitude;
        // var loooo=polyLines.first.points.toList()[0].longitude;
        if(PolyFunction.polyLines.first.points.toList().length>1){
          var distance=Geolocator.distanceBetween(event.latitude, event.longitude, PolyFunction.polyLines.first.points.toList()[1].latitude, PolyFunction.polyLines.first.points.toList()[1].longitude);
          print("DISTANCEEE $distance");
          if(distance<20){
            PolyFunction.polyLines.first.points.removeAt(0);
          }
        }
        if(PolyFunction.journeyStarted==true){
          PolyFunction.polyLines.first.points.removeAt(0);
          // polyLines.add(Polyline(polylineId: PolylineId('112'),color: Colors.blue,visible: true,width: 4,points: [LatLng(event.latitude,event.longitude),LatLng(laaaa, loooo)],geodesic: true,jointType: JointType.round,patterns: [PatternItem.dash(8), PatternItem.gap(15),]));
          PolyFunction.polyLines.first.points.insert(0,LatLng(event.latitude, event.longitude));
        }else{
          var distance=Geolocator.distanceBetween(event.latitude, event.longitude, PolyFunction.polyLines.first.points.toList()[0].latitude, PolyFunction.polyLines.first.points.toList()[0].longitude);
          print("DISTANCEEE $distance");
          if(distance<20){
            PolyFunction.journeyStarted=true;
            PolyFunction.polyLines.removeWhere((element) => element.polylineId.toString()=="PolylineId(121)");
          }
        }

      }

      if(PolyFunction.endRide.value){
        PolyFunction.markers.add(mark.Marker(rotation: event.heading,markerId: MarkerId('loc'),position: LatLng(event.latitude,event.longitude),infoWindow: InfoWindow(title: "My Loc",),icon: PolyFunction.cars!));
      }
      // markers.add(Marker(markerId: MarkerId('loc'),position: LatLng(event.latitude,event.longitude),infoWindow: InfoWindow(title: "My Loc",),icon: cars!));

      setState(() {
      });
    });


    // polyLines.add(Polyline(polylineId: PolylineId('1'),color: Colors.red,visible: true,width: 2,points: [LatLng(position!.latitude,position!.longitude),LatLng(28.627135, 77.374476)],geodesic: true,jointType: JointType.round,patterns: [PatternItem.dash(1)]));
    // markers.add(Marker(markerId: MarkerId('loc'),position: LatLng(position!.latitude,position!.longitude),infoWindow: InfoWindow(title: "My Loc",),icon: cars!));
  }


  @override
  void dispose() {
    listener!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(widget.latitudeFrom??24.165850, widget.longitudeFrom??78.327712),zoom: 15),
            onMapCreated: (GoogleMapController _controller){
              // controller.mapController=_controller;
            },
            markers: PolyFunction.markers,
            polylines: PolyFunction.polyLines,
            onTap: (LatLng latLng){
              // controller.setMarkerOnMap(latLng);
              // controller.decodeLocation(latLng.latitude, latLng.longitude);
            },
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ContainerDecorated(padding: 8,color: Colors.white,child: Row(
                children: [
                  Column(mainAxisSize: MainAxisSize.min,children: [
                    ContainerDecorated(color: Colors.green,borderRadius: 40,padding: 4,child: Icon(Icons.arrow_upward_outlined,size: 16,color: Colors.white,)),
                    Container(height: 24,width: 2,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),),
                    ContainerDecorated(color: Colors.green.withOpacity(0.1),borderRadius: 40,padding: 8,child: ContainerDecorated(color: Colors.green,))
                  ],),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
                      // searchBar(controller.textEditingController, controller),
                      SmallText(text: "From",fontWeight: FontWeight.w500,color: Colors.black54,),
                      SizedBox(height: 4,),
                      SmallText(text: "${widget.addFrom}",fontWeight: FontWeight.w500,color: Colors.black54,),
                      // SizedBox(height: 16,),
                      Divider(),

                      SmallText(text: "To",fontWeight: FontWeight.w500,color: Colors.black54),
                      SizedBox(height: 4,),
                      InkWell(onTap: (){
                        // showModalBottomSheet(context: context, builder: (builder){
                        //   return  BottomSheet(showDragHandle: true,onClosing: (){}, builder: (builder){
                        //   return ChooseRideMolecule();
                        //   });
                        // });
                      },child: SmallText(text: "${widget.addTo}",color: Colors.black,fontWeight: FontWeight.w500,)),
                    ],),
                  )
                ],
              ),),
            ),
          )
        ],
      ),
      bottomSheet: BottomSheet(backgroundColor: Colors.white,showDragHandle: true,onClosing: (){}, builder: (builder){
        return
          Obx(()=>
          PolyFunction.endRide.value?
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              NormalHeadingText(text: "Reaching in ${PolyFunction.time}"),
              SizedBox(height: 16,),
              ButtonSingleAtom(widget: "End Ride",tap: (){
                Get.back();
              },)
            ],),
          )
              :
          PolyFunction.waitingForBook.value?
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              Lottie.asset(AppImages.waiting),
              NormalHeadingText(text: "Waiting for driver to accept"),
              SizedBox(height: 16,),
              ButtonSingleAtom(widget: "Simulate booking",tap: () async {
                if(PolyFunction.waitingForBook.value){
                  showLoading();
                  await Polyfordriverfunction.makePolyLine(widget.latitudeFrom+.00200, widget.longitudeFrom+.00200, widget.latitudeTo, widget.longitudeTo);
                  closeLoading();
                  Get.to(()=>WaitingForDriverScreen(addFrom: widget.addFrom,latitudeFrom: widget.latitudeFrom,longitudeFrom: widget.longitudeFrom,addTo: widget.addTo,latitudeTo: widget.latitudeTo,longitudeTo: widget.longitudeTo,))!.then((onValue) async {
                    PolyFunction.waitingForBook.value=false;
                    PolyFunction.endRide.value=true;

                    // PolyFunction.markers.removeWhere((test)=>test.markerId==MarkerId("loc2"));
                    var cars=await BitmapDescriptor.fromAssetImage(ImageConfiguration(), AppImages.car);
                    PolyFunction.markers.add(mark.Marker(markerId: MarkerId('loc'),position: LatLng(double.parse("${widget.latitudeTo}"), double.parse("${widget.longitudeTo}")),infoWindow: InfoWindow(title: "Destination"),icon: cars));//icon: bike!
                    setState(() {
                    });
                  });
                }
              },),

            ],),
          )
              :
          ChooseRideMolecule(onTap: (selectedIndex) async {


            showLoading();
            try{
              var res=await NetworkManager().post(AppConst.wheelBookings,
                  data:jsonEncode({
                    "customer":"1",
                    "addressFrom":"${widget.addFrom}",
                    "latitudeFrom":"${widget.latitudeFrom}",
                    "longitudeFrom":"${widget.longitudeFrom}",
                    "addressTo":"${widget.addTo}",
                    "latitudeTo":"${widget.latitudeTo}",
                    "longitudeTo":"${widget.longitudeTo}",
                    "vehicle":selectedIndex==0?"bike":"car",
                    "polylineRide":"${PolyFunction.polyLines.map((toElement)=>toElement.toJson())}"
                  })
              );
              closeLoading();
              ModelX modelX=ModelX.fromJson(res);
              if(modelX.status==200){
                PolyFunction.waitingForBook.value=true;
              }
            }catch(e){
              closeLoading();
              showToastError("$e");
            }
          },));
      }),
    );
  }
}
