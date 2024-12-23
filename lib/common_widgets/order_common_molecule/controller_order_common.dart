import 'package:common_flutter_app/models/order_model_common.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../utils/app_const.dart';

class ControllerOrderCommon extends GetxController{
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseOrder=ApiResponse(status: Status.INITIAL);
  List<Data> list=[];
  int showFullOrder=-1;
  int selectedTab=0;
  int status;
  final bool? isCustomer;
  final bool? isDelivery;
  final bool? isStore;
  ControllerOrderCommon({required this.status,this.isCustomer,this.isDelivery,this.isStore});
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  changeBar(selectedTabValue){
    selectedTab=selectedTabValue;
    apiResponse=ApiResponse(status: Status.LOADING);
    list=[];
    update();
    status= selectedTab;
    fetchData();
  }
  fetchData() async {
    // if(isDelivery!=null){
    //   status++;
    // }
    try{
      var res=await NetworkManager().get("${AppConst.getOrders}?status=$status&isCustomer=${isCustomer??""}&isDelivery=${isDelivery==null?"":status==0?"":isDelivery}&isStore=${isStore??""}");
      print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      OrderModelCommon orderModelCommon=OrderModelCommon.fromJson(res);
      list=orderModelCommon.data!;
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }

    update();
  }

  changeOrderStatus(index,status) async {
    apiResponseOrder=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppConst.acceptOrders,data: {
        "order_id":"${list[index].id}",
        "status":"$status"
      });
      apiResponseOrder=ApiResponse(status: Status.COMPLETED);
      ModelX modelX=ModelX.fromJson(res);
      if(modelX.status==200){
        list.removeAt(index);
        update();
        showToastSuccess(modelX.message);
      }else{
        showToastError(modelX.message);
      }
    }catch(e){
      showToastError("$e");
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }
}