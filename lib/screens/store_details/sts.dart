// import 'package:common_flutter_app/common_widgets/item_widget.dart';
// import 'package:common_flutter_app/screens/store_details/controller_unique_category_by_store.dart';
// import 'package:common_flutter_app/utils/app_images.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modular_ui_package/common_functions/image_network.dart';
// import 'package:modular_ui_package/common_widget/appbar_common.dart';
// import 'package:modular_ui_package/common_widget/banner_widget.dart';
// import 'package:modular_ui_package/common_widget/category_widget.dart';
// import 'package:modular_ui_package/common_widget/container_decorated.dart';
// import 'package:modular_ui_package/common_widget/header/header_see_all_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
// import 'package:modular_ui_package/text_atoms/text_common.dart';
// import 'package:modular_ui_package/theme/app_colors.dart';
// import 'package:modular_ui_package/theme/app_paddings.dart';
// import 'package:modular_ui_package/utils/app_images.dart';
// import 'package:modular_ui_package/utils/network_handling/api_response.dart';
//
// import '../../category_details_screen.dart';
// import '../../common_widgets/controllers/controller_variant.dart';
// import '../../common_widgets/item_widget_vertical.dart';
// import '../../common_widgets/variant_tab_widget.dart';
//
// class StoreDetailScreen extends StatelessWidget {
//   const StoreDetailScreen({super.key, this.heading, this.desc, this.logo, this.id});
//   final dynamic id;
//   final String? heading;
//   final String? desc;
//   final String? logo;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//
//       appBar: AppBarCommon(title: "",elevation: 0,color: AppColors.scaffoldBackgroundColor,height: 0,),
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//
//
//             Column(crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ContainerDecorated(borderRadius: 0,linearGradient: LinearGradient( stops: [0.0,0.5, 1.0],
//                     begin: FractionalOffset.topCenter,
//                     end: FractionalOffset.bottomCenter,
//                     tileMode: TileMode.clamp,colors: [
//                       Color(0xFFFFAF7A),
//                       Color(0xFFFFFFFF),
//                       Color(0xFFF9F9F9),
//                     ]),
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 24.0),
//                     child: Row(
//                       children: [
//                         SizedBox(width: 16,),
//                         Expanded(
//                           child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                             SizedBox(height: 16,),
//                             BigText24(text: heading??"Puja Store",size: 30,),
//                             SizedBox(height: 8,),
//                             HeadingText(text: desc??"One stop shop for puja & ritual needs.")
//
//                           ],),
//                         ),
//                         SizedBox(width: 16,),
//                         Expanded(child: NetworkOrAssetImage(src: logo??AppImages.puja))
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 16,),
//                 SizedBox(height: 270,
//                   child: GetBuilder(init: ControllerUniqueCategoryByStore(id: id),
//                       builder: (controllerVariant) {
//                         return controllerVariant.apiResponse.status==Status.LOADING?LoadingWidget(center: true,):
//                         GridView.builder(padding: EdgeInsets.only(left: 8),scrollDirection: Axis.horizontal,shrinkWrap: true,itemCount: controllerVariant.list.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisExtent: 110), itemBuilder: (itemBuilder,index){
//                           return InkWell(onTap: (){
//                             Get.to(()=>CategoryDetailsScreen(id: controllerVariant.list[index].id,name: controllerVariant.list[index].name,description: controllerVariant.list[index].description,image: controllerVariant.list[index].image,));
//
//                           },child: CategoryWidget(image: controllerVariant.list[index].image??AppImages.diya,text: "${controllerVariant.list[index].name??"Diya, Ghee and More"}",));
//                         });
//                       }
//                   ),
//                 ),
//
//
//                 Padding(
//                   padding:AppPaddings.paddingAll16,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                     SizedBox(height: 8,),
//                     ItemWidget(heading: "Get daily puja essentials",),
//
//                     SizedBox(height: 16,),
//                     HeadingText(text: "Curated For You",fontWeight: FontWeight.w800,letterSpacing: 0.8,),
//                     SizedBox(height: 16,),
//                     BannerWidget(image: AppImages.puja,),
//                     SizedBox(height: 24,),
//                     ContainerDecorated(linearGradient: LinearGradient( stops: [0.0,0.1,0.2,0.1,0.9],
//                         begin: FractionalOffset.topCenter,
//                         end: FractionalOffset.bottomCenter,
//                         colors: [
//                           Color(0xFFFFAF7A).withOpacity(0.1),
//                           Color(0xFFFFAF7A).withOpacity(0.08),
//                           Color(0xFFFFAF7A).withOpacity(0.05),
//                           Color(0xFFFFAF7A).withOpacity(0.03),
//                           Color(0xFFFFAF7A).withOpacity(0.01),
//                         ]),
//
//                       child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
//                         Column(crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             BigSemiText(text: "Setup your puja space",fontWeight: FontWeight.w800,letterSpacing: 0.5,),
//                             NormalText(text: "Get all your essentials"),
//                           ],
//                         ),
//
//                         NetworkOrAssetImage(src: AppImages.diya,height: 50,width: 50,)
//                       ],),
//                     ),
//                     SizedBox(height: 8,),
//                     VariantTabWidget(id: 1,color: Colors.transparent,),
//
//                     SizedBox(height: 16,),
//                     ItemWidgetVertical(categoryId: 1, variantId: 1,),
//
//                     SizedBox(height: 16,),
//                     Row(
//                       children: [
//                         BigSemiText(text: "See All Diya & More",fontWeight: FontWeight.w800,color: AppColors.primary,),
//                         SizedBox(width: 8,),
//                         ContainerDecorated(padding: 2,borderRadius: 40,color: AppColors.primary,child: Icon(Icons.arrow_forward_ios_rounded,size: 14,color: Colors.white,))
//                       ],
//                     ),
//
//                     SizedBox(height: 100,),
//
//                   ],),
//                 ),
//
//
//
//
//
//
//               ],
//             ),
//
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Row(children: [
//                 InkWell(onTap: (){
//                   Get.back();
//                 },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.arrow_back)),),
//                 Spacer(),
//                 Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.search)),
//                 SizedBox(width: 16,),
//                 Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.share)),
//
//               ],),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
