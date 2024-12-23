import 'package:common_flutter_app/a_seller/product_management/create_product/create_product_screen.dart';
import 'package:common_flutter_app/a_seller/product_management/inventory/controller_inventory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import '../../../utils/app_images.dart';

class InventoryScreen extends StatelessWidget {
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerInventory(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarCommon(title: "Inventory Management",elevation: 0,color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,),
            body:
            controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,):
            controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,msg: controller.apiResponse.message,):
            SingleChildScrollView(
              child: Padding(
                padding: AppPaddings.paddingAll16,
                child: Column(children: [
                  controller.list.isEmpty?emptyWidget():productWidget(controller)
                ],),
              ),
            ),
            persistentFooterButtons: [
              ButtonSingleAtom(tap: (){
                Get.to(()=>CreateProductScreen())!.then((onValue){
                  if(onValue!=null) Get.back();
                });
              },widget: Row(mainAxisSize: MainAxisSize.min,children: [
                Icon(Icons.add,size: 20,color: Colors.white,),
                SizedBox(width: 8,),
                NormalHeadingText(text: "Create Product",color: Colors.white,)
              ],),)
            ],
          );
        }
    );
  }
  emptyWidget(){
    return Column(children: [
      NetworkOrAssetImage(src: AppImages.products),
      SizedBox(height: 24,),
      BigText20(text: "List Your Product"),
      SizedBox(height: 4,),
      NormalText(text: "To start earning from selling product"),
      SizedBox(height: 16,),
      ButtonSingleAtom(tap: (){
        // Get.to(()=>SellerHomeScreen());
      },color: Colors.transparent,colorBorder: Colors.grey,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
        NormalHeadingText(text: "Add Product On Digital Store"),
        SizedBox(width: 16,),
        ContainerDecorated(borderRadius: 20,color: AppColors.primary,child: Icon(Icons.arrow_forward,size: 16,color: Colors.white,),),
      ],),),
      SizedBox(height: 36,),
      Row(children: [
        Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
        NormalHeadingText(text: "  or  "),
        Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
      ],),
      SizedBox(height: 36,),
      Row(
        children: [
          NormalHeadingText(text: "Product Listing FAQs"),
        ],
      ),
      ExpansionTile(tilePadding: EdgeInsets.only(),title: SmallText(text: "Choose quick commerce FAQs Questions"))
    ],);
  }
  productWidget(ControllerInventory controller){
    return Column(children: [
      controller.list.isEmpty?SizedBox():HeaderWithLineWidget(text: "Published Product",),
      SizedBox(height: 16,),
      ListView.builder(itemCount: controller.list.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (itemBuilder,index){
        return Padding(
            padding:  EdgeInsets.only(bottom: 16.0),
            child:
            ContainerDecorated(elevation: 1,borderRadius: 15,color: Colors.white,padding: 8,child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [
              ContainerDecorated(padding: 0,child: NetworkOrAssetImage(src: controller.list[index].image!,height: 50,width: 50,)),
              const SizedBox(width: 12,),
              Expanded(flex: 3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallText(text: "${controller.list[index].name}",fontWeight: FontWeight.w600,size: 13,),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      SmallText(text: "Qty: ",color: Colors.grey,fontWeight: FontWeight.w500,),
                      SmallText(text: "3 pieces/10g",fontWeight: FontWeight.w500,),
                      SizedBox(width: 16,),
                      SmallText(text: "Stock : ",color: Colors.grey,fontWeight: FontWeight.w500,),
                      SmallText(text: "∞",fontWeight: FontWeight.w500,),
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      controller.list[index].discountedPrice==null?SizedBox():SmallText(text: "₹${controller.list[index].price}",color: Colors.grey,fontWeight: FontWeight.w600,textDecoration: TextDecoration.lineThrough,),
                      SizedBox(width: controller.list[index].discountedPrice==null?0:16,),
                      SmallText(text: "₹${controller.list[index].discountedPrice==null?controller.list[index].price:controller.list[index].discountedPrice}",fontWeight: FontWeight.w600,),
                    ],
                  ),
                  SizedBox(height: 4,),
                  SmallText(text: "Category : ${controller.list[index].category}"),
                  SizedBox(height: 8,),
                  Row(children: [
                    Row(mainAxisSize: MainAxisSize.min,children: [
                      Icon(Icons.edit,size: 16,color: Colors.blue,),
                      SizedBox(width: 8,),
                      SmallText(text: "Edit",fontWeight: FontWeight.w600,color: Colors.blue,),
                      SizedBox(width: 8,),
                    ],),
                    SizedBox(width: 16,),
                    Row(mainAxisSize: MainAxisSize.min,children: [
                      Icon(Icons.delete,size: 16,color: AppColors.primary,),
                      SizedBox(width: 8,),
                      SmallText(text: "Delete",fontWeight: FontWeight.w600,color: AppColors.primary,),
                      SizedBox(width: 8,),
                    ],),
                  ],)
                ],
              )),

             // Padding(
             //   padding: const EdgeInsets.only(top: 24.0),
             //   child: Row(children: [
             //     ContainerDecorated(borderRadius: 30,color: Colors.indigo.withOpacity(0.1),child: Icon(Icons.edit,color: Colors.indigo,size: 18,),onTap: (){
             //       Get.to(()=>CreateProductScreen(name: controller.list[index].name,image: controller.list[index].image,description: controller.list[index].description,highlight: controller.list[index].highlight,origin: controller.list[index].origin,tips: controller.list[index].tips,additionalInfo: controller.list[index].additionalInfo,price: controller.list[index].price.toString(),discountedPrice: controller.list[index].discountedPrice.toString(),mainCategoryId: controller.list[index].mainCategory.toString(),categoryId: controller.list[index].category.toString(),variantId: controller.list[index].variant.toString(),brandId: controller.list[index].brand!=null?controller.list[index].brand['id']:"",brand: controller.list[index].brand!=null?controller.list[index].brand['name']:"",));
             //     },),
             //     SizedBox(width: 8,),
             //     ContainerDecorated(borderRadius: 30,color: Colors.red.withOpacity(0.1),child: Icon(Icons.delete,color: Colors.red,size: 18,),onTap: () async {
             //       controller.deleteProduct(index);
             //     },),
             //   ],),
             // )

            ],),onTap: (){
              // Get.to(()=>ProductReviewScreen(name: controller.list[index].name,image: controller.list[index].image,description: controller.list[index].description??"",price: "${controller.list[index].price??""}",discountedPrice: "${controller.list[index].discountedPrice??""}",highlight: controller.list[index].highlight??"",origin: controller.list[index].highlight,tips: controller.list[index].tips,additionalInfo: controller.list[index].additionalInfo,mainCategoryId: controller.list[index].mainCategory.toString(),mainCategory: "",categoryId: controller.list[index].category.toString(),category: "",variantId: controller.list[index].variant==null?"":controller.list[index].variant.toString(),variant: "",brand: controller.list[index].brand==null?"":controller.list[index].brand['name'],brandId: controller.list[index].brand==null?"":controller.list[index].brand['id'],));
            },)

        );
      }),
    ],);
  }
}
