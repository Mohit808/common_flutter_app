import 'package:common_flutter_app/screens/search_screen/controller_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import '../../product_detail_screen.dart';
import '../add_to_cart_bar_widget.dart';

class GridViewVertical extends StatelessWidget {
  const GridViewVertical({super.key, this.controller});
  final dynamic controller;
  @override
  Widget build(BuildContext context) {
    return
      controller.apiResponse.status==Status.INITIAL? SizedBox():
      controller.apiResponse.status==Status.LOADING? LoadingWidget():
          controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,msg: "",):
              controller.list.isEmpty?NoDataWidget(center: true,):
      GridView.builder(physics: NeverScrollableScrollPhysics(),gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 280),itemCount: controller.list.length,shrinkWrap: true, itemBuilder: (itemBuilder,index){
      return
        InkWell(onTap: (){
          Get.to(()=>ProductDetailScreen(data: controller.list[index],))!.then((onValue){
            controller.update();
          });
        },
          child: Container(decoration: BoxDecoration(color: Colors.white,border: Border(left: BorderSide(color: Colors.grey.shade200),top: BorderSide(color: Colors.grey.shade200),bottom:  BorderSide(color: Colors.grey.shade200),right:   BorderSide(color: Colors.grey.shade200))),padding: EdgeInsets.all(4),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      ContainerDecorated(width: double.infinity,height: double.infinity,color: Colors.transparent,colorBorder: Colors.grey.shade200,child: NetworkOrAssetImage(src: "${controller.list[index].image}",fit: BoxFit.fitHeight,)),
                      Container(padding: EdgeInsets.all(4),child: SmallText(text: "16 %\nOFF",size: 10,fontWeight: FontWeight.w600,color: Colors.white,),decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),)
                    ],
                  ),
                ),
                const SizedBox(height: 8,),
                const SmallText(text: "Fruit & Vegitable",maxLine: 1,overflow: TextOverflow.ellipsis,color: Colors.black54,),
                SizedBox(height: 4,),
                SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w700,maxLine: 2,overflow: TextOverflow.ellipsis,),
                SizedBox(height: 8,),
                SmallText(text: "3 pieces",),
                SizedBox(height: 4,),
                Row(children: [
                  Expanded(flex: 3,
                    child: Row(
                      children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: controller.list[index].discountedPrice==null?"":"₹${controller.list[index].price}",textDecoration: TextDecoration.lineThrough,color: Colors.grey,),
                            SizedBox(width: 6,),
                            SmallText(text: controller.list[index].discountedPrice==null?"₹${controller.list[index].price}":"₹${controller.list[index].discountedPrice}",fontWeight: FontWeight.w700,),
                          ],
                        ),
                      ],
                    ),
                  ),

                  AddToCartBarWidget(id: controller.list[index].id,controller: controller,item: controller.list[index].toJson(),),
                ],)
              ],
            ),
          ),
        );
    });
  }
}
