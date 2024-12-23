import 'package:common_flutter_app/category_details_screen.dart';
import 'package:common_flutter_app/common_widgets/skeletons/skeleton_category.dart';
import 'package:common_flutter_app/screens/categories/controller_categories.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/category_widget.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCategories(),
      builder: (controller) {
        return
          controller.apiResponse.status==Status.LOADING?
              SkeletonCategory():
          ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
          return
            controller.list[index].categories==null?SizedBox():Column(children: [
            HeaderWithLineWidget(text: "${controller.list[index].name}",),
            SizedBox(height: 16,),
            GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: controller.list[index].categories!.length,itemBuilder: (itemBuilder,indexCat){
              return InkWell(onTap: (){
                Get.to(()=>CategoryDetailsScreen(id: controller.list[index].categories![indexCat].id,name: controller.list[index].categories![indexCat].name,description: controller.list[index].categories![indexCat].description,image: controller.list[index].categories![indexCat].image,));
              },child: CategoryWidget(image: controller.list[index].categories![indexCat].image,text: controller.list[index].categories![indexCat].name,));
            }),

            SizedBox(height: 16,),
          ],);
        });
        //   Column(children: [
        //   HeaderWithLineWidget(text: "GROCERY & KITCHEN",),
        //   SizedBox(height: 16,),
        //   GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: 8,itemBuilder: (itemBuilder,index){
        //     return InkWell(onTap: (){
        //       Get.to(()=>CategoryDetailsScreen());
        //     },child: CategoryWidget());
        //   }),
        //
        //   SizedBox(height: 16,),
        //   HeaderWithLineWidget(text: "SNACKS & DRINKS",),
        //   SizedBox(height: 16,),
        //   GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: 8,itemBuilder: (itemBuilder,index){
        //     return InkWell(onTap: (){
        //       Get.to(()=>CategoryDetailsScreen());
        //     },child: CategoryWidget());
        //   }),
        //
        //   SizedBox(height: 16,),
        //   HeaderWithLineWidget(text: "BEAUTY & PERSONAL CARE",),
        //   SizedBox(height: 16,),
        //   GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: 8,itemBuilder: (itemBuilder,index){
        //     return InkWell(onTap: (){
        //       Get.to(()=>CategoryDetailsScreen());
        //     },child: CategoryWidget());
        //   }),
        //
        //   SizedBox(height: 16,),
        //   HeaderWithLineWidget(text: "HOUSEHOLD ESSENTIALS",),
        //   SizedBox(height: 16,),
        //   GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: 8,itemBuilder: (itemBuilder,index){
        //     return InkWell(onTap: (){
        //       Get.to(()=>CategoryDetailsScreen());
        //     },child: CategoryWidget());
        //   }),
        //
        // ],);
      }
    );
  }
}
