import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../../data_source/data_sourc_main_category.dart';
import '../../../models/categories_model.dart';
import '../../../models/variant_model.dart' as variantsX;
import '../../../models/category_model.dart' as categoryX;
import '../../../models/brand_model.dart' as brandX;
import '../../../models/home_model.dart' as searchX;
import '../../../utils/app_const.dart';
import '../product_review_screen.dart';

class ControllerCreateProduct extends GetxController{


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
  ControllerCreateProduct( {this.name,this.image,this.description,this.price,this.discountedPrice,this.highlight,this.origin,this.tips,this.additionalInfo,this.mainCategory,this.variant,this.category,this.brand,this.mainCategoryId, this.categoryId, this.variantId, this.brandId,});


  int index=-1;
  // RxString selectedMainCategory="".obs;
  RxString selectedMainCategoryId="".obs;
  RxString selectedMainCategory="".obs;
  RxString selectedCategoryId="".obs;
  RxString selectedCategory="".obs;
  RxString selectedVariantId="".obs;
  RxString selectedVariant="".obs;
  RxString selectedBrandId="".obs;
  RxString selectedBrand="".obs;
  String? mainImage;
  bool debounce=false;

  // RxString selectedMainCategory="".obs;
  // String selectedMainCategoryId="";
  GlobalKey<FormState> formKey=GlobalKey();
  TextEditingController textEditingControllerName=TextEditingController();
  TextEditingController textEditingControllerDescription=TextEditingController();
  TextEditingController textEditingControllerHighlights=TextEditingController();
  TextEditingController textEditingControllerPrice=TextEditingController();
  TextEditingController textEditingControllerDiscountedPrice=TextEditingController();
  TextEditingController textEditingControllerOrigin=TextEditingController();
  TextEditingController textEditingControllerTips=TextEditingController();
  TextEditingController textEditingControllerAdditionalInfo=TextEditingController();

  ApiResponse<CategoriesModel> apiResponse=ApiResponse(status: Status.LOADING);
  ApiResponse<searchX.Data> apiResponseSearch=ApiResponse(status: Status.INITIAL);
  List<Data> list=[];
  List<searchX.Data> listSearch=[];
  List<categoryX.CategoryModel> listCategory=[];
  List<variantsX.VariantModel> listVariants=[];
  List<brandX.BrandModel> listBrands=[];
  bool loadingMainCat=false;
  bool loadingCategory=false;
  bool loadingVariant=false;
  bool loadingBrand=false;

  @override
  void onInit() {
    super.onInit();
    fetchMainCategory();
    fetchBrand();
    setData();
  }

  setData(){
    textEditingControllerName.text=name??"";
    textEditingControllerDescription.text=description??"";
    textEditingControllerHighlights.text=highlight??"";
    textEditingControllerPrice.text=price??"";
    textEditingControllerDiscountedPrice.text=discountedPrice??"";
    textEditingControllerTips.text=tips??"";
    textEditingControllerOrigin.text=origin??"";
    textEditingControllerAdditionalInfo.text=additionalInfo??"";
    if(image!=null && image!.isNotEmpty) mainImage=image;
    if(mainCategoryId!=null && mainCategoryId!.isNotEmpty) selectedMainCategoryId.value=mainCategoryId!;
    if(categoryId!=null && categoryId!.isNotEmpty) selectedCategoryId.value=categoryId!;
    if(variantId!=null && variantId!.isNotEmpty) selectedVariantId.value=variantId!;
    if(brandId!=null && brandId!.isNotEmpty) selectedBrandId.value=brandId!;
  }
  increaseIndex(){
    if(!formKey.currentState!.validate()) return;
    if(index==0 && mainImage==null) {
      showToast("Select Feature Image");
      return;
    }
    if(index==3){
      Get.to(()=>ProductReviewScreen(name: textEditingControllerName.text,image: mainImage,description: textEditingControllerDescription.text,highlight: textEditingControllerHighlights.text,price: textEditingControllerPrice.text,discountedPrice: textEditingControllerDiscountedPrice.text,origin: textEditingControllerOrigin.text,tips: textEditingControllerTips.text,additionalInfo: textEditingControllerAdditionalInfo.text,mainCategory: selectedMainCategory.value,category: selectedCategory.value,brand: selectedBrand.value,variant: selectedVariant.value,mainCategoryId: selectedMainCategoryId.value,categoryId: selectedCategoryId.value,variantId: selectedVariantId.value,brandId: selectedBrandId.value,))!.then((onValue){
        Get.back(result: onValue);
      });
      return;
    }
    index++;
    update();
  }
  fetchMainCategory() async {
    loadingMainCat=true;
    update();
    apiResponse=await DatasourceMainCategory().getData();
    if(apiResponse.status==Status.COMPLETED){
      list.addAll(apiResponse.data!.data!);
    }
    loadingMainCat=false;
    update();
  }
  fetchCategory() async {
    listCategory=[];
    loadingCategory=true;
    update();
    var res=await NetworkManager().get("${AppConst.getCategory}/${selectedMainCategoryId.value}");
    categoryX.CategoryModel categoryModel=categoryX.CategoryModel.fromJson(res);
    if(categoryModel.data!.isNotEmpty){
      listCategory.add(categoryModel);
    }
    loadingCategory=false;
    update();

  }
  fetchVariant() async {
    listVariants=[];
    loadingVariant=true;
    update();
    var res=await NetworkManager().get("${AppConst.getVariants}/${selectedCategoryId.value}");
    print(res);

    variantsX.VariantModel variantModel=variantsX.VariantModel.fromJson(res);
    if(variantModel.data!.isNotEmpty){
      listVariants.add(variantModel);
    }
    print(listVariants.length);
    loadingVariant=false;
    update();
  }
  fetchBrand() async {
    listBrands=[];
    loadingBrand=true;
    update();
    var res=await NetworkManager().get(AppConst.getBrands);
    print(res);

    brandX.BrandModel brandModel=brandX.BrandModel.fromJson(res);
    if(brandModel.data!.isNotEmpty){
      listBrands.add(brandModel);
    }
    print(listBrands.length);
    loadingBrand=false;
    update();
  }

  searchProduct() async {
    listSearch=[];
    try{
      apiResponseSearch=ApiResponse(status: Status.LOADING);
      update();
      var res=await NetworkManager().get("${AppConst.getProducts}?search=${textEditingControllerName.text}");
      searchX.HomeModel homeModel=searchX.HomeModel.fromJson(res);
      apiResponseSearch=ApiResponse(status: Status.COMPLETED,message: homeModel.message);
      listSearch.addAll(homeModel.data!);
    }catch(e){
      apiResponse=ApiResponse(status: Status.ERROR,message:"$e");
    }
    update();
  }
}