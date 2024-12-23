import 'package:common_flutter_app/common_widgets/skeletons/skeleton_hot_deals.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import '../../product_detail_screen.dart';
import '../controllers/controller_hot_deals.dart';
import '../item_widget.dart';
import '../plus_minus_widget.dart';

class HotDealsWidget extends StatelessWidget {
  const HotDealsWidget({super.key, this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerHotDeals(),
        builder: (controllerHotDeals) {
          return SizedBox(height: 220,
            child:
            controllerHotDeals.apiResponse.status==Status.LOADING?
                SkeletonHotDeals() :
            ListView.builder(itemCount: controllerHotDeals.list.length,shrinkWrap: true,scrollDirection: Axis.horizontal, itemBuilder: (itemBuilder,index){
              return Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: InkWell(onTap: (){
                  Get.to(()=>ProductDetailScreen(data: controllerHotDeals.list[index],));
                },
                  child: SizedBox(width: 125,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0,right: 8),
                              child: ContainerDecorated(color: Colors.transparent,colorBorder: Colors.grey.shade200,child: NetworkOrAssetImage(src:"${controllerHotDeals.list[index].image}",height: 125,width: 125,fit: BoxFit.fitWidth,)),
                            ),

                            !mapCart.containsKey(controllerHotDeals.list[index].id)?Align(alignment: Alignment.topRight,child: InkWell(onTap: (){
                              mapCart[controllerHotDeals.list[index].id]={"qty":1,"item":controllerHotDeals.list[index].toJson()};
                              controller.update();
                            },child: ContainerDecorated(colorBorder: Colors.grey.shade200,child: Icon(Icons.add),color: Colors.white,))):Align(alignment: Alignment.topRight,child: SizedBox(width: 80,child: PlusMinusWidget(controller: controller,id: controllerHotDeals.list[index].id,))),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(padding: EdgeInsets.all(4),child: SmallText(text: "${controllerHotDeals.list[index].discountPercentage!.toStringAsFixed(0)} %\nOFF",size: 10,fontWeight: FontWeight.w600,color: Colors.white,),decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),),
                            )
                          ],
                        ),
                        const SizedBox(height: 8,),
                        Expanded(child: SizedBox(width: 75,child: SmallText(text: "${controllerHotDeals.list[index].name}",fontWeight: FontWeight.w700,maxLine: 2,overflow: TextOverflow.ellipsis,))),
                        SizedBox(height: 8,),
                        SmallText(text: "3 pieces",),
                        SizedBox(height: 4,),
                        Row(children: [
                          SmallText(text: controllerHotDeals.list[index].discountedPrice==null?"":"₹${controllerHotDeals.list[index].price}",textDecoration: TextDecoration.lineThrough,color: Colors.grey,),
                          SizedBox(width: 6,),
                          SmallText(text: controllerHotDeals.list[index].discountedPrice==null?"₹${controllerHotDeals.list[index].price}":"₹${controllerHotDeals.list[index].discountedPrice}",fontWeight: FontWeight.w700,),

                        ],)
                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }
    );
  }
}
