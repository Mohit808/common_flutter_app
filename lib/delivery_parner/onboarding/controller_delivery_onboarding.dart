import 'dart:convert';

import 'package:common_flutter_app/a_seller/address/start_address_screen.dart';
import 'package:common_flutter_app/models/delivery_onboarding_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../../screens/address/add_address_screen.dart';
import '../home/delivery_home_screen.dart';

class ControllerDeliveryOnboarding extends GetxController{
  TextEditingController textEditingControllerName=TextEditingController();
  TextEditingController textEditingControllerPhone=TextEditingController();
  TextEditingController textEditingControllerBike=TextEditingController();
  TextEditingController textEditingControllerAadhaar=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  int index=0;
  String? selectedImage;

  @override
  void onInit() {
    super.onInit();
  }
  updateData({currentIndex}) async {
    var data;
    if(currentIndex==0){
      if(!formKey.currentState!.validate()) return;
      data={"name":textEditingControllerName.text};
    }
    if(currentIndex==1){
      if(!formKey.currentState!.validate()) return;
      data={"phone_number":textEditingControllerPhone.text};
    }
    if(currentIndex==3){
      if(!formKey.currentState!.validate()) return;
      data={"bike":textEditingControllerBike.text};
    }
    if(currentIndex==4){
      if(!formKey.currentState!.validate()) return;
      data={"aadhaar":textEditingControllerPhone.text};
    }
    print(data);
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppConst.onboardDeliveryPartner,data: data);
      DeliveryOnboardingModel deliveryOnboardingModel=DeliveryOnboardingModel.fromJson(res);
      if(deliveryOnboardingModel.status==200){
        showToastSuccess(deliveryOnboardingModel.message);
        if(currentIndex==5){
          closeLoading();
        }
        if(currentIndex==4){
          Get.to(()=>StartAddressScreen())!.then((onValue){
            Get.offAll(()=>DeliveryHomeScreen());
          });
          // Get.to(()=>AddAddressScreen())!.then((onValue){
          //   print("XCXCXCX");
          //   print(onValue);
          //   // Get.off(()=>DeliveryHomeScreen());
          // });
        }else{
          index++;
        }
        formKey.currentState!.reset();
      }else{
        showToastError(deliveryOnboardingModel.message);
      }
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
      showToastError("$e");
    }
    update();
  }
  selectImage() async {
    var xFile=await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 30);
    if(xFile!=null){
      selectedImage=xFile.path;
      update();
    }
  }

  uploadImage() async {
    if(selectedImage==null) return showToast("Select image");
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    var headers = {
      'Authorization': 'token $token'
    };
    var request = http.MultipartRequest('POST', Uri.parse(AppConst.baseUrl+AppConst.onboardDeliveryPartner));
    request.files.add(await http.MultipartFile.fromPath('image', selectedImage!));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      apiResponse=ApiResponse(status: Status.COMPLETED);
      String result=await response.stream.bytesToString();
      var json=jsonDecode(result);
      DeliveryOnboardingModel deliveryOnboardingModel=DeliveryOnboardingModel.fromJson(json);
      if(deliveryOnboardingModel.status==200){
        showToastSuccess(deliveryOnboardingModel.message);
        index++;
      }else{
        showToastError(deliveryOnboardingModel.message);
      }
    }
    else {
      print(response.reasonPhrase);
      apiResponse=ApiResponse(status: Status.ERROR);
      showToastError("${response.reasonPhrase}");
    }
    update();

  }
}