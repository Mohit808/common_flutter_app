import 'package:common_flutter_app/a_seller/become_seller/controller_become_seller.dart';
import 'package:common_flutter_app/common_function/select_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class BecomeSellerScreen extends StatelessWidget {
  const BecomeSellerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBecomeSeller(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Become a Seller",color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,elevation: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding:AppPaddings.paddingAll16,
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  BigText24(text: "Enter your\nPersonal Details"),
                  SizedBox(height: 8,),
                  NormalHeadingText(text: "Verify yourself as seller"),
                  SizedBox(height: 24,),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerEmail,heading: "Email address",hintText: "Enter email",mandatoryString: "*",colorMandatoryString: Colors.red,validator: (value){
                    if(value!.isEmpty) return "Enter email";
                    if(!value.isEmail) return "Enter valid email";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerWhatsapp,heading: "Whatsapp number",hintText: "Enter whatsapp number",mandatoryString: "*",colorMandatoryString: Colors.red,keyboardType: TextInputType.number,validator: (value){
                    if(value!.isEmpty) return "Enter number";
                    if(value.length<10) return "Enter valid number";
                    return null;
                  },),
                  TextFieldWithHeadingMolecule(controller: controller.textEditingControllerAadhaar,heading: "Aadhaar number",hintText: "Enter number",mandatoryString: "*",colorMandatoryString: Colors.red,keyboardType: TextInputType.number,validator: (value){
                    if(value!.isEmpty) return "Enter aadhaar";
                    if(value.length<12) return "Enter valid aadhaar";
                    return null;
                  },),

                  SizedBox(height: 24,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          SmallText(text: "Aadhaar Front"),
                          SizedBox(height: 8,),
                          ContainerDecorated(padding: 0,onTap: (){
                            showModalBottomSheet(context: context, builder: (builder)=>SelectImage()).then((onValue) {
                              controller.aadhaarFront = onValue;
                              controller.update();
                            });
                          },height: 150,width: 150,child: controller.aadhaarFront!=null?NetworkOrAssetImage(src: controller.aadhaarFront!,isFile: true,fit: BoxFit.cover,borderRadius: 10,):Icon(Icons.add,size: 40,)),
                        ],
                      ),
                      Column(
                        children: [
                          SmallText(text: "Aadhaar Back"),
                          SizedBox(height: 8,),
                          ContainerDecorated(padding: 0,onTap: (){
                            showModalBottomSheet(context: context, builder: (builder)=>SelectImage()).then((onValue) {
                              controller.aadhaarBack = onValue;
                              controller.update();
                            });
                          },height: 150,width: 150,child: controller.aadhaarBack!=null?NetworkOrAssetImage(src: controller.aadhaarBack!,isFile: true,fit: BoxFit.cover,borderRadius: 10,): Icon(Icons.add,size: 40,)),
                        ],
                      ),
                    ],
                  )
                ],),
              ),
            ),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(status: controller.apiResponse.status,widget: "Next",tap: (){
              controller.postData();
            },)
          ],
        );
      }
    );
  }
}
