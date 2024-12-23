import 'package:get/get.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../../models/home_model.dart';
import '../../../utils/app_const.dart';

class ControllerInventory extends GetxController{
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppConst.getProducts}");
      HomeModel homeModel=HomeModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: homeModel,message: homeModel.message);
      list.addAll(homeModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }

  deleteProduct(index) async {
    var productId=list[index].id;
    showLoading();
    try{
      var res=await NetworkManager().delete("${AppConst.getProducts}?productId=$productId");
      ModelX modelX=ModelX.fromJson(res);
      showToastSuccess(modelX.message);
      list.removeAt(index);
      update();
    }catch(e){
      showToastError("$e");
    }
    closeLoading();
  }
}