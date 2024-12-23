// import 'package:common_flutter_app/models/seller_order_model.dart';
// import 'package:common_flutter_app/utils/app_const.dart';
// import 'package:get/get.dart';
// import 'package:modular_ui_package/utils/network_handling/api_response.dart';
// import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
//
// class ControllerSellerOrder extends GetxController{
//   List<Data> list=[];
//   ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
//   bool showFullOrder=false;
//   int selectedTab=0;
//   @override
//   void onInit() {
//     super.onInit();
//     fetchData(status: 1);
//   }
//   changeBarFunction(selectedTabValue){
//     selectedTab=selectedTabValue;
//     apiResponse=ApiResponse(status: Status.LOADING);
//     list=[];
//     update();
//     fetchData(status: selectedTab+1);
//   }
//   fetchData({status}) async {
//     try{
//       var res=await NetworkManager().get("${AppConst.getSellerOrders}?status=$status");
//       print(res);
//       apiResponse=ApiResponse(status: Status.COMPLETED);
//       SellerOrderModel sellerOrderModel=SellerOrderModel.fromJson(res);
//       list=sellerOrderModel.data!;
//     }catch(e){
//       apiResponse=ApiResponse(status: Status.ERROR);
//     }
//
//     update();
//   }
// }