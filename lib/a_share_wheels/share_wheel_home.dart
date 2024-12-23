import 'package:common_flutter_app/CabBooking/booking_home.dart';
import 'package:common_flutter_app/a_share_wheels/controller_wheel_share_home.dart';
import 'package:common_flutter_app/a_share_wheels/pick_up/share_weel_choose_address_screen.dart';
import 'package:common_flutter_app/a_share_wheels/polyline_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../CabBooking/poly_function.dart';
import 'location_fork/decode_location_function.dart';

class ShareWheelHome extends StatelessWidget {
  ShareWheelHome({super.key});


  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControllerWheelShareHome(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(
            title: "",
            height: 0,
            color: AppColors.scaffoldBackgroundColor,
            elevation: 0,
          ),
          body: Obx(() => Stack(
            children: [
              GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition:
                CameraPosition(target: LatLng(24.165850, 78.327712), zoom: 15),
                onMapCreated: (GoogleMapController _controller) {
                  controller.mapController = _controller;
                },
                onCameraMove: (cameraPosition) async {
                  controller.latLngSelected = cameraPosition.target;
                  print(controller.latLngSelected);
                  // Update the marker in the reactive RxSet
                  controller.markers.clear();
                  controller.markers.add(
                    Marker(
                      markerId: MarkerId("12"),
                      position: cameraPosition.target,
                    ),
                  );

                },
                onCameraIdle: (){
                  DecodeLocationFunction().decodeLocation(controller.latLngSelected!.latitude,controller.latLngSelected!.longitude).then((value){
                    controller.address.value=value;
                  });
                },
                markers: controller.markers.toSet(),
              ),
              ContainerDecorated(colorBorder: Colors.grey.shade300,onTap: (){
                Get.to(()=>ShareWeelChooseAddressScreen(isPickAddress: true,))!.then((onValue){
                  if(onValue!=null){
                    controller.address.value=onValue['fullAddress'];
                    controller.latLngSelected=LatLng(double.parse("${onValue['latitude']}"), double.parse("${onValue['longitude']}"));
                    controller.markers.clear();
                    controller.markers.add(
                      Marker(
                        markerId: MarkerId("12"),
                        position: LatLng(controller.latLngSelected!.latitude,controller.latLngSelected!.longitude),
                      ),
                    );
                    controller.mapController!.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(controller.latLngSelected!.latitude, controller.latLngSelected!.longitude),zoom: 17)));

                  }
                });
              },paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 12),color: Colors.white,margin: 24,child: Row(children: [
                ContainerDecorated(color: Colors.green,borderRadius: 40,padding: 4,child: Icon(Icons.arrow_upward_outlined,size: 12,color: Colors.white,)),
                SizedBox(width: 8,),
                Obx(()=>Expanded(child: SmallText(text: controller.address.value.isEmpty?"Fetching location...":controller.address.value,overflow: TextOverflow.ellipsis,)))
              ],),)
            ],
          )),
          bottomSheet: ContainerDecorated(colorBorder: Colors.grey.shade300,padding: 16,color: Colors.white,
            child: Column(mainAxisSize: MainAxisSize.min,children: [
              ContainerDecorated(colorBorder: Colors.grey.shade300,onTap: (){
                Get.to(()=>ShareWeelChooseAddressScreen(isPickAddress: false,))!.then((onValue) async {
                  if(onValue!=null){
                    showLoading();
                    await PolyFunction.makePolyLine(controller.latLngSelected!.latitude, controller.latLngSelected!.longitude, onValue['latitude'], onValue['longitude']);
                    closeLoading();
                    Get.to(()=>BookingHome(addFrom: controller.address.value,latitudeFrom: controller.latLngSelected!.latitude,longitudeFrom: controller.latLngSelected!.longitude,addTo: onValue['fullAddress'],latitudeTo: onValue['latitude'],longitudeTo: onValue['longitude'],));
                  }
                });
              },paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 12),child: Row(
                children: [
                  Icon(Icons.pin_drop,size: 16,),
                  SizedBox(width: 8,),
                  Expanded(child: SmallText(text: "Drop Location",overflow: TextOverflow.ellipsis,fontWeight: FontWeight.w500,)),
                ],
              )),
              SizedBox(height: 48,)
            ],),
          ),
        );
      },
    );
  }
}
