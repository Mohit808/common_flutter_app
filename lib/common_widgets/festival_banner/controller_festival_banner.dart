import 'package:common_flutter_app/models/festival_offer_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerFestivalBanner extends GetxController{
  ApiResponse apiResponse=ApiResponse(status: Status.LOADING);
  Data? data;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }
  fetchData() async {
    try{
      var res=await NetworkManager().get(AppConst.getFestivalOffer);
      FestivalOfferModel festivalOfferModel=FestivalOfferModel.fromJson(res);
      data=festivalOfferModel.data;
      apiResponse=ApiResponse(status: Status.COMPLETED,data: festivalOfferModel.data,message: festivalOfferModel.message);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message: "$e");
    }
    update();
  }
}