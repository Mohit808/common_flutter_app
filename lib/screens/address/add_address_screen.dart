import 'package:common_flutter_app/dashboard_screen.dart';
import 'package:common_flutter_app/screens/address/maps_screen.dart';
import 'package:common_flutter_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';

import 'controller_add_address.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key, this.initial});
  final dynamic initial;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerAddAddress(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(titleColor: Colors.black,title: SmallText(text: "Enter area or apartment name",color: Colors.black,size: 14,),centerTitle: false,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: Padding(
            padding: AppPaddings.paddingAll16,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              searchBar(controller.textEditingController, controller),
              SizedBox(height: 16,),
              InkWell(onTap: (){
                Get.to(()=>MapsScreen())!.then((onValue){
                  if(onValue!=null){
                    if(initial!=null) return Get.offAll(()=>DashboardScreen());
                    Get.back(result: onValue);
                  }
                });
              },
                child: Row(
                  children: [
                    Icon(Icons.navigation_sharp,color: AppColors.primary,),
                    SizedBox(width: 16,),
                    NormalHeadingText(text: "Use my current location",color: AppColors.primary,)
                  ],
                ),
              ),
              Divider(height: 24,),
              InkWell(onTap: (){
                Get.to(()=>MapsScreen(goToManual: true,))!.then((onValue){
                  if(onValue!=null){
                    if(initial!=null) return Get.offAll(()=>DashboardScreen());
                    Get.back(result: onValue);
                  }
                });
              },
                child: Row(
                  children: [
                    Icon(Icons.add,color: AppColors.primary,),
                    SizedBox(width: 16,),
                    NormalHeadingText(text: "Add new address",color: AppColors.primary,)
                  ],
                ),
              ),

              Divider(height: 24,),
              SizedBox(height: 16,),
              NormalHeadingText(text:controller.list.isEmpty?"": "SAVED ADDRESS",letterSpacing: 0.5,fontWeight: FontWeight.w400,color: Colors.black54,),
              SizedBox(height: 16,),
              ListView.builder(shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                return Row(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Row(children: [
                          Icon(controller.list[index].addressType=="Home"?Icons.home:Icons.work,size: 20,),
                          SizedBox(width: 8,),
                          HeadingText(text: controller.list[index].addressType!,fontWeight: FontWeight.w700,),
                          SizedBox(width: 8,),
                          // ContainerDecorated(color: Colors.black,width: 6,height: 6,),
                          // SizedBox(width: 8,),
                          // SmallText(text: "240.9 km",fontWeight: FontWeight.w500,color: Colors.black54,),
                        ],),
                        SizedBox(height: 8,),
                        SmallText(text: "${controller.list[index].fullAddress}",color: Colors.black54,fontWeight: FontWeight.w600,),
                        Divider(height: 24,)
                      ],),
                    ),
                    ContainerDecorated(padding: 8,color: Colors.white,child: Icon(Icons.delete,size: 18,color: Colors.red,))
                  ],
                );
              })
            ],),
          ),
        );
      }
    );
  }

  searchBar(TextEditingController textEditingController,ControllerAddAddress controller){
    return GooglePlaceAutoCompleteTextField(
      textStyle: TextStyle(fontSize: 12),
      textEditingController: textEditingController,
      googleAPIKey: "AIzaSyAGs0KCxeavJJXpELDFJhtUS3PL1YrStwY",
      inputDecoration: InputDecoration(prefixIcon: Icon(Icons.search,color: AppColors.primary,),contentPadding: EdgeInsets.only(top: 18),border: InputBorder.none,hintText: "Search for a building, street name, or area",hintStyle: TextStyle(fontSize: 12)),
      boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.shade300,)),
      // boxDecoration: BoxDecoration(),
      debounceTime: 800,
      countries: ["in","fr"],
      isLatLngRequired:true,
      getPlaceDetailWithLatLng: (Prediction prediction) {
        // this method will return latlng with place detail
        print("placeDetails" + prediction.lng.toString());
        print("placeDetail ${prediction.description}");
        controller.description=prediction.description;
        controller.lat=prediction.lat;
        controller.lng=prediction.lng;
        Get.to(()=>MapsScreen(lat: double.parse(prediction.lat!),lng: double.parse(prediction.lng!),))!.then((onValue){
          if(onValue!=null){
            if(initial!=null) return Get.offAll(()=>DashboardScreen());
            Get.back(result: onValue);
          }
        });

      }, // this callback is called when isLatLngRequired is true
      itemClick: (Prediction prediction) {
        hideKeyboard();
        textEditingController.text=prediction.description!;
        textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
        // controller.showButton=true;
        controller.update();
      },
      itemBuilder: (context, index, Prediction prediction) {
        return Container(decoration: BoxDecoration(),
          padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Icon(Icons.location_on,size: 18,),
              SizedBox(width: 7,),
              Expanded(child: SmallText(text: "${prediction.description??""}"))
            ],
          ),
        );
      },
      seperatedBuilder: Divider(),
      isCrossBtnShown: true,
      containerHorizontalPadding: 0,
      placeType: PlaceType.geocode,
    );
  }

}
