import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../utils/app_const.dart';
import '../../utils/utils.dart';

class ControllerManualAddress extends GetxController{
  GlobalKey<FormState> formKey=GlobalKey();
  String? pinCode;
  String? fullAddress;
  TextEditingController textEditingControllerHouseNo=TextEditingController();
  TextEditingController textEditingControllerArea=TextEditingController();
  TextEditingController textEditingControllerLandmark=TextEditingController();
  TextEditingController textEditingControllerPinCode=TextEditingController();
  TextEditingController textEditingControllerHowToReach=TextEditingController();
  ControllerManualAddress({this.pinCode,this.fullAddress});
  String? savedAs;

  @override
  void onInit() {
    super.onInit();
    textEditingControllerPinCode.text=pinCode??"";
  }


  submit({required String address, required String lat, required String lng}) async {
    if(!formKey.currentState!.validate()) return;
    if(savedAs==null) return showToast("Save as required");

    box.write(AppUtils.fullAddress, address);
    box.write(AppUtils.addressTitle,  "$savedAs");
    box.write(AppUtils.latitude, lat);
    box.write(AppUtils.longitude, lng);

    try{
      showLoading();
      var res=await NetworkManager().post(AppConst.myAddress,data: {
        "customer":"1",
        "address_type":savedAs,
        "full_address":fullAddress,
        "house_no":textEditingControllerHouseNo.text,
        "area":textEditingControllerArea.text,
        "landmark":textEditingControllerLandmark.text,
        "instruction":textEditingControllerHowToReach.text,
        "latitude":lat,
        "longitude":lng
      });
      closeLoading();
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        showToastSuccess(modelX.message);
        // Get.off(()=>CongratsScreen());
        Get.back(result: "notNull");
        return;
      }
      showToastError(modelX.message);
    }catch(e){
      closeLoading();
      print(e);
      showToastError("$e");
    }
  }
}