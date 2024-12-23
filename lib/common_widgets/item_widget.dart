import 'package:common_flutter_app/common_widgets/add_to_cart_bar_widget.dart';
import 'package:common_flutter_app/models/home_model.dart';
import 'package:common_flutter_app/screens/see_all/see_all_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_see_all_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import '../product_detail_screen.dart';
import '../screens/home/controller_home.dart';

Map mapCart={};
// Map mapCartDetail={};

class ItemWidget extends StatelessWidget {
  const ItemWidget({super.key,  this.heading,this.subtitle,});
  final String? heading;
  final String? subtitle;
  // final dynamic variantId;
  // final dynamic categoryId;

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder(init: ControllerHome(),
        builder: (controller) {
          return
            controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,) :
            controller.list.isEmpty?NoDataWidget(center: true,):

            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                for(var x in controller.list)
                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    InkWell(onTap: (){
                      Get.to(()=>SeeAllScreen(title: "${x.name}",variantId: "",categoryId: x.featureList==null?"": x.featureList!.indexWhere((element) => element.category!=null)==-1?"":    x.featureList![ x.featureList!.indexWhere((element) => element.category!=null)].category,))
                      !.then((onValue){
                        controller.update();
                      });
                    },child: HeaderSeeAllWidget(heading:   x.name! ,subTitle: x.name,)),
                    SizedBox(height: 16,),
                    x.featureList!.isEmpty?SizedBox():SizedBox(height: 240,
                      child: ListView.builder(itemCount: x.featureList!.length,shrinkWrap: true,scrollDirection: Axis.horizontal, itemBuilder: (itemBuilder,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: SizedBox(width: 125,
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    InkWell(onTap: (){
                                      Get.to(()=>ProductDetailScreen(data: Data.fromJson(x.featureList![index].toJson()),));
                                    },child: ContainerDecorated(padding: 0,color: Colors.transparent,colorBorder: Colors.grey.shade200,child: NetworkOrAssetImage(src: '${x.featureList![index].image}',height: 125,width: 125,fit: BoxFit.contain,))),
                                    x.featureList![index].discountPercentage!.toStringAsFixed(0) == "0"?SizedBox():Container(padding: EdgeInsets.all(4),child: SmallText(text: "${x.featureList![index].discountPercentage!.toStringAsFixed(0)} %\nOFF",size: 10,fontWeight: FontWeight.w600,color: Colors.white,),decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),)
                                  ],
                                ),
                                const SizedBox(height: 8,),
                                // SmallText(text: controller.list[index].brand!=null?controller.list[index].brand!.name! : "",maxLine: 1,overflow: TextOverflow.ellipsis,color: Colors.black54,),
                                SizedBox(height: 4,),
                                SmallText(text: "${x.featureList![index].name}",fontWeight: FontWeight.w700,maxLine: 2,overflow: TextOverflow.ellipsis,),
                                SizedBox(height: 8,),
                                SmallText(text: "3 pieces/ 10g",),
                                SizedBox(height: 4,),

                                Row(children: [
                                  Expanded(flex: 3,
                                    child: Row(
                                      children: [
                                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SmallText(text: x.featureList![index].discountedPrice==null?"":"₹${x.featureList![index].price}",textDecoration: TextDecoration.lineThrough,color: Colors.grey,),
                                            SizedBox(width: 6,),
                                            SmallText(text: x.featureList![index].discountedPrice==null?"₹${x.featureList![index].price}":"₹${x.featureList![index].discountedPrice}",fontWeight: FontWeight.w700,),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  AddToCartBarWidget(id: x.featureList![index].id,controller: controller,item: x.featureList![index].toJson(),)
                                ],)
                              ],
                            ),
                          ),
                        );
                      }),
                    ),

                  ],)
              ],
            );
        }
    );
  }
}
