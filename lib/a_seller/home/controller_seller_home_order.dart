import 'package:common_flutter_app/models/seller_order_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerSellerHomeOrder extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  bool showFullOrder=false;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppConst.getSellerOrders}?status=1");
      print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      SellerOrderModel sellerOrderModel=SellerOrderModel.fromJson(res);
      list=sellerOrderModel.data!;
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }

    update();
  }
}