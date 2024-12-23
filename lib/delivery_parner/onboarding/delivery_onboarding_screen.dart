import 'package:common_flutter_app/delivery_parner/home/delivery_home_screen.dart';
import 'package:common_flutter_app/delivery_parner/onboarding/controller_delivery_onboarding.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/otp_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class DeliveryOnboardingScreen extends StatelessWidget {
  DeliveryOnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return GetBuilder(init: ControllerDeliveryOnboarding(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",height: 0,color: Colors.white,elevation: 0,),
          body: SingleChildScrollView(child: Padding(
            padding: AppPaddings.paddingAll16,
            child:Form(key: controller.formKey,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                ContainerDecorated(child: Icon(Icons.arrow_back),borderRadius: 30,onTap: (){
                  if(controller.index==0) return;
                  controller.index--;
                  controller.update();
                  },),

                controller.index==0?nameWidget(controller):
                controller.index==1?phoneWidget(controller):
                controller.index==2?selfieWidget(controller):
                controller.index==3? bikeWidget(controller):
                aadhaarWidget(controller)
              ],),
            ),
          ),),
        );
      }
    );
  }

  aadhaarWidget(ControllerDeliveryOnboarding controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SizedBox(height: 48,),
      BigText24(text: "Update your\nAadhaar details"),
      // SizedBox(height: 8,),
      // NormalHeadingText(text: "For vehicle verification"),
      // SizedBox(height: 48,),
      // Align(alignment: AlignmentDirectional.center,child: ContainerDecorated(height: 150,width: 150,child: Icon(Icons.add,size: 40,))),
      //
      // TextFieldWithHeadingMolecule(hintText: "Enter bike...",heading: "Bike Number",),
      // SizedBox(height: 48,),
      //
      // Align(alignment: AlignmentDirectional.center,child: NormalHeadingText(text: "Skip")),
      // SizedBox(height: 16,),
      // ButtonSingleAtom(tap: (){
      //   index.value++;
      // },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
      //   NormalHeadingText(text: "Continue",color: Colors.white,),
      //   SizedBox(width: 16,),
      //   Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
      // ],),),


      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
        // const BigText20(text: "Aadhaar Verification",),
        const SizedBox(height: 16,),
        TextFieldWithHeadingMolecule(controller: controller.textEditingControllerAadhaar,keyboardType: TextInputType.number,heading: "Aadhaar number",hintText: "Enter aadhaar number",validator: (value){
          if(value!.isEmpty) return "Enter number";
          return null;
        },),
        const SizedBox(height: 24,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SmallText(text: "Aadhaar Front"),
                SizedBox(height: 8,),
                ContainerDecorated(height: 150,width: 150,child: Icon(Icons.add,size: 40,)),
              ],
            ),
            Column(
              children: [
                SmallText(text: "Aadhaar Back"),
                SizedBox(height: 8,),
                ContainerDecorated(height: 150,width: 150,child: Icon(Icons.add,size: 40,)),
              ],
            ),
          ],
        ),
        SizedBox(height: 24,),
        const HeaderWithLineWidget(text: "Enter Your OTP"),
        const SizedBox(height: 16,),
        const SmallText(text: "We have send OTP to your Aadhaar number"),
        const SizedBox(height: 4,),
        Row(
          children: [
            const SmallText(text: "987654321012",fontWeight: FontWeight.w500,),
            const SizedBox(width: 24,),
            Icon(Icons.edit,size: 13,color: Colors.black,),
            SmallText(text: " Edit",color: Colors.black,fontWeight: FontWeight.w600,)
          ],
        ),
        const SizedBox(height: 48,),
        OtpAtom(textEditingController: TextEditingController()),
        const SizedBox(height: 4,),
        const Align(alignment: AlignmentDirectional.topEnd,child: SmallText(text: "00:22")),
        const SizedBox(height: 16,),
        Text.rich(
          TextSpan(
            children: [
              const TextSpan( text: "Didn’t receive OTP yet? ",style: TextStyle(fontSize: 12)),
              TextSpan( text: 'Re-send', style: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.w600),),
            ],
          ),
        ),

        SizedBox(height: 48,),

        ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
          controller.updateData(currentIndex: 4);
        },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
          NormalHeadingText(text: "Continue",color: Colors.white,),
          SizedBox(width: 16,),
          Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
        ],),),

        // const SmallText(text: "OTP"),
        // const SizedBox(height: 4,),
        // OtpAtom(textEditingController: TextEditingController()),
        // SizedBox(height: 8,),
        // SmallText(text: "Didn’t receive OTP yet? Re-send in 00:22")
      ],),
    ],);
  }

  bikeWidget(ControllerDeliveryOnboarding controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SizedBox(height: 48,),
      BigText24(text: "Upload your\nbike photo"),
      SizedBox(height: 8,),
      NormalHeadingText(text: "For vehicle verification"),
      SizedBox(height: 48,),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              SmallText(text: "Bike Front"),
              SizedBox(height: 8,),
              ContainerDecorated(height: 150,width: 150,child: Icon(Icons.add,size: 40,)),
            ],
          ),
          Column(
            children: [
              SmallText(text: "Bike Back"),
              SizedBox(height: 8,),
              ContainerDecorated(height: 150,width: 150,child: Icon(Icons.add,size: 40,)),
            ],
          ),
        ],
      ),
      SizedBox(height: 8,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerBike,hintText: "Enter bike...",heading: "Bike Number",validator: (value){
        if(value!.isEmpty) return "Enter number";
        return null;
      },),
      SizedBox(height: 48,),

      Align(alignment: AlignmentDirectional.center,child: InkWell(onTap: (){controller.index++;controller.update();},child: NormalHeadingText(text: "Skip"))),
      SizedBox(height: 16,),
      ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
        controller.updateData(currentIndex: 3);
        // index.value++;
      },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        NormalHeadingText(text: "Continue",color: Colors.white,),
        SizedBox(width: 16,),
        Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
      ],),),
    ],);
  }
  selfieWidget(ControllerDeliveryOnboarding controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SizedBox(height: 48,),
      BigText24(text: "Upload your\nphoto selfie"),
      SizedBox(height: 8,),
      NormalHeadingText(text: "For photo verification"),
      SizedBox(height: 48,),
      ContainerDecorated(padding: 0,onTap: (){
        controller.selectImage();
      },height: MediaQuery.of(Get.context!).size.width,width: MediaQuery.of(Get.context!).size.width,child: controller.selectedImage==null?Icon(Icons.add,size: 40,):NetworkOrAssetImage(src: controller.selectedImage!,isFile: true,fit: BoxFit.cover,borderRadius: 10,)),
      SizedBox(height: 48,),

      ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
        controller.uploadImage();
      },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        NormalHeadingText(text: "Continue",color: Colors.white,),
        SizedBox(width: 16,),
        Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
      ],),),
    ],);
  }
  nameWidget(ControllerDeliveryOnboarding controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SizedBox(height: 48,),
      BigText24(text: "Enter your\nfull name"),
      SizedBox(height: 8,),
      NormalHeadingText(text: "For identity verification"),
      SizedBox(height: 48,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerName,heading: "Name (as Aadhaar card)",hintText: "Enter name",mandatoryString: "*",validator: (value){
        if(value!.isEmpty) return "Enter full name";
        return null;
      },),
      SizedBox(height: 48,),

      ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
        controller.updateData(currentIndex: 0);
      },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        NormalHeadingText(text: "Continue",color: Colors.white,),
        SizedBox(width: 16,),
        Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
      ],),),
    ],);
  }

  phoneWidget(ControllerDeliveryOnboarding controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      SizedBox(height: 48,),
      BigText24(text: "Enter your\nphone number"),
      SizedBox(height: 8,),
      NormalHeadingText(text: "Mobile number is required for contact"),
      SizedBox(height: 48,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerPhone,keyboardType: TextInputType.number,heading: "Mobile number",hintText: "Enter mobile",mandatoryString: "*",validator: (value){
        if(value!.isEmpty) return "Enter number";
        return null;
      },),

      SizedBox(height: 48,),

      ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
        controller.updateData(currentIndex: 1);
        // index.value++;
      },color: Colors.black,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        NormalHeadingText(text: "Continue",color: Colors.white,),
        SizedBox(width: 16,),
        Icon(Icons.arrow_forward,size: 16,color: Colors.white,)
      ],),),
    ],);
  }
}
