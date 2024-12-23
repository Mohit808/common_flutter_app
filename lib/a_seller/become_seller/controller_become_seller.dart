import 'dart:convert';

import 'package:common_flutter_app/models/seller_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:http/http.dart' as http;

import '../build_digital_store_screen.dart';

class ControllerBecomeSeller extends GetxController{
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerWhatsapp=TextEditingController();
  TextEditingController textEditingControllerAadhaar=TextEditingController();
  String? aadhaarFront;
  String? aadhaarBack;
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  @override
  void onInit() {
    super.onInit();
  }
  postData() async {
    if(!formKey.currentState!.validate()) return;
    if(aadhaarFront==null) return showToast("Select aadhaar front");
    if(aadhaarBack==null) return showToast("Select aadhaar back");

    apiResponse=ApiResponse(status: Status.LOADING);
    update();

    var headers = {'Authorization': 'token $token'};
    var request = http.MultipartRequest('POST', Uri.parse('${AppConst.baseUrl}${AppConst.createSeller}'));
    request.fields.addAll({
      'email': textEditingControllerEmail.text,
      'whatsapp_number': textEditingControllerAadhaar.text,
      'aadhaar_number': textEditingControllerAadhaar.text,
    });
    request.files.add(await http.MultipartFile.fromPath('aadhaar_front', '$aadhaarFront'));
    request.files.add(await http.MultipartFile.fromPath('aadhaar_back', '$aadhaarBack'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      String result=await response.stream.bytesToString();
      var res=jsonDecode(result);
      SellerModel sellerModel=SellerModel.fromJson(res);
      if(sellerModel.status==200){
        showToastSuccess(sellerModel.message);
        Get.to(()=>BuildDigitalStoreScreen());
      }else{
        showToastError(sellerModel.message);
      }
    }
    else {
      print(response.reasonPhrase);
      showToastError(response.reasonPhrase);
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();
  }
}