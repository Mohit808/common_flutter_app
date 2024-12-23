import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/auth/sign_up/sign_up_screen.dart';
import 'package:modular_ui_package/molecules/auth/widgets/already_account_widget.dart';
import 'package:modular_ui_package/molecules/auth/widgets/email_pass_widget.dart';
import 'package:modular_ui_package/molecules/auth/widgets/social_login_widget.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

import 'controller_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerLogin(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Quick Commerce",titleColor: AppColors.primary,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                BigText20(text: controller.selectedTab),
                SizedBox(height: 16,),
                ContainerDecorated(
                  child: Row(children: [
                    Expanded(child: ContainerDecorated(onTap: (){
                      controller.selectedTab="Login";
                      controller.update();
                    },color: controller.selectedTab=="Login"?Colors.blue:null,padding: 12,child: SmallText(text: "Login",textAlign: TextAlign.center,color: controller.selectedTab=="Login"?Colors.white:null,),)),
                    SizedBox(width: 16,),
                    Expanded(child: ContainerDecorated(onTap: (){
                      controller.selectedTab="Signup";
                      controller.update();
                    },color: controller.selectedTab=="Signup"?Colors.blue:null,padding: 12,child: SmallText(text: "Signup",textAlign: TextAlign.center,color:  controller.selectedTab=="Signup"?Colors.white:null,),)),

                  ],),
                ),
                const SizedBox(height: 24,),
               controller.selectedTab=="Login"?loginPage(controller):signupPage(controller)
              ],),
            ),
          ),
        );
      }
    );
  }
  loginPage(ControllerLogin controller){
    return Column(children: [
      EmailPassWidget(formKey: controller.formKey,textEditingControllerEmail: controller.textEditingControllerEmail,textEditingControllerPass: controller.textEditingControllerPass,),

      const SizedBox(height: 16,),

      Row(children: [

        SizedBox(height: 24,width: 24,child: Checkbox(value: true, onChanged: (onChanged){})),
        const SmallText(text: "Remember me",color: Colors.grey,),
        const Spacer(),
        const SmallText(text: "Forgot Password?",fontWeight: FontWeight.w600,)
      ],),
      const SizedBox(height: 24,),

      ButtonSingleAtom(status: controller.apiResponse.status,widget: "SIGN IN",tap: (){
        controller.loginFunction();
      },),
      SizedBox(height: 16,),
      SocialLoginWidget(),
      const SizedBox(height: 48,),
      Align(alignment: Alignment.center,
        child: InkWell(onTap: (){
          controller.formKey.currentState!.reset();
          controller.selectedTab="Signup";
          controller.update();
          // Get.to(()=>SignUpScreen());
        },
          child: Text.rich(textAlign: TextAlign.center,
            TextSpan(
              children: [
                TextSpan( text: "Don't have account? ", style: TextStyle(fontWeight: FontWeight.w500,),),
                TextSpan(text: ' Sign up',style: TextStyle(fontWeight: FontWeight.w500,color: AppColors.primary)),
              ],
            ),
          ),
        ),
      ),
    ],);
  }
  signupPage(ControllerLogin controller){
    return Column(children: [
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerFirstName,heading: "First Name",hintText: "Enter first name",validator: (value){
        if(value!.isEmpty) return "Enter name";
        return null;
      },),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerLastName,heading: "Last Name",hintText: "Enter last name",validator: (value){
        if(value!.isEmpty) return "Enter name";
        return null;
      },),
      EmailPassWidget(confirmPassShow: true,formKey: controller.formKey,textEditingControllerEmail: controller.textEditingControllerEmail,textEditingControllerPass: controller.textEditingControllerPass,textEditingControllerConfirmPass: controller.textEditingControllerConfirmPass,),
      SizedBox(height: 24,),
      ButtonSingleAtom(status: controller.apiResponse.status,tap: (){
        controller.createAccount();
      },widget: "SIGN UP",),
      SizedBox(height: 16,),
      const SocialLoginWidget(),
      const SizedBox(height: 48,),
      AlreadyAccountWidget(off: true,onTap: (){
        controller.formKey.currentState!.reset();
        controller.selectedTab="Login";
        controller.update();
        // Get.back();
      },),
      const SizedBox(height: 48,)
    ],);
  }
}
