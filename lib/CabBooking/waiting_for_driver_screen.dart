import 'package:common_flutter_app/CabBooking/choose_ride_molecule.dart';
import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:common_flutter_app/screens/address/controller_maps_screen.dart';
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
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/utils.dart';

import 'PolyForDriverFunction.dart';

class WaitingForDriverScreen extends StatelessWidget {
  WaitingForDriverScreen({super.key,this.addFrom,this.latitudeFrom,this.longitudeFrom,this.addTo,this.latitudeTo,this.longitudeTo});

  dynamic addFrom;
  dynamic latitudeFrom;
  dynamic longitudeFrom;
  dynamic addTo;
  dynamic latitudeTo;
  dynamic longitudeTo;


  @override
  Widget build(BuildContext context) {
    print(DateTime.now().hour);
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            initialCameraPosition: CameraPosition(target: LatLng(latitudeFrom??24.165850, longitudeFrom??78.327712),zoom: 15),
            onMapCreated: (GoogleMapController _controller){
              // controller.mapController=_controller;
            },
            markers: Polyfordriverfunction.markers,
            polylines: Polyfordriverfunction.polyLines,
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
                      SmallText(text: "$addFrom",fontWeight: FontWeight.w500,color: Colors.black54,),
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
                      },child: SmallText(text: "$addTo",color: Colors.black,fontWeight: FontWeight.w500,)),
                    ],),
                  )
                ],
              ),),
            ),
          )
        ],
      ),
      bottomSheet: BottomSheet(backgroundColor: Colors.white,showDragHandle: true,onClosing: (){}, builder: (builder){
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
            NormalHeadingText(text: "Drive Accepted"),
            SizedBox(height: 16,),
            SmallText(text: "Reaching in ${Polyfordriverfunction.time}"),
            SizedBox(height: 8,),
            SmallText(text: "Driver is ${Polyfordriverfunction.distance} away"),
            SizedBox(height: 16,),
            NormalHeadingText(text: "OTP : 2345"),
            SizedBox(height: 16,),
            ButtonSingleAtom(widget: "Simulate Booking",tap: (){
              Get.back();
            },)
          ],),
        );
      }),
    );
  }
}
