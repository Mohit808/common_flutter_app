import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';

class ControllerTabBar extends GetxController{
  int selectedTab=0;
  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  fetchData(){

  }
}