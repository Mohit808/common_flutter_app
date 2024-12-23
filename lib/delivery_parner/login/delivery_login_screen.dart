import 'package:common_flutter_app/delivery_parner/onboarding/delivery_onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class DeliveryLoginScreen extends StatelessWidget {
  const DeliveryLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "",height: 0,color: Colors.white,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(height: 48,),
            BigText24(text: "Welcome back!  👋"),
            SizedBox(height: 8,),
            HeadingText(text: "Please enter login detail below"),
            SizedBox(height: 48,),
            ButtonSingleAtom(colorBorder: Colors.grey.shade400,color: Colors.transparent,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              NetworkOrAssetImage(src: AppImagesConst.google),
              SizedBox(width: 16,),
              NormalHeadingText(text: "Log in with Google")
            ],),tap: (){
              Get.offAll(()=>DeliveryOnboardingScreen());
            },),
            SizedBox(height: 48,),
            Row(children: [
              Expanded(child: ContainerDecorated(color: Colors.grey.shade300,height: 1,)),
              SmallText(text: "   or continue   "),
              Expanded(child: ContainerDecorated(color: Colors.grey.shade300,height: 1,)),
            ],),
            SizedBox(height: 36,),
            TextFieldWithHeadingMolecule(heading: "Email",hintText: "Enter email",mandatoryString: "*",),
            TextFieldWithHeadingMolecule(heading: "Password",hintText: "Enter password",mandatoryString: "*",),
            SizedBox(height: 8,),
            Align(alignment: Alignment.topRight,child: SmallText(text: "Forget password?",fontWeight: FontWeight.w800,)),
            SizedBox(height: 36,),
            ButtonSingleAtom(widget: "Sign In",color: Colors.black,),
            SizedBox(height: 16,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallText(text: "Don't have an account?  "),
                SmallText(text: "Sign Up",fontWeight: FontWeight.w800,),
              ],
            ),
          ],),
        ),
      ),
    );
  }
}
