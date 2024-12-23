import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:common_flutter_app/screens/address/maps_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';

class ShareWeelChooseAddressScreen extends StatelessWidget {
  ShareWeelChooseAddressScreen({super.key,required this.isPickAddress});
  bool isPickAddress;

  TextEditingController textEditingController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Select Address",titleColor: Colors.black,elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(children: [
          GooglePlaceAutoCompleteTextField(
            textStyle: TextStyle(fontSize: 12),
            textEditingController: textEditingController,
            googleAPIKey: "AIzaSyAGs0KCxeavJJXpELDFJhtUS3PL1YrStwY",
            inputDecoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,hintText: "Enter Location",hintStyle: TextStyle(fontSize: 12)),
            boxDecoration: BoxDecoration(borderRadius: BorderRadius.circular(4),border: Border.all(color: Colors.grey.shade200,)),
            // boxDecoration: BoxDecoration(),
            debounceTime: 800,
            countries: ["in","fr"],
            isLatLngRequired:true,
            getPlaceDetailWithLatLng: (Prediction prediction) {
              // this method will return latlng with place detail
              print("placeDetails" + prediction.lng.toString());
              print("placeDetail ${prediction.description}");
              // controller.fullAdd=prediction.description;
              // controller.latitude=double.parse("${prediction.lat}");
              // controller.longitude=double.parse("${prediction.lng}");
              // controller.update();
              Get.back(result: {
                "fullAddress":prediction.description,
                "latitude":prediction.lat,
                "longitude":prediction.lng,
              });

            }, // this callback is called when isLatLngRequired is true
            focusNode: FocusNode(),
            itemClick: (Prediction prediction) {
              hideKeyboard();
              textEditingController.text=prediction.description!;
              textEditingController.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
              // controller.showButton=true;
              // controller.update();
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
          SizedBox(height: 16,),
          InkWell(onTap: (){
            if(isPickAddress) return Get.back();
            Get.to(()=>MapsScreen())!.then((onValue){
              print(onValue);
              // if(!isPickAddress) return Get.back(result: onValue);
              if(onValue!=null){
                Get.back(result: onValue);
                // textEditingController.text=onValue["fullAddress"];
                // textEditingController.text=onValue["latitude"];
                // textEditingController.text=onValue["longitude"];

              }
            });
          },
            child: Row(children: [
              Icon(Icons.map),
              SizedBox(width: 8,),
              SmallText(text: "Select from map")
            ],),
          )
        ],),
      ),
    );
  }
}
