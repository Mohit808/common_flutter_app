import 'package:common_flutter_app/a_seller/business_details/business_detail_screen.dart';
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

class BuildDigitalStoreScreen extends StatelessWidget {
  const BuildDigitalStoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Quick Commerce",titleColor: Colors.black,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
      body: Padding(
        padding: AppPaddings.paddingAll16,
        child: Column(children: [
          NetworkOrAssetImage(src: AppImages.digitalStore),
          SizedBox(height: 24,),
          BigText20(text: "Build Your Digital Store"),
          SizedBox(height: 4,),
          NormalText(text: "Start Your OnBoarding Process"),
          SizedBox(height: 16,),
          ButtonSingleAtom(tap: (){
            Get.to(()=>BusinessDetailScreen());
          },color: Colors.transparent,colorBorder: Colors.grey,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
            NormalHeadingText(text: "Add Your Digital Store Details"),
            SizedBox(width: 16,),
            ContainerDecorated(borderRadius: 20,color: AppColors.primary,child: Icon(Icons.arrow_forward,size: 16,color: Colors.white,),),
          ],),),
          SizedBox(height: 36,),
          Row(children: [
            Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
            NormalHeadingText(text: "  or  "),
            Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
          ],),
          SizedBox(height: 36,),
          Row(
            children: [
              NormalHeadingText(text: "Quick commerse FAQs"),
            ],
          ),
          ExpansionTile(tilePadding: EdgeInsets.only(),title: SmallText(text: "Choose quick commerce FAQs Questions"))
        ],),
      ),
    );
  }
}
