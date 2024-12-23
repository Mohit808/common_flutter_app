
import 'package:carousel_slider/carousel_slider.dart';
import 'package:common_flutter_app/category_details_screen.dart';
import 'package:common_flutter_app/common_widgets/festival_banner/festival_banner_widget.dart';
import 'package:common_flutter_app/common_widgets/hot_deals/hot_deals_widget.dart';
import 'package:common_flutter_app/common_widgets/item_widget.dart';
import 'package:common_flutter_app/common_widgets/order_common_molecule/order_page_common.dart';
import 'package:common_flutter_app/common_widgets/plus_minus_widget.dart';
import 'package:common_flutter_app/models/home_model.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:common_flutter_app/screens/address/maps_screen.dart';
import 'package:common_flutter_app/screens/home/controller_home.dart';
import 'package:common_flutter_app/screens/orders/order_screen.dart';
import 'package:common_flutter_app/screens/profile_screen/profile_screen.dart';
import 'package:common_flutter_app/screens/search_screen/search_screen.dart';
import 'package:common_flutter_app/screens/see_all/see_all_screen.dart';
import 'package:common_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_see_all_widget.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../common_function/calculate_cart_amount.dart';
import '../../common_widgets/carousel_widget/carousel_widget.dart';
import '../../common_widgets/cart_snack_common.dart';
import '../../common_widgets/categories_page.dart';
import '../../common_widgets/controllers/controller_banner.dart';
import '../../common_widgets/controllers/controller_hot_deals.dart';
import '../../dashboard_screen.dart';
import '../../product_detail_screen.dart';
import '../store_details/store_detail_screen.dart';
import '../../utils/app_images.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetBuilder(init: ControllerHome(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(elevation: 0,title: Row(children: [
            ContainerDecorated(padding: 6,color: Color(0xFFBF360C),child: Column(children: [
              Icon(Icons.location_on,color: Colors.white,)
              // NormalHeadingText(text: "13",fontWeight: FontWeight.w800,color: Colors.white,),
              // SmallText(text: "MINS",color: Colors.white,),
            ],),),
            SizedBox(width: 16,),
            Expanded(
              child: InkWell(onTap: (){
                Get.to(()=>AddAddressScreen())!.then((onValue){
                  if(onValue!=null) controller.update();
                });
              },
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(
                    children: [
                      HeadingText(text: "${box.read(AppUtils.addressTitle)=="Home"|| box.read(AppUtils.addressTitle)=="Work"?"Delivery to":""} ${box.read(AppUtils.addressTitle)}".trim(),fontWeight: FontWeight.w800,size: 14,color: Colors.black,),
                      const Icon(Icons.keyboard_arrow_down,size: 20,)
                    ],
                  ),
                  NormalText(text: box.read(AppUtils.fullAddress),color: Colors.grey,size: 12,overflow: TextOverflow.fade,),
                ],),
              ),
            )
          ],),color: AppColors.scaffoldBackgroundColor,
            actions: [
              InkWell(onTap: (){
                Get.to(()=>ProfileScreen(deliveryCount: controller.listDelivery.length,));
              },child: Icon(Icons.account_circle_rounded,size: 40,)),
              SizedBox(width: 16,)],
          ),




          body: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

              Padding(
                padding: AppPaddings.paddingAll16,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  InkWell(onTap: (){
                    Get.to(()=>SearchScreen());
                  }, child: TextFieldCommon(enabled: false,hintText: "Search for cake",suffixIcon: Row(mainAxisSize: MainAxisSize.min,children: [
                    Icon(Icons.search),
                    SizedBox(width: 8,),
                    ContainerDecorated(width: 1,height: 20,color: Colors.grey,),
                    SizedBox(width: 8,),
                    Icon(Icons.mic,color: AppColors.primary,),
                    SizedBox(width: 8,)
                  ],),),),

                  SizedBox(height: 16,),
                  HeaderSeeAllWidget(heading: "HOT DEALS FOR YOU",fontSizeHeading: 12,),
                  SizedBox(height: 16,),

                  HotDealsWidget(controller: controller,),

                  SizedBox(height: 36,),

                  FestivalBannerWidget(),
                  // InkWell(onTap: (){
                  //   Get.to(()=>CategoryDetailsScreen(name: "The Softest & Creamiest Paneer",description: "Freshly hand churned,\njust for you!",image: AppImages.paneer,));
                  // }, child: ContainerDecorated(borderRadius: 16,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: Colors.indigoAccent,child: Row(children: [
                  //   Column(children: [
                  //     SmallText(text: "The Softest & Creamiest Paneer",color: Colors.white,fontWeight: FontWeight.w800,),
                  //     SizedBox(height: 8,),
                  //     BigSemiText(text: "Freshly hand churned,\njust for you!",color: Colors.white,fontWeight: FontWeight.w800,),
                  //   ],),
                  //   Spacer(),
                  //   NetworkOrAssetImage(src: AppImages.paneer,height: 80,width: 80,fit: BoxFit.cover,)
                  // ],),),),


                  SizedBox(height: 36,),
                  CategoriesPage(),
                  SizedBox(height: 16,),

                  HeaderWithLineWidget(text: "SHOP BY STORE",),
                  SizedBox(height: 16,),
                  SizedBox(height: 160,
                    child: Skeletonizer(enabled: controller.apiResponse.status==Status.LOADING,
                      child: ListView.builder(scrollDirection: Axis.horizontal,shrinkWrap: true, itemCount: controller.listStore.length,itemBuilder: (itemBuilder,index){
                        return Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: InkWell(onTap: (){
                            Get.to(()=>StoreDetailScreen(id: controller.listStore[index].id,heading: controller.listStore[index].storeName,desc: controller.listStore[index].storeStory,logo: controller.listStore[index].storeLogo,));
                          },
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50),bottomRight: Radius.circular(15),bottomLeft: Radius.circular(15)),child: ContainerDecorated(padding: 0,borderRadius: 15,child: NetworkOrAssetImage(src:   controller.listStore[index].storeLogo ?? AppImages.health,height: 100,width: 100,fit: BoxFit.cover,),)), // DateTime.timestamp().millisecond.isEven?AppImages.toys: AppImages.health

                                const SizedBox(height: 8,),

                                SizedBox(width: 100,child: SmallText(text: "${controller.listStore[index].storeName}",fontWeight: FontWeight.w700,maxLine: 1,)),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    Icon(Icons.location_on,color: Colors.grey,size: 14,),
                                    const SmallText(text: "1.4 KM",textAlign: TextAlign.center,),
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],),
              ),


              SizedBox(height: 16,),
              GetBuilder(init: ControllerBanner(),
                builder: (controllerBanner) {
                  return CarouselWidget(controller: controllerBanner,);
                }
              ),
              SizedBox(height: 24,),

              Padding(
                padding:AppPaddings.paddingAll16,
                child: ItemWidget(),
              ),
              // SizedBox(height: 24,),
              Padding(
                padding:AppPaddings.paddingAll16,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigSemiText(text: "Shop by Brands",letterSpacing: 2,),
                    SizedBox(height: 4,),
                    SmallText(text: "Choose the brand which fits to you"),
                  ],
                ),
              ),

              Container(width: double.infinity,color: Colors.grey.shade300,
                child: SizedBox(height: 200,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16,top: 16,bottom: 16),
                    child: GridView.builder(itemCount: controller.listBrand.length,shrinkWrap: true,scrollDirection: Axis.horizontal,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8), itemBuilder: (itemBuilder,index){
                      return InkWell(onTap: (){
                        Get.to(()=>SeeAllScreen(title: "${controller.listBrand[index].name}",brandId: controller.listBrand[index].id,));
                      },child: ContainerDecorated(color: Colors.white,child: NetworkOrAssetImage(src: controller.listBrand[index].image!),));
                    }),
                  ),
                ),
              ),

              SizedBox(height: 100,)
            ],),
          ),
          bottomSheet: controller.listDelivery.isEmpty?null: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: ContainerDecorated(color: AppColors.primary,child: Row(children: [
              SizedBox(width: 16,),
              SmallText(text: "${controller.listDelivery.length} Delivery",fontWeight: FontWeight.w800,color: Colors.white,),
              Spacer(),
              InkWell(onTap: (){
                Get.to(()=> OrderScreenCommon());
              },
                child: ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 6,horizontal: 16),color: Colors.white,child: Row(
                  children: [
                    SmallText(text: "Orders",fontWeight: FontWeight.w700,color:AppColors.primary),
                    SizedBox(width: 16,),
                    ContainerDecorated(color: AppColors.primary,child: Icon(Icons.shopping_cart,size: 10,color: Colors.white,))
                  ],
                )),
              ),
              SizedBox(width: 16,)
            ],),),
          ),
          persistentFooterButtons: CartSnackCommon().showCart(),
        );
      }
    );
  }
}