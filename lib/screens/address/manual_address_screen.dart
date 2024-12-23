import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'controller_manual_address.dart';

class ManualAddressScreen extends StatelessWidget {
  const ManualAddressScreen({super.key, required this.description, required this.lat, required this.lng, this.pinCode});
  final String description;
  final String lat;
  final String lng;
  final String? pinCode;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerManualAddress(pinCode:pinCode,fullAddress: description),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(titleColor: Colors.black,title: SmallText(text: "Enter Address details",color: Colors.black,size: 14,),centerTitle: false,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 16,right: 16),
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  SizedBox(height: 200,
                    child: Stack(
                      children: [
                        GoogleMap(
                          zoomControlsEnabled: false,
                          scrollGesturesEnabled: false,
                          zoomGesturesEnabled: false,
                          initialCameraPosition: CameraPosition(target: LatLng(double.parse(lat),double.parse(lng)),zoom: 15),
                          markers: {
                            Marker(markerId: MarkerId("1"),position: LatLng(double.parse(lat),double.parse(lng)))
                          },
                        ),
                        Align(alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(onTap: (){
                              Get.back();
                            },
                              child: ContainerDecorated(color: Colors.white,padding: 8,
                                child: Row(
                                  children: [
                                    Icon(Icons.location_on_outlined,color: AppColors.primary,size: 16,),
                                    const SizedBox(width: 8,),
                                    Expanded(child: SmallText(text: description,fontWeight: FontWeight.w500,)),
                                    SmallText(text: "Edit",color: AppColors.primary,fontWeight: FontWeight.w600,)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16,),
                  Row(children: [
                    Icon(Icons.location_on,color: AppColors.primary,),
                    SizedBox(width: 8,),
                    BigText20(text: description.split(",")[1])
                  ],),
                  SizedBox(height: 4,),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SmallText(text: description),
                  ),
                  SizedBox(height: 16,),
                  ContainerDecorated(color: AppColors.primary.withOpacity(0.1),paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),child: SmallText(text: "A detailed address will help our Delivery person reach your doorstep easily",color: AppColors.primary,),),

                  SizedBox(height: 8,),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerHouseNo,heading: "HOUSE / FLAT / BLOCK NO. ",hintText: "",),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerArea,heading: "APARTMENT / ROAD / AREA",hintText: "",),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerLandmark,heading: "Landmark (optional)",hintText: "Enter landmark",),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerHowToReach,heading: "How to reach instruction (Optional)",hintText: "Enter message",),
                  SizedBox(height: 16,),
                  SmallText(text: "Save as"),
                  SizedBox(height: 8,),
                  Row(children: [
                    InkWell(onTap: (){
                      controller.savedAs="Home";
                      controller.update();
                    },
                      child: ContainerDecorated(color: controller.savedAs=="Home"?AppColors.primary: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade300,padding: 8,child: Row(children: [
                        Icon(Icons.home,size: 16,color: controller.savedAs=="Home"?Colors.white:null,),
                        SizedBox(width: 8,),
                        SmallText(text: "Home",color: controller.savedAs=="Home"?Colors.white:null,),
                        SizedBox(width: 4,)
                      ],),),
                    ),

                    SizedBox(width: 16,),
                    InkWell(onTap: (){
                      controller.savedAs="Work";
                      controller.update();
                    },
                      child: ContainerDecorated(color: controller.savedAs=="Work"?AppColors.primary: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade300,padding: 8,child: Row(children: [
                        Icon(Icons.work,size: 16,color: controller.savedAs=="Work"?Colors.white:null,),
                        SizedBox(width: 8,),
                        SmallText(text: "Work",color: controller.savedAs=="Work"?Colors.white:null,),
                        SizedBox(width: 4,)
                      ],),),
                    ),
                  ],),
                  SizedBox(height: 50,)
                ],),
              ),
            ),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "SAVE",tap: (){
              controller.submit(address: description,lat: lat,lng: lng );
            },)
          ],
        );
      }
    );
  }
}
