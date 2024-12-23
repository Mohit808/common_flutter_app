
import 'package:common_flutter_app/common_widgets/common_tab_bar/controller_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

class TabBarCommon extends StatelessWidget {
  const TabBarCommon({super.key, required this.changeTab});

  final Function({int? selectedTab}) changeTab;
  // changeTab({required ControllerSellerOrder controller, required int selectedTab, required int status}){
  //   controller.selectedTab=selectedTab;
  //   controller.apiResponse=ApiResponse(status: Status.LOADING);
  //   controller.list=[];
  //   controller.update();
  //   controller.fetchData(status: status);
  // }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerTabBar(),
      builder: (controller) {
        return ContainerDecorated(
          child: Row(children: [
            Expanded(child: ContainerDecorated(onTap: (){changeTab.call(selectedTab: 0,);},color: controller.selectedTab==0?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "New",fontWeight: FontWeight.w600,color: controller.selectedTab==0?AppColors.primary:Colors.black54,textAlign: TextAlign.center,))),
            Expanded(child: ContainerDecorated(onTap: (){changeTab.call(selectedTab: 1);},color: controller.selectedTab==1?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "Ongoing",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==1?AppColors.primary:Colors.black54,))),
            Expanded(child: ContainerDecorated(onTap: (){changeTab.call(selectedTab: 2);},color: controller.selectedTab==2?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "Completed",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==2?AppColors.primary:Colors.black54,))),

          ],),
        );
      }
    );
  }
}
