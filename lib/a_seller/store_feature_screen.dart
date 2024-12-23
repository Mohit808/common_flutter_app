import 'package:common_flutter_app/a_seller/business_details/controller_business_details.dart';
import 'package:common_flutter_app/a_seller/address/start_address_screen.dart';
import 'package:common_flutter_app/a_seller/start_listing_screen.dart';
import 'package:common_flutter_app/common_function/select_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

class StoreFeatureScreen extends StatelessWidget {
  const StoreFeatureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBusinessDetails(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",height: 0,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: Stack(
            children: [
              ContainerDecorated(onTap: () async {
                showModalBottomSheet(context: context, builder: (builder)=>SelectImage()).then((onValue){
                  controller.imageBanner=onValue;
                  controller.update();
                });
              },width: double.infinity,height: 200,borderRadius: 10,child: controller.imageBanner!=null?NetworkOrAssetImage(src: controller.imageBanner!,borderRadius: 10,isFile: true,fit: BoxFit.cover,):Icon(Icons.add,size: 40,),),

              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 150,right: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContainerDecorated(height: 110,width: 110,borderRadius: 100,color: Colors.white,child: ContainerDecorated(onTap: (){
                      showModalBottomSheet(context: context, builder: (builder)=>SelectImage()).then((onValue) {
                        controller.imageLogo = onValue;
                        controller.update();
                      });
                    },borderRadius: 100,child: controller.imageLogo!=null?NetworkOrAssetImage(src: controller.imageLogo!,borderRadius: 100,isFile: true,fit: BoxFit.cover,):Icon(Icons.add)),),
                    SizedBox(height: 24,),
                    SmallText(text: "Describe Your Store"),
                    SizedBox(height: 8,),
                    Form(key: controller.formKeyDescription,
                      child: TextFieldCommon(controller: controller.textEditingControllerDescription,hintText: "Enter description...",maxLines: 5,maxLength: 500,validator: (value){
                        if(value!.isEmpty) return "Enter text";
                        return null;
                      },),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(children: [
                  InkWell(onTap: (){
                    Get.back();
                  },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.arrow_back)),),
                  Spacer(),
                  Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.more_vert)),

                ],),
              )
            ],
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(status: controller.apiResponseFeatured.status,widget: "SUBMIT",tap: (){
              controller.postImageData();
            },)
          ],
        );
      }
    );
  }
}
