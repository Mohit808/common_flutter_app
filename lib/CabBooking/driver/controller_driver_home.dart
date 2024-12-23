import 'package:common_flutter_app/models/driver_home_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerDriverHome extends GetxController{
  ApiResponse<DriverHomeModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.wheelBookings);
      DriverHomeModel driverHomeModel=DriverHomeModel.fromJson(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      list=driverHomeModel.data!;
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }
}