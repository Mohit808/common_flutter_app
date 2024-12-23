import 'package:common_flutter_app/a_seller/build_digital_store_screen.dart';
import 'package:common_flutter_app/a_seller/business_details/controller_business_details.dart';
import 'package:common_flutter_app/a_seller/address/start_address_screen.dart';
import 'package:common_flutter_app/a_seller/start_listing_screen.dart';
import 'package:common_flutter_app/a_seller/store_feature_screen.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class BusinessDetailScreen extends StatelessWidget {
  const BusinessDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBusinessDetails(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Quick commerce",color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,elevation: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  BigText24(text: "Enter your\nBusiness Details"),
                  SizedBox(height: 8,),
                  NormalHeadingText(text: "For business verification"),
                  SizedBox(height: 24,),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerOwnerName,heading: "Business Owner Name",hintText: "Enter full name",mandatoryString: "*",colorMandatoryString: Colors.red,validator: (value){
                    if(value!.isEmpty) return "Enter owner name";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerStoreName,heading: "Legal Entity Name (store name)",hintText: "Enter business name",mandatoryString: "*",colorMandatoryString: Colors.red,validator: (value){
                    if(value!.isEmpty) return "Enter business name";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerMobile,heading: "Business Mobile Number",hintText: "Enter business number",mandatoryString: "*",colorMandatoryString: Colors.red,validator: (value){
                    if(value!.isEmpty) return "Business mobile number";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerEmail,heading: "Business Email Address",hintText: "Enter email",mandatoryString: "*",colorMandatoryString: Colors.red,validator: (value){
                    if(value!.isEmpty) return "Enter Business email";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerPan,heading: "Business Pan Card",hintText: "Enter business pan number",mandatoryString: "(optional)",colorMandatoryString: Colors.grey),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerGst,heading: "GST Number",hintText: "Enter gst number",mandatoryString: "(optional)",colorMandatoryString: Colors.grey,),

                ],),
              ),
            ),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(status: controller.apiResponse.status,widget: "Next",tap: (){
              controller.postData();
              // Get.off(()=>StoreFeatureScreen());
            },)
          ],
        );
      }
    );
  }
}
