import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/border_atom.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_sizes.dart';
import 'package:modular_ui_package/utils/utils.dart';


// late UserModel userModel;

class AppUtils{
  static String customerType="customerType";
  static String isBasicDetail="isBasicDetail";
  static String fullAddress="fullAddress";
  static String addressTitle="addressTitle";
  static String latitude="latitude";
  static String longitude="longitude";

  init(){
    var user=box.read(Utils.user);
    if(user!=null){
      // userModel=UserModel.fromJson(user);
    }
  }
}
