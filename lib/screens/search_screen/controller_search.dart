import 'package:common_flutter_app/models/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

import '../../utils/app_const.dart';

class ControllerSearch extends GetxController{

  ApiResponse<HomeModel> apiResponse=ApiResponse(status: Status.INITIAL);
  List<Data> list=[];
  TextEditingController textEditingController=TextEditingController();
  bool showMike=true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    textEditingController.addListener(_onTextChanged);
  }
  void _onTextChanged() {
    print('Text changed: ${textEditingController.text}');
    if(textEditingController.text.length>0){
      if(showMike!=false){
        showMike=false;
        update();
      }
    }else{
      if(showMike!=true){
        showMike=true;
        update();
      }
    }
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  fetchData() async {

    try{
      apiResponse=ApiResponse(status: Status.LOADING);
      update();
      var res=await NetworkManager().get("${AppConst.getProducts}?search=${textEditingController.text}");
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