import 'dart:convert';

import 'package:common_flutter_app/a_seller/home/seller_home_screen.dart';
import 'package:common_flutter_app/models/create_store_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';
import '../address/start_address_screen.dart';
import '../start_listing_screen.dart';
import '../store_feature_screen.dart';
import 'package:http/http.dart' as http;

class ControllerBusinessDetails extends GetxController{
  TextEditingController textEditingControllerOwnerName=TextEditingController();
  TextEditingController textEditingControllerStoreName=TextEditingController();
  TextEditingController textEditingControllerMobile=TextEditingController();
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPan=TextEditingController();
  TextEditingController textEditingControllerGst=TextEditingController();

  TextEditingController textEditingControllerDescription=TextEditingController();
  String? imageBanner;
  String? imageLogo;

  GlobalKey<FormState> formKey=GlobalKey();
  GlobalKey<FormState> formKeyDescription=GlobalKey();
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseAddress=ApiResponse(status: Status.INITIAL);
  ApiResponse apiResponseFeatured=ApiResponse(status: Status.INITIAL);
  @override
  void onInit() {
    super.onInit();
  }
  postData() async {
    if(!formKey.currentState!.validate()) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppConst.createStore,data: {
        "business_owner_name":textEditingControllerOwnerName.text,
        "store_name":textEditingControllerStoreName.text,
        "store_mobile":textEditingControllerMobile.text,
        "store_email":textEditingControllerEmail.text,
        "gst_number":textEditingControllerGst.text,
        "pan_number":textEditingControllerPan.text
      });
      CreateStoreModel createStoreModel=CreateStoreModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      if(createStoreModel.status==200){
        showToastSuccess(createStoreModel.message);
        Get.off(()=>StoreFeatureScreen());
      }else{
        showToastError(createStoreModel.message);
      }
    }catch(e){
      showToastSuccess("$e");
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }

  postAddressData({fullAddress,lat,lng}) async {
    // apiResponseAddress=ApiResponse(status: Status.LOADING);
    update();
    showLoading();
    try{
      var res=await NetworkManager().post(AppConst.createStore,data: {
        "store_address":fullAddress,
        "lat":"$lat",
        "lng":"$lng"
      });
      CreateStoreModel createStoreModel=CreateStoreModel.fromJson(res);
      apiResponseAddress=ApiResponse(status: Status.COMPLETED);
      if(createStoreModel.status==200){
        showToastSuccess(createStoreModel.message);
        // Get.off(()=>StoreFeatureScreen());
        Get.off(()=>SellerHomeScreen());
      }else{
        showToastError(createStoreModel.message);
      }
    }catch(e){
      showToastSuccess("$e");
      apiResponseAddress=ApiResponse(status: Status.ERROR);
    }
    closeLoading();
    update();
  }

  postImageData() async {
    if(imageBanner==null) return showToast("Select Banner");
    if(imageLogo==null) return showToast("Select Logo");
    if(!formKeyDescription.currentState!.validate()) return;
    apiResponseFeatured=ApiResponse(status: Status.LOADING);
    update();
    try{
      var headers = {
        'Authorization': 'token $token'
      };
      var request = http.MultipartRequest('POST', Uri.parse('${AppConst.baseUrl}${AppConst.createStore}'));
      request.fields.addAll({
        'store_description': textEditingControllerDescription.text
      });
      request.files.add(await http.MultipartFile.fromPath('store_logo', imageLogo!));
      request.files.add(await http.MultipartFile.fromPath('store_banner', imageBanner!));
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      apiResponseFeatured=ApiResponse(status: Status.COMPLETED);
      if (response.statusCode == 200) {
        var result=await response.stream.bytesToString();
        var res=jsonDecode(result);
        CreateStoreModel createStoreModel=CreateStoreModel.fromJson(res);
        apiResponse=ApiResponse(status: Status.COMPLETED);
        if(createStoreModel.status==200){
          showToastSuccess(createStoreModel.message);
          // Get.off(()=>StoreFeatureScreen());
          Get.to(()=>StartAddressScreen())!.then((onValue){
            if(onValue!=null) Get.to(()=>StartListingScreen());
          });
        }else{
          showToastError(createStoreModel.message);
        }
      }
      else {
        showToastError(response.reasonPhrase);
        print(response.reasonPhrase);
      }
    }catch(e){
      showToastError("$e");

    }
    update();

  }
}