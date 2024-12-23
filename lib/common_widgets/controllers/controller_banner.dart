import 'package:common_flutter_app/models/banner_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerBanner extends GetxController{
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.getBanner);
      BannerModel bannerModel=BannerModel.fromJson(res);
      list=bannerModel.data!;
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      debugPrint("$e");
    }
    update();
  }
}



class ControllerBannerStore extends GetxController{
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  dynamic storeId;
  ControllerBannerStore(this.storeId);
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppConst.getBanner}?storeId=$storeId");
      BannerModel bannerModel=BannerModel.fromJson(res);
      list=bannerModel.data!;
      apiResponse=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      debugPrint("$e");
    }
    update();
  }
}