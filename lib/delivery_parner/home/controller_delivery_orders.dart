import 'package:common_flutter_app/models/delivery_order_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

class ControllerDeliveryOrders extends GetxController{

  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse apiResponseOrder=ApiResponse(status: Status.INITIAL);

  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.getDeliveryOrders);
      print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      DeliveryOrderModel deliveryOrderModel=DeliveryOrderModel.fromJson(res);
      list=deliveryOrderModel.data!;
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
    }
    print(list.length);
    update();
  }

  orderFunction(index,status) async {
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