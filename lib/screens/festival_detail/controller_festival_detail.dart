import 'package:common_flutter_app/models/variant_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerFestivalDetail extends GetxController{
  List<Data> list=[];
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  dynamic id;
  ControllerFestivalDetail({this.id});

  int? selectedIndex=0;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get("${AppConst.getVariantByFestival}?festivalId=$id");
      print(res);
      apiResponse=ApiResponse(status: Status.COMPLETED);
      VariantModel variantModel=VariantModel.fromJson(res);
      list=variantModel.data!;
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR);
    }
    update();
  }
}