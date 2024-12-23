import 'package:common_flutter_app/models/home_model.dart';
import 'package:common_flutter_app/screens/home/controller_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/slider_dot_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import 'controller_review_product.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key, this.origin, this.name, this.highlight, this.image, this.discountedPrice, this.price, this.brand, this.category, this.mainCategory, this.description, this.tips, this.additionalInfo, this.variant, this.mainCategoryId, this.categoryId, this.variantId, this.brandId});
  final String? image;
  final String? origin;
  final String? name;
  final String? highlight;
  final String? discountedPrice;
  final String? price;
  final String? mainCategory;
  final String? mainCategoryId;
  final String? category;
  final String? categoryId;
  final String? variant;
  final String? variantId;
  final String? brand;
  final String? brandId;
  final String? description;
  final String? tips;
  final String? additionalInfo;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerReviewProduct(name: name,image: image,description: description,discountedPrice: discountedPrice,additionalInfo: additionalInfo,brand: brandId,category: categoryId,highlight: highlight,mainCategory: mainCategoryId,origin: origin,price: price,tips: tips,variant: variantId),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            appBar: AppBarCommon(centerTitle: false,title: "Product Review",elevation: 0,color: Colors.white,titleColor: Colors.black54,
              actions: [
                Icon(Icons.share),SizedBox(width: 16,)],
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  ContainerDecorated(color: Colors.white,padding: 16,
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(child: ContainerDecorated(color: Colors.transparent,colorBorder: Colors.grey.shade200,child: NetworkOrAssetImage(src:"$image",fit: BoxFit.fitWidth,))),
                              ],
                            ),
                            Container(padding: EdgeInsets.all(4),child: SmallText(text: "16 %\nOFF",size: 10,fontWeight: FontWeight.w600,color: Colors.white,),decoration: BoxDecoration(color: AppColors.primary,borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),),
                          ],
                        ),
                        SizedBox(height: 8,),
                        SliderDotWidget(index: 0, length: 3),
                        SizedBox(height: 16,),
                        origin!.isEmpty ||origin==null?SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SmallText(text: "${origin}",color: Colors.grey,fontWeight: FontWeight.w800,),
                            SizedBox(height: 8,),
                            Divider(),
                          ],
                        ),
                        SizedBox(height: 8,),
                        HeadingText(text: "${name}",fontWeight: FontWeight.w700,),
                        SizedBox(height:  highlight==null || highlight!.isEmpty?0:8,),
                        highlight==null || highlight!.isEmpty ?SizedBox() :SmallText(text: highlight!,color: Colors.grey,fontWeight: FontWeight.w700,),
                        SizedBox(height: 16,),
                        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            NormalText(text: "1 Piece",fontWeight: FontWeight.w700,color: Colors.grey,),
                            SizedBox(height: 4,),
                            Row(
                              children: [
                                NormalText(text: discountedPrice==null?"₹${price}":"₹${discountedPrice}",fontWeight: FontWeight.w700,),
                                SizedBox(width: 8,),
                                SmallText(text:  discountedPrice==null?"":"₹${price}",textDecoration: TextDecoration.lineThrough,fontWeight: FontWeight.w600,color: Colors.grey,),
                              ],
                            ),
                          ],),

                          // ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade200,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 36),child: Center(child: NormalText(text: "ADD",color: Colors.green,fontWeight: FontWeight.bold,)),)
                          SizedBox(width: 100, child: Row(
                            children: [
                              // AddToCartBarWidget(id: data.id,controller: controller,item: data,),
                            ],
                          ))

                        ],),

                        // brand==null && category==null && mainCategory==null?SizedBox():  Column(children: [
                        //   SizedBox(height: 16,),
                        //   Divider(),
                        //   Row(children: [
                        //     ContainerDecorated(borderRadius: 20,color: AppColors.primary.withOpacity(0.1),child: Icon(Icons.add_business_rounded,color: AppColors.primary,size: 20,)),
                        //     SizedBox(width: 8,),
                        //     Expanded(child:
                        //     brand!=null?SmallText(text: "Explore all ${brand} items",fontWeight: FontWeight.w600,size: 13,):
                        //     category!=null?SmallText(text: "Explore all ${category} Category items",fontWeight: FontWeight.w600,size: 13,):
                        //     mainCategory!=null?SmallText(text: "Explore all ${brand} Category items",fontWeight: FontWeight.w600,size: 13,):
                        //     SizedBox()
                        //     ),
                        //     Icon(Icons.arrow_forward_ios_rounded,size: 16,color: AppColors.primary,)
                        //   ],)
                        // ],)
                      ],
                    ),
                  ),
                  SizedBox(height: 16,),
                  ContainerDecorated(width: double.infinity,padding: 16,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Description",fontWeight: FontWeight.w800,color: Colors.black87,),
                    SizedBox(height: 8,),
                    SmallText(text: "${description}",fontWeight: FontWeight.w600,color: Colors.black54,),
                    SizedBox(height: 16,),
                    SmallText(text: "+ Show More",color: AppColors.primary,fontWeight: FontWeight.w800,),
                    SizedBox(height: 8,),
                    tips==null || tips!.isEmpty?SizedBox() : Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Divider(),
                      SizedBox(height: 8,),
                      SmallText(text: "Storage tips",fontWeight: FontWeight.w800,color: Colors.black87,),
                      SizedBox(height: 8,),
                      SmallText(text: tips??"Store at room temperature until ripe, then put it in the refrigerator uncovered. The ideal temperature is 55°F, but it can be stored between 50-59°F. A whole watermelon can stay fresh for up to two weeks at room temperature.",color: Colors.black54,fontWeight: FontWeight.w600,)

                    ],),
                  ],),),


                  SizedBox(height: 16,),
                  ContainerDecorated(padding: 16,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Seller Details",fontWeight: FontWeight.w800,color: Colors.black87,),
                    SizedBox(height: 8,),
                    SmallText(text: """Amazon Global Store by Amazon Export Sales, LLC.202, Assotech Business Cresterra, Tower-4, Sector 135,""",fontWeight: FontWeight.w600,color: Colors.grey,),
                    SizedBox(height: 16,),
                    SmallText(text: "+ Show More",color: AppColors.primary,fontWeight: FontWeight.w800,),
                  ],),),

                  SizedBox(height: 16,),
                  additionalInfo==null || additionalInfo!.isEmpty?SizedBox():  ContainerDecorated(width: double.infinity,padding: 16,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Important Information",fontWeight: FontWeight.w600,color: Colors.black87,),
                    SizedBox(height: 8,),
                    SmallText(text: "${additionalInfo}",fontWeight: FontWeight.w600,color: Colors.grey,),
                    SizedBox(height: 16,),
                    SmallText(text: "+ Show More",color: AppColors.primary,fontWeight: FontWeight.w800,),
                  ],),),

                  SizedBox(height: 16,),
                  // additionalInfo==null || additionalInfo!.isEmpty?SizedBox():

                  mainCategory==null && category ==null && variant ==null ?SizedBox():
                  mainCategory!.isEmpty && category!.isEmpty && variant!.isEmpty ?SizedBox():
                  ContainerDecorated(width: double.infinity,padding: 16,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text: "Product Category",fontWeight: FontWeight.w600,color: Colors.black87,),
                    SizedBox(height: 8,),
                    SmallText(text: "${mainCategory}",fontWeight: FontWeight.w600,color: Colors.grey,),
                    SizedBox(height: 4,),
                    category==null?SizedBox():category!.isEmpty?SizedBox():SmallText(text: "Category : ${category}",fontWeight: FontWeight.w600,color: Colors.grey,),
                    SizedBox(height: 4,),
                    variant==null?SizedBox():variant!.isEmpty?SizedBox():SmallText(text: "Variant : ${variant}",fontWeight: FontWeight.w600,color: Colors.grey,),
                    SizedBox(height: 16,),
                  ],),),

                  SizedBox(height: 100,)
                ],),
              ),
            ),
            persistentFooterButtons: [
              ButtonSingleAtom(status: controller.apiResponse.status,widget: "Publish",tap: (){
                if(controller.apiResponse.status!=Status.LOADING){
                  controller.publishProduct();
                }
              },)
            ],
          );
        }
    );
  }
}
