import 'package:common_flutter_app/common_widgets/controllers/controllerItemVeritical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import '../product_detail_screen.dart';
import '../screens/home/controller_home.dart';
import 'add_to_cart_bar_widget.dart';
import 'list_and_grids/grid_view_vertical.dart';

class ItemWidgetVertical extends StatelessWidget {
  const ItemWidgetVertical({super.key, this.variantId, this.categoryId, this.brandId});
  final dynamic variantId;
  final dynamic categoryId;
  final dynamic brandId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerItemVertical(variantId: variantId??"",categoryId: categoryId??"",brandId: brandId??""),
        builder: (controller) {
          return
            ContainerDecorated(color: Colors.white,padding: 8,
              child:
              controller.apiResponse.status==Status.LOADING?Padding(
                padding: const EdgeInsets.only(top: 16.0,bottom: 500),
                child: LoadingWidget(center: true,),
              ):
              controller.list.isEmpty?Padding(
                padding: const EdgeInsets.all(16.0),
                child: NoDataWidget(center: true,),
              ):
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                SizedBox(height: 8,),
                NormalText(text: "${controller.list.length} Items",fontWeight: FontWeight.w500,),
                Divider(height: 32,),

                GridViewVertical(controller: controller,),
                SizedBox(height: 16,),

              ],),
            );
        }
    );
  }
}




class ItemWidgetVerticalDetail extends StatelessWidget {
  const ItemWidgetVerticalDetail({super.key, this.variantId, this.categoryId, this.brandId});
  final dynamic variantId;
  final dynamic categoryId;
  final dynamic brandId;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerItemVerticalDetail(variantId: variantId??"",categoryId: categoryId??"",brandId: brandId??""),
        builder: (controller) {
          return
            ContainerDecorated(color: Colors.white,padding: 8,
              child:
              controller.apiResponse.status==Status.LOADING?Padding(
                padding: const EdgeInsets.only(top: 16.0,bottom: 500),
                child: LoadingWidget(center: true,),
              ):
              controller.list.isEmpty?Padding(
                padding: const EdgeInsets.all(16.0),
                child: NoDataWidget(center: true,),
              ):
              Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                SizedBox(height: 8,),
                NormalText(text: "${controller.list.length} Items",fontWeight: FontWeight.w500,),
                Divider(height: 32,),

                GridViewVertical(controller: controller,),
                SizedBox(height: 16,),

              ],),
            );
        }
    );
  }
}
