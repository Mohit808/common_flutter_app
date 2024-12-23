import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

import '../models/categories_model.dart';
import '../utils/app_const.dart';

class DatasourceMainCategory{
  getData() async {
    try{
      var res=await NetworkManager().get(AppConst.getMainCategories);
      CategoriesModel categoriesModel=CategoriesModel.fromJson(res);
      return ApiResponse(status: Status.COMPLETED,data: categoriesModel,message: categoriesModel.message);
    }catch(e){
      return ApiResponse(status: Status.ERROR,message:"$e");
    }
  }
}