// import 'package:common_flutter_app/models/order_model.dart';
import 'package:common_flutter_app/models/seller_order_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

class ControllerOrder extends GetxController{
  List<Data> list=[];
  ApiResponse<SellerOrderModel> apiResponse=ApiResponse(status: Status.LOADING);
  bool showFullOrder=false;
  int selectedTab=0;


  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData({status}) async {
    var res=await NetworkManager().get(AppConst.getOrders);
    SellerOrderModel sellerOrderModel=SellerOrderModel.fromJson(res);
    // OrderModel orderModel=OrderModel.fromJson(sellerOrderModel.toJson());
    list=sellerOrderModel.data!;
    apiResponse=ApiResponse(status: Status.COMPLETED,data: sellerOrderModel,);
    try{

    }catch(e){
      print(e);
      showToastError("$e");
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e",);

    }
    update();
  }
}