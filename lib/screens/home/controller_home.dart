import 'package:common_flutter_app/models/dashboard_model.dart';
import 'package:common_flutter_app/models/store_model.dart' as sm;
import 'package:common_flutter_app/models/brand_model.dart' as br;
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

import '../../utils/app_const.dart';


class ControllerHome extends GetxController{
  ApiResponse<DashboardModel> apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse<DashboardModel> apiResponseStore=ApiResponse(status: Status.LOADING);
  ApiResponse<DashboardModel> apiResponseBrands=ApiResponse(status: Status.LOADING);
  List<Featured> list=[];
  List listDelivery=[];
  List<sm.Data> listStore=[];
  List<br.Data> listBrand=[];

  @override
  void onInit() {
    super.onInit();
    fetchData();
    fetchStore();
    fetchBrands();
  }

  fetchStore() async {
    try{
      var res=await NetworkManager().get(AppConst.getStore);
      sm.StoreModel storeModel=sm.StoreModel.fromJson(res);
      listStore=storeModel.data!;
      apiResponseStore=ApiResponse(status: Status.COMPLETED);
    }catch(e){
      apiResponseStore=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }

  fetchBrands() async {
    try{
      var res=await NetworkManager().get(AppConst.getBrands);
      br.BrandModel brandModel=br.BrandModel.fromJson(res);
      listBrand.addAll(brandModel.data!);
      apiResponseBrands=ApiResponse(status: Status.LOADING);
    }catch(e){
      apiResponseBrands=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }

  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.getDashboard);
      DashboardModel dashboardModel=DashboardModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED,data: dashboardModel,message: dashboardModel.message);
      list.addAll(dashboardModel.data!.featured!);
      listDelivery.addAll(dashboardModel.data!.delivery!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }

}