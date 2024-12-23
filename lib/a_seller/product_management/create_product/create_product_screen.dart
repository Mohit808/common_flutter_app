import 'dart:async';
import 'package:common_flutter_app/common_function/select_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../product_review_screen.dart';
import 'controller_create_product.dart';


class CreateProductScreen extends StatelessWidget {
  CreateProductScreen({super.key, this.image, this.origin, this.name, this.highlight, this.discountedPrice, this.price, this.mainCategory, this.mainCategoryId, this.category, this.categoryId, this.variant, this.variantId, this.brand, this.brandId, this.description, this.tips, this.additionalInfo});

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
    return GetBuilder(init: ControllerCreateProduct(name: name,image: image,description: description,highlight: highlight,origin: origin,tips: tips,additionalInfo: additionalInfo,price: price,discountedPrice: discountedPrice,mainCategoryId: mainCategory,categoryId: category,variantId: variant,brandId: brand,brand: brand,),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(leading:
          InkWell(onTap: (){
            if(controller.index== -1){
              Get.back();
            }
            controller.index--;
            controller.update();
          },child: const Icon(Icons.arrow_back_ios)),
            title: "Inventory Management",color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding: AppPaddings.paddingAll16,
              child: Form(key: controller.formKey,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  controller.index==-1? nameWidget(controller):
                  controller.index==0? imageWidget(controller):
                  controller.index==1?descriptionWidget(controller):
                  controller.index==2?catVariantWidget(controller):
                  controller.index==3?additionalInfoWidget(controller):

                  const Text("No Page")
                ],),
              ),
            ),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "Next",tap: (){
              controller.increaseIndex();
            },),
          ],
        );
      }
    );
  }

  Timer? _debounce;

  _onSearchChanged(String query,ControllerCreateProduct controller) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      // do something with query
      print("XXXXX : $query");
      controller.searchProduct();

    });
  }

  Widget nameWidget(ControllerCreateProduct controller){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        TextFieldWithHeadingMolecule(controller: controller.textEditingControllerName,heading: "Product name",hintText: "Enter name",colorMandatoryString: Colors.red,mandatoryString: "*",fontWeightHeading: FontWeight.w600,suffixIcon: controller.apiResponseSearch.status==Status.LOADING? Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 18,width: 18,child: CircularProgressIndicator(strokeWidth: 3,color: AppColors.primary,)),
          ],
        ):SizedBox(),validator: (value){
          if(value!.isEmpty) return "Enter name";
          return null;
        },onChanged: (value){
          controller.update();
          _onSearchChanged(value.toString(),controller);
          // Future.delayed(Duration(seconds: 1)).then((onValue){
          //   print(DateTime.now().millisecond);
          // });

        },),

        SizedBox(height: 16,),
        controller.textEditingControllerName.text.isNotEmpty?SizedBox():ContainerDecorated(padding: 16,borderRadius: 150,colorBorder: AppColors.primary.withOpacity(0.09),color: AppColors.scaffoldBackgroundColor,child: ContainerDecorated(padding: 16,borderRadius: 150,colorBorder: AppColors.primary.withOpacity(0.3),color: AppColors.scaffoldBackgroundColor,child: ContainerDecorated(padding: 16,borderRadius: 100,colorBorder: AppColors.primary,color: AppColors.scaffoldBackgroundColor,child: ContainerDecorated(padding: 16,borderRadius: 100,color: AppColors.primary,child: ContainerDecorated(color: AppColors.primary.withOpacity(0.8),borderRadius: 100,padding: 24,child: Icon(Icons.mic,size: 36,color: Colors.white,)))))),

        controller.textEditingControllerName.text.isEmpty?SizedBox():ContainerDecorated(padding: 16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            SmallText(text: controller.textEditingControllerName.text,fontWeight: FontWeight.w600,),
            SizedBox(height: 16,),
            ButtonSingleAtom(widget: "Add This Product",tap: (){
              controller.increaseIndex();
            },),
          ],),
        ),

        controller.textEditingControllerName.text.isEmpty?SizedBox():Column(children: [
          SizedBox(height: 24,),
          controller.listSearch.isEmpty?SizedBox():HeaderWithLineWidget(text: "Similer Product",),
          SizedBox(height: 16,),
          ListView.builder(itemCount: controller.listSearch.length,physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemBuilder: (itemBuilder,index){
            return Padding(
                padding:  EdgeInsets.only(bottom: 16.0),
                child:
                ContainerDecorated(elevation: 1,borderRadius: 15,color: Colors.white,padding: 8,child: Row(children: [
                  ContainerDecorated(padding: 0,child: NetworkOrAssetImage(src: controller.listSearch[index].image!,height: 50,width: 50,)),
                  const SizedBox(width: 8,),
                  Expanded(flex: 3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SmallText(text: "${controller.listSearch[index].name}",fontWeight: FontWeight.w500,),
                      SizedBox(height: 4,),
                      SmallText(text: "3 pieces/10g",color: Colors.grey,fontWeight: FontWeight.w500,),
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          controller.listSearch[index].discountedPrice==null?SizedBox():SmallText(text: "₹${controller.listSearch[index].price}",color: Colors.grey,fontWeight: FontWeight.w600,textDecoration: TextDecoration.lineThrough,),
                          SizedBox(width: controller.listSearch[index].discountedPrice==null?0:16,),
                          SmallText(text: "₹${controller.listSearch[index].discountedPrice==null?controller.listSearch[index].price:controller.listSearch[index].discountedPrice}",fontWeight: FontWeight.w600,),
                        ],
                      ),
                    ],
                  )),
                  ContainerDecorated(borderRadius: 30,color: Colors.green,child: Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 16,)),

                ],),onTap: (){
                  Get.to(()=>ProductReviewScreen(name: controller.listSearch[index].name,image: controller.listSearch[index].image,description: controller.listSearch[index].description??"",price: "${controller.listSearch[index].price??""}",discountedPrice: "${controller.listSearch[index].discountedPrice??""}",highlight: controller.listSearch[index].highlight??"",origin: controller.listSearch[index].highlight,tips: controller.listSearch[index].tips,additionalInfo: controller.listSearch[index].additionalInfo,mainCategoryId: controller.listSearch[index].mainCategory.toString(),mainCategory: "",categoryId: controller.listSearch[index].category.toString(),category: "",variantId: controller.listSearch[index].variant==null?"":controller.listSearch[index].variant.toString(),variant: "",brand: controller.listSearch[index].brand==null?"":controller.listSearch[index].brand['name'],brandId: controller.listSearch[index].brand==null?"":controller.listSearch[index].brand['id'],));
                },)

            );
          }),

        ],)
      ],),
    );
  }

  Widget imageWidget(ControllerCreateProduct controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      Row(
        children: [
          SmallText(text: "Featured Image",fontWeight: FontWeight.w600,),
          SizedBox(width: 4,),
          SmallText(text: "*",color: AppColors.primary,),
        ],
      ),
      SizedBox(height: 12,),
      ContainerDecorated(padding: 0,height: MediaQuery.of(Get.context!).size.width-32,child: Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
        controller.mainImage==null?
        Icon(Icons.add,size: 50,): NetworkOrAssetImage(borderRadius: 10,height: MediaQuery.of(Get.context!).size.width-34,width: MediaQuery.of(Get.context!).size.width-34,src: "${controller.mainImage}",isFile: controller.mainImage!.startsWith("http")?null:true,fit: BoxFit.cover,)
      ],),),onTap: (){
        showModalBottomSheet(showDragHandle: true,context: Get.context!, builder: (builder){
          return SelectImage();
        }).then((onValue){
          if(onValue!=null){
            controller.mainImage=onValue;
            controller.update();
          }

        });
      },),
      const SizedBox(height: 16,),
      const Row(children: [
        Expanded(child: ContainerDecorated(height: 80,child: Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.add)
        ],),),)),
        SizedBox(width: 16),
        Expanded(child: ContainerDecorated(height: 80,child: Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.add)
        ],),),)),
        SizedBox(width: 16),
        Expanded(child: ContainerDecorated(height: 80,child: Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.add)
        ],),),)),
        SizedBox(width: 16),
        Expanded(child: ContainerDecorated(height: 80,child: Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Icon(Icons.add)
        ],),),)),
      ],),
      const SizedBox(height: 24,),
      Row(children: [
        Icon(Icons.info_outline,size: 20,color: AppColors.primary,),
        SizedBox(width: 12,),
        SmallText(text: "Upload eye catching image to increase engagement",color: AppColors.primary,)
      ],)
    ],);
  }
  Widget descriptionWidget(ControllerCreateProduct controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerDescription,heading: "Description",hintText: "Enter description of product",colorMandatoryString: Colors.red,mandatoryString: "*",fontWeightHeading: FontWeight.w600,maxLines: 8,validator: (value){
        if(value!.isEmpty) return "Enter description";
        return null;
      },),
      const SizedBox(height: 16,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerHighlights,heading: "Highlights",hintText: "Enter highlights to stand out from crowd",colorMandatoryString: Colors.grey,mandatoryString: "(optional)",fontWeightHeading: FontWeight.w600,maxLines: 3,),
      const SizedBox(height: 8,),
      TextFieldWithHeadingMolecule(keyboardType: TextInputType.number,controller: controller.textEditingControllerPrice,heading: "Price",hintText: "Enter price",colorMandatoryString: Colors.red,mandatoryString: "*",fontWeightHeading: FontWeight.w600,validator: (value){
        if(value!.isEmpty) return "Enter price";
        return null;
      },),
      const SizedBox(height: 8,),
      TextFieldWithHeadingMolecule(keyboardType: TextInputType.number,controller: controller.textEditingControllerDiscountedPrice,heading: "Discounted price",hintText: "Enter discounted price",colorMandatoryString: Colors.grey,mandatoryString: "(optional)",fontWeightHeading: FontWeight.w600,),
    ],);
  }

  Widget catVariantWidget(ControllerCreateProduct controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      const Row(
        children: [
          SmallText(text: "Featured Main Category",fontWeight: FontWeight.w600,),
          SizedBox(width: 8,),
          SmallText(text: "(optional)",fontWeight: FontWeight.w600,color: Colors.grey,),
        ],
      ),
      SizedBox(height: 8,),
      InkWell(onTap: (){
        if(controller.list.isEmpty){
          showToast("No data found");
          return;
        }
        showModalBottomSheet(isScrollControlled: true,context: Get.context!,showDragHandle: true, builder: (builder){
          return bottomSheet(a: 1,controller: controller,listId: controller.list.map((toElement)=>toElement.id).toList(),listImage: controller.list.map((toElement)=>toElement.image).toList(),
              listName: controller.list.map((toElement)=>toElement.name).toList(),listDescription: controller.list.map((toElement)=>toElement.description).toList(),
              selectedIndex: controller.selectedMainCategoryId,selectedName: controller.selectedMainCategory);
        });
      },
        child: ContainerDecorated(colorBorder: Colors.grey,color: controller.selectedMainCategoryId.value.isNotEmpty?AppColors.primary.withOpacity(0.06):AppColors.scaffoldBackgroundColor,padding: 12,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          SmallText(text: controller.selectedMainCategoryId.isEmpty?"Select":controller.list[controller.list.indexWhere((test)=>test.id.toString()==controller.selectedMainCategoryId.value)].name!),
          controller.loadingMainCat?SizedBox(height: 24,width: 24,child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.primary,)):Icon(Icons.arrow_drop_down_rounded,color: Colors.black54,)
        ],),),
      ),
      controller.selectedMainCategoryId.value.isEmpty?SizedBox():
      Column(children: [
        SizedBox(height: 16,),

        const Row(
          children: [
            SmallText(text: "Category",fontWeight: FontWeight.w600,),
            SizedBox(width: 8,),
            SmallText(text: "(optional)",fontWeight: FontWeight.w600,color: Colors.grey,),
          ],
        ),

        SizedBox(height: 8,),

        InkWell(onTap: (){
          if(controller.listCategory.isEmpty){
            showToast("No data found");
            return;
          }
          showModalBottomSheet(isScrollControlled: true,context: Get.context!,showDragHandle: true, builder: (builder){
            // return bottomSheet(controller: controller,listId: [1,2],listImage: ["",""],listName: ["AMit","qw"],listDescription: ["as","dd"],selectedIndex: controller.selectedCategoryId);
            return bottomSheet(a: 2,controller: controller,
                listId: controller.listCategory.map((toElement)=>toElement.data!.map((toElement)=>toElement.id).toList()).toList().expand((toElements)=>toElements).toList(),
                listImage: controller.listCategory.map((toElement)=>toElement.data!.map((toElement)=>toElement.image).toList()).toList().expand((toElements)=>toElements).toList(),
                listName:controller.listCategory.map((toElement)=>toElement.data!.map((toElement)=>toElement.name).toList()).toList().expand((toElements)=>toElements).toList(),
                listDescription: controller.listCategory.map((toElement)=>toElement.data!.map((toElement)=>toElement.description).toList()).toList().expand((toElements)=>toElements).toList(),
                selectedIndex: controller.selectedCategoryId,selectedName: controller.selectedCategory);
          });
        },
          child: ContainerDecorated(colorBorder: Colors.grey,color:  controller.selectedCategoryId.value.isNotEmpty?AppColors.primary.withOpacity(0.06):AppColors.scaffoldBackgroundColor,padding: 12,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            SmallText(text: controller.selectedCategoryId.isEmpty?"Select":
            controller.listCategory.expand((item) => item.data ?? []).firstWhere((category) => category.id.toString() == controller.selectedCategoryId.value, orElse: () => null,)?.name
            ),
            controller.loadingCategory?SizedBox(height: 24,width: 24,child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.primary,)):Icon(Icons.arrow_drop_down_rounded,color: Colors.black54,)
          ],),),
        ),
      ],),

      controller.selectedCategoryId.value.isEmpty?SizedBox():Column(children: [
        SizedBox(height: 16,),
        const Row(
          children: [
            SmallText(text: "Variant",fontWeight: FontWeight.w600,),
            SizedBox(width: 8,),
            SmallText(text: "(optional)",fontWeight: FontWeight.w600,color: Colors.grey,),
          ],
        ),
        SizedBox(height: 8,),

        InkWell(onTap: (){
          print(controller.listVariants.length);
          if(controller.listVariants.isEmpty){
            showToast("No data found");
            return;
          }else{
            showModalBottomSheet(isScrollControlled: true,context: Get.context!,showDragHandle: true, builder: (builder){
              return bottomSheet(a: 3,controller: controller,
                  listId: controller.listVariants.map((toElement)=>toElement.data!.map((toElement)=>toElement.id).toList()).toList().expand((toElements)=>toElements).toList(),
                  listImage: controller.listVariants.map((toElement)=>toElement.data!.map((toElement)=>toElement.image).toList()).toList().expand((toElements)=>toElements).toList(),
                  listName:controller.listVariants.map((toElement)=>toElement.data!.map((toElement)=>toElement.name).toList()).toList().expand((toElements)=>toElements).toList(),
                  listDescription: controller.listVariants.map((toElement)=>toElement.data!.map((toElement)=>toElement.description).toList()).toList().expand((toElements)=>toElements).toList(),
                  selectedIndex: controller.selectedVariantId,selectedName: controller.selectedVariant);
            });
          }
        },
          child: ContainerDecorated(colorBorder: Colors.grey,color:  controller.selectedVariantId.value.isNotEmpty?AppColors.primary.withOpacity(0.06):AppColors.scaffoldBackgroundColor,padding: 12,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            SmallText(text: controller.selectedVariantId.isEmpty?"Select":
            // controller.list[controller.list.indexWhere((test)=>test.id.toString()==controller.selectedVariantId.value)].name!
            controller.listVariants.expand((item) => item.data ?? []).firstWhere((category) => category.id.toString() == controller.selectedVariantId.value, orElse: () => null,)?.name

            ),
            controller.loadingVariant?SizedBox(height: 24,width: 24,child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.primary,)):Icon(Icons.arrow_drop_down_rounded,color: Colors.black54,)
          ],),),
        ),
      ],),
      SizedBox(height: 16,),

      const Row(
        children: [
          SmallText(text: "Brand",fontWeight: FontWeight.w600,),
          SizedBox(width: 8,),
          SmallText(text: "(optional)",fontWeight: FontWeight.w600,color: Colors.grey,),
        ],
      ),

      SizedBox(height: 8,),
      InkWell(onTap: (){
        if(controller.listBrands.isEmpty){
          showToast("No data found");
          return;
        }
        showModalBottomSheet(isScrollControlled: true,context: Get.context!,showDragHandle: true, builder: (builder){
          return bottomSheet(a: 4,controller: controller,
              listId: controller.listBrands.map((toElement)=>toElement.data!.map((toElement)=>toElement.id).toList()).toList().expand((toElements)=>toElements).toList(),
              listImage: controller.listBrands.map((toElement)=>toElement.data!.map((toElement)=>toElement.image).toList()).toList().expand((toElements)=>toElements).toList(),
              listName: controller.listBrands.map((toElement)=>toElement.data!.map((toElement)=>toElement.name).toList()).toList().expand((toElements)=>toElements).toList(),
              listDescription: controller.listBrands.map((toElement)=>toElement.data!.map((toElement)=>toElement.description).toList()).toList().expand((toElements)=>toElements).toList(),
              selectedIndex: controller.selectedBrandId,selectedName: controller.selectedBrand);
        });
      },
        child: ContainerDecorated(colorBorder: Colors.grey,color:  controller.selectedBrandId.value.isNotEmpty?AppColors.primary.withOpacity(0.06):AppColors.scaffoldBackgroundColor,padding: 12,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          SmallText(text: controller.selectedBrandId.isEmpty?"Select":
          controller.listBrands.expand((item) => item.data ?? []).firstWhere((category) => category.id.toString() == controller.selectedBrandId.value, orElse: () => null,)?.name

            // controller.list[controller.list.indexWhere((test)=>test.id.toString()==controller.selectedVariantId.value)].name!
          ),
          controller.loadingBrand?SizedBox(height: 24,width: 24,child: CircularProgressIndicator(strokeWidth: 2,color: AppColors.primary,)):Icon(Icons.arrow_drop_down_rounded,color: Colors.black54,)
        ],),),
      ),

      // SizedBox(height: 16,),
      //
      // const Row(
      //   children: [
      //     SmallText(text: "Tags",fontWeight: FontWeight.w600,),
      //     SizedBox(width: 8,),
      //     SmallText(text: "(optional)",fontWeight: FontWeight.w600,color: Colors.grey,),
      //   ],
      // ),
      // const SizedBox(height: 8,),
      // const UserSelect(),
      // SizedBox(height: 8,),
      // Wrap(children: [
      //   for(var x in ["Dal","Sabji","Roti"])
      //     Padding(
      //       padding: const EdgeInsets.only(top: 8.0,right: 8,bottom: 8),
      //       child: ContainerDecorated(padding: 8,child: Row(mainAxisSize: MainAxisSize.min,
      //         children: [
      //           SmallText(text: x),
      //           const SizedBox(width: 8,),
      //           const Icon(Icons.close,size: 16,)
      //         ],
      //       ),),
      //     )
      // ],),
      // const SizedBox(height: 200,)
    ],);
  }


  Widget additionalInfoWidget(ControllerCreateProduct controller){
    return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerOrigin,heading: "Origin of product",hintText: "Enter place name",colorMandatoryString: Colors.grey,mandatoryString: "(optional)",fontWeightHeading: FontWeight.w600,),
      SizedBox(height: 16,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerTips,heading: "Tips to handle or store",hintText: "e.g. store in cool and dry place",colorMandatoryString: Colors.grey,mandatoryString: "(optional)",fontWeightHeading: FontWeight.w600,maxLines: 4,),
      SizedBox(height: 8,),
      TextFieldWithHeadingMolecule(controller: controller.textEditingControllerAdditionalInfo,heading: "Additional info",hintText: "Enter product info",colorMandatoryString: Colors.grey,mandatoryString: "(optional)",fontWeightHeading: FontWeight.w600,maxLines: 8,),
    ],);
  }

  bottomSheet({required ControllerCreateProduct controller, required List listId, required List listImage, required List listName, required List listDescription, required RxString selectedIndex,required RxString selectedName,required int a}){
    return Padding(
      padding: AppPaddings.paddingAll16,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

        const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            NormalHeadingText(text: "Choose main category"),
            SmallText(text: "1/3",fontWeight: FontWeight.w500,color: Colors.black54,)
          ],
        ),
        const SizedBox(height: 4,),
        const SmallText(text: "Select to start organize your content",color: Colors.black54,fontWeight: FontWeight.w500,),
        const SizedBox(height: 16,),
        TextFieldCommon(hintText: "Search here",prefixIcon: const Icon(Icons.search),),
        const SizedBox(height: 16,),
        Expanded(
          child:  ListView.builder(shrinkWrap: true,itemCount: listId.length,itemBuilder: (itemBuilder,index){
            return Padding(
              padding:  EdgeInsets.symmetric(vertical: 8.0),
              child: InkWell(onTap: (){
                selectedIndex.value=listId[index].toString();
                selectedName.value=listName[index].toString();
                if(a==1) {
                  controller.selectedCategoryId.value="";
                  controller.selectedVariantId.value="";
                  controller.fetchCategory();
                }
                if(a==2) {
                  controller.selectedVariantId.value="";
                  controller.fetchVariant();
                }
                controller.update();
                Get.back();
              },
                  child: Obx(()=> ContainerDecorated(padding: 10,color: AppColors.scaffoldBackgroundColor,colorBorder: selectedIndex.value=="${listId[index]}"? AppColors.primary:Colors.grey.shade300,child: Row(
                    children: [
                      NetworkOrAssetImage(src: "${listImage[index]}",height: 50,width: 50,borderRadius: 10,),
                      SizedBox(width: 16,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        SmallText(text: "${listName[index]}",fontWeight: FontWeight.w600,),
                        SizedBox(height: 4,),
                        SmallText(text: "${listDescription[index]}"),
                      ],),
                    ],
                  ),),
                  )
              ),
            );
          }),
        ),
        Row(children: [
          // Expanded(child: SizedBox()),
          // Expanded(child: SizedBox()),
          Expanded(child: ButtonSingleAtom(widget: "Cancel",color: Colors.grey.shade200,colorText: Colors.black87,tap: (){Get.back();},)),
          const SizedBox(width: 16,),
          Expanded(child: ButtonSingleAtom(widget: "Select",tap: (){
            Get.back();
          },)),
        ],)
      ],),
    );
  }

}
