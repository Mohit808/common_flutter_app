import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

import '../../category_details_screen.dart';
import '../../utils/app_images.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key,this.controller});
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return controller.list.isEmpty?SizedBox():
    Column(children: [
      CarouselSlider.builder(
        itemCount: controller.list.length,
        itemBuilder: (BuildContext ctx, int itemIndex, int pageViewIndex) =>
            Container(
                child: InkWell(onTap: (){
                  Get.to(()=>CategoryDetailsScreen(id: controller.list[itemIndex].id,name: controller.list[itemIndex].name??"Monsoon's Exotic Harvest!",description: controller.list[itemIndex].description??"Up to 30% OFF on fruits that are too good to last forever",image: controller.list[itemIndex].image??AppImages.health,));
                },child:
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: BannerWidget(startColor: controller.list[itemIndex].startColor,endColor: controller.list[itemIndex].endColor,width: MediaQuery.of(context).size.width,heading: controller.list.first.name,description: controller.list.first.description,image: controller.list.first.image,isNetworkImage: true,),
                ))

            ), options: CarouselOptions(height: 180,viewportFraction: 0.94,autoPlay: true,enableInfiniteScroll: false),
      ),

      Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        for(var x in controller.list)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 4),
            child: ContainerDecorated(color: AppColors.primary,height: 6,width: 6,),
          )
      ],)
    ],
    );
  }
}
