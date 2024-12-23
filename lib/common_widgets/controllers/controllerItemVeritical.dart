import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

import '../../models/home_model.dart';
import '../../utils/app_const.dart';

class ControllerItemVertical extends GetxController{
  ApiResponse<HomeModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  dynamic variantId;
  dynamic categoryId;
  dynamic brandId;
  ControllerItemVertical({this.variantId, this.categoryId,this.brandId});

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {

    try{
      var res=await NetworkManager().get("${AppConst.getProducts}?variantId=$variantId&categoryId=$categoryId&brandId=$brandId");
      HomeModel homeModel=HomeModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: homeModel,message: homeModel.message);
      list.addAll(homeModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }
  refreshData(){
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }
}





class ControllerItemVerticalDetail extends GetxController{
  ApiResponse<HomeModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  dynamic variantId;
  dynamic categoryId;
  dynamic brandId;
  ControllerItemVerticalDetail({this.variantId, this.categoryId,this.brandId});

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {

    try{
      var res=await NetworkManager().get("${AppConst.getProducts}?variantId=$variantId&categoryId=$categoryId&brandId=$brandId");
      HomeModel homeModel=HomeModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: homeModel,message: homeModel.message);
      list.addAll(homeModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }
  refreshData(){
    list=[];
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    fetchData();
  }
}