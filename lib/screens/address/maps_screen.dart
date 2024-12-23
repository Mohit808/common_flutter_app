import 'package:common_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/molecules/profile/profile_screen.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'controller_maps_screen.dart';
import 'manual_address_screen.dart';

class MapsScreen extends StatelessWidget {
  const MapsScreen({super.key, this.lat, this.lng, this.goToManual});
  final dynamic lat;
  final dynamic lng;
  final dynamic goToManual;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerMapsScreen(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(centerTitle: false,colorIconTheme: Colors.black,title: SmallText(text: "Select your pickup Location",color: Colors.black,size: 14,),color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(lat??24.165850, lng??78.327712),zoom: lat==null?4:14),
            onMapCreated: (GoogleMapController _controller){
              controller.mapController=_controller;
            },
            markers: controller.markerSet,myLocationEnabled: true,
            onTap: (LatLng latLng){
              controller.setMarkerOnMap(latLng);
              controller.decodeLocation(latLng.latitude, latLng.longitude);
            },
          ),
          bottomSheet: controller.address.isEmpty?SizedBox():Padding(
            padding: AppPaddings.paddingAll16,
            child: Column(mainAxisSize: MainAxisSize.min,children:[
              controller.loading?SizedBox(height: 16,width: 16,child: CircularProgressIndicator(strokeWidth: 2,)):Row(
                children: [
                  Icon(Icons.location_on_outlined,color: AppColors.primary,size: 16,),
                  SizedBox(width: 8,),
                  Expanded(child: SmallText(text: controller.address,fontWeight: FontWeight.w500,)),
                ],
              ),
              SizedBox(height: 8,),

              ButtonSingleAtom(widget: "SELECT & PROCEED",color: controller.loading?Colors.grey:null,tap: (){
                if(!controller.loading){
                  if(controller.address.isNotEmpty){
                    if(goToManual==null){
                      print(controller.address);
                      box.write(AppUtils.fullAddress, controller.address);
                      box.write(AppUtils.addressTitle,  controller.address.split(",")[1].trim());
                      box.write(AppUtils.latitude,  controller.latitude);
                      box.write(AppUtils.longitude,  controller.longitude);
                      Get.back(result: {
                        "fullAddress":controller.address,
                        "addressTitle":controller.address.split(",")[1].trim(),
                        "latitude":controller.latitude,
                        "longitude":controller.longitude
                      });
                      return;
                    }
                    Get.to(()=>ManualAddressScreen(description: controller.address,lat: controller.latitude,lng: controller.longitude,pinCode: controller.pinCode,))!.then((onValue){
                      if(onValue!=null){
                        Get.back(result: onValue);
                      }
                    });
                  }
                }
              },)
            ],),
          )
        );
      }
    );
  }
}
