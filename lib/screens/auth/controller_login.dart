import 'package:common_flutter_app/models/login_model.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

class ControllerLogin extends GetxController{
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPass=TextEditingController();
  TextEditingController textEditingControllerConfirmPass=TextEditingController();
  TextEditingController textEditingControllerFirstName=TextEditingController();
  TextEditingController textEditingControllerLastName=TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  String selectedTab="Login";
  ApiResponse apiResponse=ApiResponse(status: Status.INITIAL);
  @override
  void onInit() {
    super.onInit();
  }

  loginFunction() async {
    if(!formKey.currentState!.validate()) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppConst.login,data: {
        "email":textEditingControllerEmail.text,
        "password":textEditingControllerPass.text,
      });
      print(res);
      LoginModel loginModel=LoginModel.fromJson(res);
      if(loginModel.status==200){
        // if(loginModel.data!.user!.mobile!.isEmpty);
        token=loginModel.data!.token!;
        box.write("token", token);
        box.write("user", loginModel.data!.user!.toJson());
        showToastSuccess(loginModel.message);
        Get.back();
      }else{
        showToastError(loginModel.message);
      }
    }catch(e){
      showToastError("$e");
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();

  }
  createAccount() async {
    if(!formKey.currentState!.validate()) return;
    apiResponse=ApiResponse(status: Status.LOADING);
    update();
    try{
      var res=await NetworkManager().post(AppConst.signUp,data: {
        "email":textEditingControllerEmail.text,
        "password":textEditingControllerPass.text,
        "firstName":textEditingControllerFirstName.text,
        "lastName":textEditingControllerLastName.text,
      });
      print(res);
      LoginModel loginModel=LoginModel.fromJson(res);
      if(loginModel.status==200){
        // if(loginModel.data!.user!.mobile!.isEmpty);
        token=loginModel.data!.token!;
        box.write("token", token);
        box.write("user", loginModel.data!.user!.toJson());
        showToastSuccess(loginModel.message);
        Get.back();
      }else{
        showToastError(loginModel.message);
      }
    }catch(e){
      showToastError("$e");
    }
    apiResponse=ApiResponse(status: Status.COMPLETED);
    update();

  }

}