import 'package:common_flutter_app/CabBooking/booking_home.dart';
import 'package:common_flutter_app/CabBooking/controller_pickup_wheel.dart';
import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:common_flutter_app/screens/address/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/utils.dart';


class PickupWheelScreen extends StatelessWidget {
  const PickupWheelScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder(init: ControllerPickupWheel(),
        builder: (controller) {
          print(controller.fullAddDrop);
          return Scaffold(
            appBar: AppBarCommon(title: "Pickup drop location",color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: Colors.black,),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  controller.permissionAllowed?SizedBox():ContainerDecorated(marginEdgeInsets: EdgeInsets.only(bottom: 16),padding: 16,color: AppColors.primary.withOpacity(0.1),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "Oops! It Look like Location Permission is not allowed",color: AppColors.primary,fontWeight: FontWeight.w500,),
                      SizedBox(height: 8,),
                      Row(children: [
                        // SmallText(text: "Click here to ",fontWeight: FontWeight.w500,color: Colors.black54,),
                        // SizedBox(width: 8,),
                        ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: AppColors.primary,child: SmallText(text: "Enable Location",color: Colors.white,fontWeight: FontWeight.w600,))
                      ],)
                    ],
                  ),),
                  controller.serviceEnabled?SizedBox():ContainerDecorated(marginEdgeInsets: EdgeInsets.only(bottom: 16),padding: 16,color: AppColors.primary.withOpacity(0.1),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "Oops! It Look like Location Service is not enable",color: AppColors.primary,fontWeight: FontWeight.w500,),
                      SizedBox(height: 8,),
                      Row(children: [
                        // SmallText(text: "Click here to ",fontWeight: FontWeight.w500,color: Colors.black54,),
                        // SizedBox(width: 8,),
                        ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: AppColors.primary,child: SmallText(text: "Enable Location Service",color: Colors.white,fontWeight: FontWeight.w600,))
                      ],)
                    ],
                  ),),
                  !controller.locationFetching?SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    LinearProgressIndicator(),
                    SmallText(text: "Getting Location...",size: 8,),
                    SizedBox(height: 16,)
                  ],),
                  controller.textEditingControllerFrom.text.startsWith("Current Location")?SizedBox():ContainerDecorated(marginEdgeInsets: EdgeInsets.only(bottom: 16),padding: 16,color: AppColors.primary.withOpacity(0.1),child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "Your current location is fetched successfully!",color: AppColors.primary,fontWeight: FontWeight.w500,),
                      SmallText(text: "For pick location use current location  ",color: Colors.deepOrangeAccent,fontWeight: FontWeight.w500,size: 10,),
                      SizedBox(height: 8,),
                      Row(children: [
                        // SmallText(text: "Click here to ",fontWeight: FontWeight.w500,color: Colors.black54,),
                        // SizedBox(width: 8,),
                        ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: AppColors.primary,child: SmallText(text: "Use Current Location",color: Colors.white,fontWeight: FontWeight.w600,))
                      ],)
                    ],
                  ),),
                  Row(
                    children: [
                      Expanded(
                        child: GooglePlaceAutoCompleteTextField(
                          textStyle: TextStyle(fontSize: 12),
                          textEditingController: controller.textEditingControllerFrom,
                          googleAPIKey: "AIzaSyAGs0KCxeavJJXpELDFJhtUS3PL1YrStwY",
                          inputDecoration: InputDecoration(
                            // suffixIcon: Icon(Icons.my_location,color: Colors.blue,),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: ContainerDecorated(color: Colors.green,borderRadius: 40,padding: 4,child: Icon(Icons.arrow_upward_outlined,size: 12,color: Colors.white,)),
                              ),contentPadding: EdgeInsets.only(top: 18),
                              border: InputBorder.none,hintText: "Current Location",hintStyle: TextStyle(fontSize: 12)),
                          boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.shade200,)),
                          // boxDecoration: BoxDecoration(),
                          debounceTime: 800,
                          countries: ["in","fr"],
                          isLatLngRequired:true,
                          getPlaceDetailWithLatLng: (Prediction prediction) {
                            // this method will return latlng with place detail
                            print("placeDetails" + prediction.lng.toString());
                            print("placeDetail ${prediction.description}");
                            controller.fullAdd=prediction.description;
                            controller.latitude=double.parse("${prediction.lat}");
                            controller.longitude=double.parse("${prediction.lng}");
                            controller.update();

                          }, // this callback is called when isLatLngRequired is true
                          focusNode: FocusNode(),
                          itemClick: (Prediction prediction) {
                            hideKeyboard();
                            controller.textEditingControllerFrom.text=prediction.description!;
                            controller.textEditingControllerFrom.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                            // controller.showButton=true;
                            controller.update();
                          },
                          itemBuilder: (context, index, Prediction prediction) {
                            return Container(width: double.infinity,decoration: BoxDecoration(),
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

                        ),
                      ),
                      SizedBox(width: 8,),
                      ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade200,padding: 12,child: Icon(Icons.map,color: Colors.blue,),onTap: (){
                        navigate(controller,controller.fullAdd,controller.dropLat,controller.dropLng,controller.textEditingControllerFrom);
                      },),
                    ],
                  ),


                  SizedBox(height: 16,),

                  Row(
                    children: [
                      Expanded(
                        child: GooglePlaceAutoCompleteTextField(
                          textStyle: TextStyle(fontSize: 12),
                          textEditingController: controller.textEditingControllerTo,
                          googleAPIKey: "AIzaSyAGs0KCxeavJJXpELDFJhtUS3PL1YrStwY",
                          inputDecoration: InputDecoration(
                              prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: ContainerDecorated(color: Colors.green.withOpacity(0.1),borderRadius: 40,padding: 8,child: ContainerDecorated(color: Colors.green,height: 10,width: 10,))

                              ),contentPadding: EdgeInsets.only(top: 18),
                              border: InputBorder.none,hintText: "Drop Location",hintStyle: TextStyle(fontSize: 12)),
                          boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.shade200,)),
                          // boxDecoration: BoxDecoration(),
                          debounceTime: 800,
                          countries: ["in","fr"],
                          isLatLngRequired:true,
                          getPlaceDetailWithLatLng: (Prediction prediction) {
                            // this method will return latlng with place detail
                            print("placeDetails" + prediction.lng.toString());
                            print("placeDetail ${prediction.description}");
                            controller.fullAddDrop=prediction.description;
                            controller.dropLat=prediction.lat;
                            controller.dropLng=prediction.lng;
                            controller.update();

                          }, // this callback is called when isLatLngRequired is true
                          focusNode: FocusNode(),
                          itemClick: (Prediction prediction) {
                            hideKeyboard();
                            controller.textEditingControllerTo.text=prediction.description!;
                            controller.textEditingControllerTo.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                            // controller.showButton=true;
                            controller.update();
                          },
                          itemBuilder: (context, index, Prediction prediction) {
                            return Container(width: double.infinity,decoration: BoxDecoration(),
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
                        ),
                      ),
                      SizedBox(width: 8,),
                      ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade200,padding: 12,child: Icon(Icons.map,color: Colors.blue,),onTap: (){
                        navigate(controller,controller.fullAddDrop,controller.latitude,controller.longitude,controller.textEditingControllerTo);
                      },),
                    ],
                  ),
                ],
              ),
            ),
            persistentFooterButtons:  controller.fullAdd==null || controller.fullAddDrop==null?null:[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ButtonSingleAtom(widget: "Book Ride",tap: () async {
                  PolyFunction.waitingForBook.value=false;
                  PolyFunction.endRide.value=false;

                  await PolyFunction.makePolyLine(controller.latitude, controller.longitude, controller.dropLat, controller.dropLng);
                  Get.to(()=>BookingHome(addFrom: controller.fullAdd,latitudeFrom: controller.latitude,longitudeFrom: controller.longitude,addTo: controller.fullAddDrop,latitudeTo: controller.latitude,longitudeTo: controller.longitude,));
                },),
              )
            ],
          );
        }
    );
  }
  searchBar(hint,TextEditingController textEditingController,lat,lng,fullAdd,ControllerPickupWheel controller,prefix){
    return

      GooglePlaceAutoCompleteTextField(
        textStyle: TextStyle(fontSize: 12),
        textEditingController: textEditingController,
        googleAPIKey: "AIzaSyAGs0KCxeavJJXpELDFJhtUS3PL1YrStwY",
        inputDecoration: InputDecoration(
            prefixIcon: prefix,contentPadding: EdgeInsets.only(top: 18),
            border: InputBorder.none,hintText: hint,hintStyle: TextStyle(fontSize: 12)),
        boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.shade200,)),
        // boxDecoration: BoxDecoration(),
        debounceTime: 800,
        countries: ["in","fr"],
        isLatLngRequired:true,
        getPlaceDetailWithLatLng: (Prediction prediction) {
          // this method will return latlng with place detail
          print("placeDetails" + prediction.lng.toString());
          print("placeDetail ${prediction.description}");
          fullAdd=prediction.description;
          lat=prediction.lat;
          lng=prediction.lng;
          controller.update();

          // Get.to(()=>MapsScreen(lat: double.parse(prediction.lat!),lng: double.parse(prediction.lng!),))!.then((onValue){
          //   if(onValue!=null){
          //     if(initial!=null) return Get.offAll(()=>DashboardScreen());
          //     Get.back(result: onValue);
          //   }
          // });

        }, // this callback is called when isLatLngRequired is true
        focusNode: FocusNode(),
        itemClick: (Prediction prediction) {
          hideKeyboard();
          textEditingController.text=prediction.description!;
          textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
          // controller.showButton=true;
          controller.update();
        },
        itemBuilder: (context, index, Prediction prediction) {
          return Container(width: double.infinity,decoration: BoxDecoration(),
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

  navigate(controller,fullAddDrop,latitude,longitude,textEditingController){
    Get.to(()=>MapsScreen())!.then((onValue){
      print(onValue);
      if(onValue!=null){
        fullAddDrop=onValue["fullAddress"];
        latitude=double.parse("${onValue["latitude"]}");
        longitude=double.parse("${onValue["longitude"]}");
        textEditingController.text=fullAddDrop;
        controller.pdate();
      }
    });
  }
}
