import 'package:common_flutter_app/models/home_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerHotDeals extends GetxController{
  ApiResponse<HomeModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.getHotDeals);
      print(res);
      HomeModel homeModel=HomeModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: homeModel,message: homeModel.message);
      list.addAll(homeModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }
}