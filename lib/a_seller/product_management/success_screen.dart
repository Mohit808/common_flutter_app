import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  RxInt a=10.obs;
  Timer? timerX;
  @override
  void initState() {
    super.initState();
    timerX=Timer.periodic(Duration(seconds: 1), (timer){
      if(a.value==0){
        Get.back();
      }

      a.value--;
      print(timer.tick);
    });
  }
  @override
  void dispose() {
    if(timerX!=null){
      timerX!.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCommon(title: "",height: 0,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(mainAxisSize: MainAxisSize.min,children: [
            SizedBox(height: 100,),
            ContainerDecorated(color: Colors.green,borderRadius: 50,padding: 16,child: Icon(Icons.check_rounded,size: 50,color: Colors.white,)),
            SizedBox(height: 48,),
            BigText24(text: "Congratulations"),
            SizedBox(height: 16,),
            NormalHeadingText(text: "You've successfully published your product"),
            SizedBox(height: 100,),
            ContainerDecorated(padding: 16,color: Colors.blueGrey.withOpacity(0.05),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              SmallText(text: "WHAT'S NEXT?",letterSpacing: 1,color: Colors.black,fontWeight: FontWeight.w600,),
              SizedBox(height: 16,),
              SmallText(text: "Your can check your product in Inventory. Also you can edit and delete product. You can add new product by following same procedure.",letterSpacing: 0.5,color: Colors.black,),
              SizedBox(height: 24,),
              ButtonSingleAtom(widget: "Go To Home",color: Colors.transparent,colorText: AppColors.primary,colorBorder: AppColors.primary,tap: (){
                Get.back();
              },),
            ],),),
            SizedBox(height: 16,),
            Obx(()=>SmallText(text: "Back in : ${a.value}"))
          ],),
        ),
      ),
    );
  }
}
