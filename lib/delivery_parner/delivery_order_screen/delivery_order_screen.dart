import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

import '../../a_share_wheels/share_wheel_order_history.dart';

class DeliveryOrderScreen extends StatelessWidget {
  const DeliveryOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Orders",elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: itemWidget(),
    );
  }
  Widget itemWidget(){
    return ContainerDecorated(onTap: (){
      openBottomSheet(sheetBottom);
    },padding: 0,marginEdgeInsets: EdgeInsets.only(bottom: 16),color: Colors.white,colorBorder: Colors.grey.shade300,child:
    Column(
      children: [
        ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 12),color: Colors.green.withOpacity(0.08),colorBorder: Colors.grey.shade300,child: Column(children: [
          Row(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "From : ",color: Colors.black54,fontWeight: FontWeight.w600,),
                  SizedBox(height: 8,),
                  SmallText(text: "To :   ",color: Colors.black54,fontWeight: FontWeight.w600,),
                ],
              ),
              SizedBox(width: 16,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "Big bazar",fontWeight: FontWeight.w700,),
                  SizedBox(height: 8,),
                  SmallText(text: "Amit Yadav",fontWeight: FontWeight.w700,),

                ],
              ),
            ],
          ),
        ],),),
        Container(padding: AppPaddings.paddingAll16,child: Row(
          children: [
            Column(children: [
              Icon(Icons.arrow_circle_down_rounded,size: 16,color: Colors.blue,),
              SizedBox(height: 36,),
              Icon(Icons.location_on,size: 16,),
            ],),

            SizedBox(width: 16,),

            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                SmallText(text: "456 Elm Street, Springfield",fontWeight: FontWeight.w600,),
                SizedBox(height: 4,),
                SmallText(text: "Pickup point",size: 10,color: Colors.black54,),
                SizedBox(height: 24,),
                SmallText(text: "739 Main Street, Springfield",fontWeight: FontWeight.w600,),
                SizedBox(height: 4,),
                SmallText(text: "Destination",size: 10,color: Colors.black54,),
              ],),
            ),

            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "Payment",color: Colors.black54,size: 10,),
              SizedBox(height: 4,),
              ContainerDecorated(color: Colors.green.withOpacity(0.1),child: SmallText(color: Colors.green,text: "₹ 12",fontWeight: FontWeight.w600,)),
              SizedBox(height: 16,),
              SmallText(text: "Distance",color: Colors.black54,size: 10,),
              SizedBox(height: 4,),
              SmallText(text: "12Km",fontWeight: FontWeight.w600,),
            ],),
          ],
        ),)
      ],
    ),);
  }

  openBottomSheet(Function() call){
    showModalBottomSheet(
      context: Get.context!,
      isScrollControlled: true,
      showDragHandle: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.8, // Starts at 60% of the screen height
          minChildSize: 0.4, // Minimum height
          maxChildSize: 0.85, // Maximum height
          expand: false, // Prevents full screen
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: Padding(
                  padding: EdgeInsets.all(16),
                  child: call()
              ),
            );
          },
        );
      },
    );
  }

  driverDetailWidget(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      ContainerDecorated(padding: 12,color: Colors.white,colorBorder: Colors.grey.shade300,
        child: Row(children: [
          NetworkOrAssetImage(src: "",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
          SizedBox(width: 16,),
          Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text:"Amit",fontWeight: FontWeight.w600,),
                  SmallText(text:"Toyota Avanza, Black",fontWeight: FontWeight.w600,size: 11,),
                ],
              ),
              SizedBox(height: 4,),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallText(text:"Driver",color: Colors.black54,),
                  SmallText(text:"Up 32 8584",color: Colors.black54,fontWeight: FontWeight.w500,),
                ],
              ),
            ],
          )),
        ],),
      ),
      SizedBox(height: 16,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Expanded(flex: 1,child: SmallText(text: "Rating",color: Colors.black54,)),
        Expanded(flex: 1,child: SmallText(text: "Payment Method",color: Colors.black54,)),
        Expanded(flex: 1,child: SmallText(text: "Travel Duration",color: Colors.black54,)),
      ],),
      SizedBox(height: 8,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Expanded(flex: 1,child: Row(children: [Icon(Icons.star,size: 12,color: Colors.orange,),Icon(Icons.star,size: 12,color: Colors.orange,),Icon(Icons.star,size: 12,color: Colors.orange,),Icon(Icons.star,size: 12,color: Colors.orange,),Icon(Icons.star,size: 12,color: Colors.orange,),],)),
        Expanded(flex: 1,child: SmallText(text: "e-Wallet",fontWeight: FontWeight.w600,)),
        Expanded(flex: 1,child: SmallText(text: "30 Minutes",fontWeight: FontWeight.w600,)),
      ],),
      SizedBox(height: 16,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Expanded(flex: 1,child: SmallText(text: "Ride Fare",color: Colors.black54,)),
        Expanded(flex: 1,child: SmallText(text: "Discount",color: Colors.black54,)),
        Expanded(flex: 1,child: SmallText(text: "Total Fare",color: Colors.black54,)),
      ],),
      SizedBox(height: 8,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Expanded(flex: 1,child: SmallText(text: "₹ 14.0",fontWeight: FontWeight.w600,)),
        Expanded(flex: 1,child: SmallText(text: "--",fontWeight: FontWeight.w600,)),
        Expanded(flex: 1,child: SmallText(text: "₹ 4",fontWeight: FontWeight.w600,)),
      ],),
      SizedBox(height: 16,),
      SmallText(text: "Feedback",color: Colors.black54,),
      SizedBox(height: 8,),
      TextFieldCommon(hintText: "Driver was friendly and ride was smooth",maxLines: 8,),
    ],);
  }


  sheetBottom(){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade300,padding: 16,child: Row(
        children: [
          Column(children: [
            Icon(Icons.arrow_circle_down_rounded,size: 16,color: Colors.blue,),
            SizedBox(height: 36,),
            Icon(Icons.location_on,size: 16,),
          ],),

          SizedBox(width: 16,),

          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "456 Elm Street, Springfield",fontWeight: FontWeight.w600,),
              SizedBox(height: 4,),
              SmallText(text: "Pickup point",size: 10,color: Colors.black54,),
              SizedBox(height: 24,),
              SmallText(text: "739 Main Street, Springfield",fontWeight: FontWeight.w600,),
              SizedBox(height: 4,),
              SmallText(text: "Destination",size: 10,color: Colors.black54,),
            ],),
          ),

          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SmallText(text: "Payment",color: Colors.black54,size: 10,),
            SizedBox(height: 4,),
            ContainerDecorated(color: Colors.green.withOpacity(0.1),child: SmallText(color: Colors.green,text: "₹ 12",fontWeight: FontWeight.w600,)),
            SizedBox(height: 16,),
            SmallText(text: "Distance",color: Colors.black54,size: 10,),
            SizedBox(height: 4,),
            SmallText(text: "12Km",fontWeight: FontWeight.w600,),
          ],),

        ],
      ),),
      SizedBox(height: 16,),
      Row(children: [
        Expanded(child: ContainerDecorated(height: 2,marginEdgeInsets: EdgeInsets.only(right: 16),)),

        SmallText(text: "DETAILS",fontWeight: FontWeight.w600,color: Colors.black54,),
        Expanded(child: ContainerDecorated(height: 2,marginEdgeInsets: EdgeInsets.only(left: 16),)),
      ],),
      SizedBox(height: 16,),
      driverDetailWidget(),
      SizedBox(height: 16,),
      ContainerDecorated(onTap: (){
        Get.back();
        showModalBottomSheet(isScrollControlled: true,context: Get.context!, builder: (builder){
          return OrderHistoryDetailsScreen(driverDetailWidget: driverDetailWidget,itemWidget: itemWidget,);
        });
      },
        child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          SmallText(text: "View on map",fontWeight: FontWeight.w600,),
          SizedBox(width: 16,),
          ContainerDecorated(colorBorder: Colors.grey.shade300,color: AppColors.scaffoldBackgroundColor,padding: 8,borderRadius: 30,child: Icon(Icons.map_outlined,size: 18,))
        ],),
      )
    ],);
  }
}
