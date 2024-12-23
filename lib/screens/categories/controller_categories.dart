import 'package:common_flutter_app/data_source/data_sourc_main_category.dart';
import 'package:common_flutter_app/models/categories_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerCategories extends GetxController{
  ApiResponse<CategoriesModel> apiResponse=ApiResponse(status: Status.LOADING);
  List<Data> list=[];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchData();
  }
  fetchData() async {
    apiResponse=await DatasourceMainCategory().getData();
    if(apiResponse.status==Status.COMPLETED){
      list.addAll(apiResponse.data!.data!);
    }
    update();
  }
}