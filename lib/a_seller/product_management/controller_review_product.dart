import 'dart:convert';

import 'package:common_flutter_app/a_seller/product_management/success_screen.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:http/http.dart' as http;

class ControllerReviewProduct extends GetxController{

  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  final String? image;
  final String? origin;
  final String? name;
  final String? highlight;
  final String? discountedPrice;
  final String? price;
  final String? mainCategory;
  final String? category;
  final String? variant;
  final String? brand;
  final String? description;
  final String? tips;
  final String? additionalInfo;
  ControllerReviewProduct({this.name,this.image,this.description,this.price,this.discountedPrice,this.highlight,this.origin,this.tips,this.additionalInfo,this.mainCategory,this.variant,this.category,this.brand});
  @override
  void onInit() {
    super.onInit();
  }
  publishProduct() async {
    // showLoading();
    try{
      apiResponse=ApiResponse(status: Status.LOADING);
      update();
      var request = http.MultipartRequest('POST', Uri.parse(AppConst.baseUrl+AppConst.createProduct));
      request.fields.addAll({
        "name":name??"",
        "description":description??"",
        "highlight":highlight??"",
        "price":price??"",
        "discountedPrice":discountedPrice??"",
        "main_category":mainCategory??"",
        "category":category??"",
        "variant":variant??"",
        "brand":brand??"",
        "origin":origin??"",
        "tips":tips??"",
        "additional_info":additionalInfo??"",
      });
      if(!image!.startsWith("http")) request.files.add(await http.MultipartFile.fromPath('image', image!));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        // print(await response.stream.bytesToString());
        var result=await response.stream.bytesToString();
        var res=jsonDecode(result);
        ModelX modelX=ModelX.fromJson(res);
        if(modelX.status==200){
          showToastSuccess(modelX.message);
          Get.to(()=>SuccessScreen())!.then((onValue){
            Get.back(result: true);
          });
        }else{
          showToastError(modelX.message);
        }
        apiResponse=ApiResponse(status: Status.COMPLETED);

      }
      else {
        showToastError(response.reasonPhrase);
        print(response.reasonPhrase);
        apiResponse=ApiResponse(status: Status.ERROR);

      }

    }catch(e){
      showToastError("$e");
      apiResponse=ApiResponse(status: Status.ERROR);

    }
    update();
    // closeLoading();
  }
}