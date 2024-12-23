import 'package:common_flutter_app/common_widgets/controllers/controller_variant.dart';
import 'package:common_flutter_app/common_widgets/item_widget_vertical.dart';
import 'package:common_flutter_app/common_widgets/variant_tab_widget.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key,this.id, this.name, this.description,this.image});
  final  id;
  final  name;
  final  description;
  final  image;

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder(init: ControllerVariant(id: widget.id),
      builder: (controllerVariant) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBarCommon(title: "title",elevation: 0,color: AppColors.scaffoldBackgroundColor,height: 0,),
          body: SingleChildScrollView(
            child: Stack(
              children: [

                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24)),gradient: LinearGradient(

                        tileMode: TileMode.clamp,colors: [
                          Color(0xFFFFAF7A),
                          Color(0xFFFFAF7A),
                          Color(0xFFFFAF7A),
                        ])),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 24.0,bottom: 24),
                        child: Row(
                          children: [
                            SizedBox(width: 16,),
                            Expanded(
                              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                SizedBox(height: 16,),
                                BigText24(text: widget.name??"Inspired By Nature!",size: 30,),
                                SizedBox(height: 8,),
                                HeadingText(text: widget.description??"Up to 15% OFF on premium frgrances")
                              ],),
                            ),
                            SizedBox(width: 16,),
                            Expanded(child: NetworkOrAssetImage(src: widget.image??AppImages.puja))
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 8,),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0,top: 16),
                      child: VariantTabWidget(selectedTab: controllerVariant.selectedTab,onTap: (index){
                        controllerVariant.onTabChanged(index);
                      },),
                    ),
                    controllerVariant.apiResponse.status==Status.LOADING?SizedBox():ItemWidgetVertical(categoryId: widget.id,variantId: controllerVariant.list.isEmpty?"": controllerVariant.list[controllerVariant.selectedTab].id,)
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                    InkWell(onTap: (){
                      Get.back();
                    },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.arrow_back))),
                    Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.share)),
                  ],),
                ),


              ],
            ),
          ),
        );
      }
    );
  }
}
