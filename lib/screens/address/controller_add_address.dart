import 'package:common_flutter_app/models/address_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerAddAddress extends GetxController{
  TextEditingController textEditingController=TextEditingController();
  // bool showButton=false;
  String? description;
  String? lat;
  String? lng;
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);

  @override
  void onInit() {
    super.onInit();
    textEditingController.addListener((){
      // showButton=false;
      update();
    });
    fetchAddress();
  }
  fetchAddress() async {
    try{
      var res=await NetworkManager().get(AppConst.myAddress);
      AddressModel addressModel=AddressModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      list.addAll(addressModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }
}