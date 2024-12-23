import 'package:common_flutter_app/a_seller/business_details/controller_business_details.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class StartAddressScreen extends StatelessWidget {
  const StartAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBusinessDetails(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Quick Commerce",titleColor: Colors.black,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: Padding(
            padding: AppPaddings.paddingAll16,
            child: Column(children: [
              NetworkOrAssetImage(borderRadius: 10,src: AppImages.locationJpg),
              SizedBox(height: 24,),
              BigText20(text: "Add Store Address"),
              SizedBox(height: 4,),
              NormalText(text: "Delivery partner will pickup orders from here"),
              SizedBox(height: 16,),
              ButtonSingleAtom(status: controller.apiResponseAddress.status,tap: (){
                Get.to(()=>AddAddressScreen())!.then((onValue){
                  print("XXXXXX");
                  print(onValue);
                  if(onValue!=null){
                    controller.postAddressData(fullAddress: onValue['fullAddress'],lng: onValue['latitude'].toString().substring(0,8),lat: onValue['longitude'].toString().substring(0,8));
                  }
                  // if(onValue!=null) Get.back(result: onValue);
                });
              },color: Colors.transparent,colorBorder: Colors.grey,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                NormalHeadingText(text: "Add Store Address"),
                SizedBox(width: 16,),
                ContainerDecorated(borderRadius: 20,color: AppColors.primary,child: Icon(Icons.arrow_forward,size: 16,color: Colors.white,),),
              ],),),
            ],),
          ),
        );
      }
    );
  }
}
