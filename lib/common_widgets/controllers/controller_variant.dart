import 'package:common_flutter_app/models/variant_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import 'controllerItemVeritical.dart';

class ControllerVariant extends GetxController{
  ApiResponse<VariantModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  dynamic id;
  int selectedTab=0;

  ControllerVariant({this.id});
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    if(id==null) return apiResponse=ApiResponse(status: Status.COMPLETED);
    try{
      var res=await NetworkManager().get("${AppConst.getVariants}/$id");
      VariantModel variantModel=VariantModel.fromJson(res);
      list.addAll(variantModel.data!);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: variantModel);
    }catch(e){
      showToastError("$e}");
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }
  onTabChanged(index){
    selectedTab=index;
    update();
    ControllerItemVertical controllerItemVertical=Get.find();
    controllerItemVertical.variantId=list[selectedTab].id;
    controllerItemVertical.refreshData();
  }
}