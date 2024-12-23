import 'package:common_flutter_app/CabBooking/poly_function.dart';
import 'package:common_flutter_app/CabBooking/waiting_for_driver_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

import '../utils/app_images.dart';

class ChooseRideMolecule extends StatelessWidget {
  ChooseRideMolecule({super.key,this.onTap});

  RxInt selectedIndex=0.obs;
  Function(int)? onTap;

  @override
  Widget build(BuildContext context) {
    return Obx(()=>ContainerDecorated(color: Colors.white,paddingEdgeInsets: EdgeInsets.only(left: 16,right: 16,bottom: 16),
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        Row(children: [
          Icon(Icons.keyboard_arrow_left_rounded),
          SizedBox(width: 16,),
          HeadingText(text: "Choose a Ride"),
          Spacer(),
          SmallText(text: DateTime.now().hour>18?"Night":"",size: 10,color: AppColors.primary,),
          SizedBox(width: 8,),
          SmallText(text: "${PolyFunction.distance??""} | ${PolyFunction.time??""}",fontWeight: FontWeight.w700,)
        ],),
        SizedBox(height: 8,),
        rideItems(PolyFunction.getPrice(0),"Bike",AppImages.bike,0),
        rideItems(PolyFunction.getPrice(1),"Car",AppImages.car,1),
        Divider(),
        SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          SmallText(text: "Fix Schedule",fontWeight: FontWeight.w600,),
          Icon(Icons.calendar_month_outlined,size: 16,),
        ],),
        SizedBox(height: 16,),
        ButtonSingleAtom(widget: "₹ ${PolyFunction.getPrice(selectedIndex.value)
        } | Book Now",color: Colors.green,tap: (){

          if(onTap!=null){
            onTap!(selectedIndex.value);
          }
        },)

      ],),
    ));
  }

  rideItems(distance,name,image,index){
    return  Padding(
      padding: const EdgeInsets.only(bottom: 8.0,top: 8),
      child: InkWell(onTap: (){
        selectedIndex.value=index;
      },
        child: ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),colorBorder: selectedIndex.value==index?Colors.green:Colors.grey.shade200,color: Colors.white,child: Row(children: [
          NetworkOrAssetImage(src: image,height: 40,width: 40,),
          SizedBox(width: 16,),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              NormalHeadingText(text: name),
              // SizedBox(height: 8,),
              // Row(children: [
              //   Icon(Icons.access_time,size: 15,color: Colors.grey,),
                // SizedBox(width: 4,),
                // SmallText(text: "3-5 mins",color: Colors.grey,fontWeight: FontWeight.w500,),
                // SizedBox(width: 16,),
                // Icon(Icons.account_circle_outlined,size: 15,color: Colors.grey,),
                // SizedBox(width: 4,),
                // SmallText(text: "04",color: Colors.grey,fontWeight: FontWeight.w500,)
              // ],)
            ],),
          ),
          NormalHeadingText(text: "₹ ${distance}")
        ],),),
      ),
    );
  }
}
