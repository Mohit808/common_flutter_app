import 'package:common_flutter_app/common_widgets/hot_deals/hot_deals_widget.dart';
import 'package:common_flutter_app/common_widgets/item_widget_vertical.dart';
import 'package:common_flutter_app/common_widgets/list_and_grids/grid_view_vertical.dart';
import 'package:common_flutter_app/screens/search_screen/controller_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerSearch(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "",color: AppColors.scaffoldBackgroundColor,elevation: 0,height: 0,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Column(children: [
                TextFieldCommon(onEditingComplete: (){
                  controller.list=[];
                  controller.fetchData();

                },controller: controller.textEditingController,hintText: "Search for cake",suffixIcon: Row(mainAxisSize: MainAxisSize.min,children: [
                  InkWell(onTap: (){
                    controller.list=[];
                    controller.fetchData();
                  },child: Icon(Icons.search)),
                  !controller.showMike?SizedBox():Row(children: [
                    SizedBox(width: 8,),
                    ContainerDecorated(width: 1,height: 20,color: Colors.grey,),
                    SizedBox(width: 8,),
                    Icon(Icons.mic,color: AppColors.primary,),
                    SizedBox(width: 8,)
                  ],)
                ],),),

                SizedBox(height: 16,),
                GridViewVertical(controller: controller,)

              ],),
            ),
          ),
        );
      }
    );
  }
}
