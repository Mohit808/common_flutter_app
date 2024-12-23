import 'dart:convert';

import 'package:common_flutter_app/utils/app_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/models/model_x.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/network_handling/network_manager.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../common_widgets/item_widget.dart';
import '../../models/home_model.dart';
import 'package:http/http.dart' as http;


class ControllerCart extends GetxController{
  List<Data> list=[];
  List listTips=[
    "₹5",
    "₹10",
    "₹20",
    "₹30",
    "Other"
  ];
  RxString selectedTip=''.obs;
  String tipValue="";
  TextEditingController textEditingController=TextEditingController();

  @override
  void onInit() {
    super.onInit();

    mapCart.forEach((key,value){
      Data data=Data.fromJson(value['item']);
      list.add(data);
    });
  }


  showTipsDialog(){

    showModalBottomSheet(showDragHandle: true,isScrollControlled: true,context: Get.context!, builder: (builder){
      return Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Obx(()=>Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
            SizedBox(height: 8,),
            NormalHeadingText(text: "A small tip goes a long way"),
            SizedBox(height: 8,),
            SmallText(text: "Encourage the delivery person for recognising their efforts.",color: AppColors.primary,),
            SizedBox(height: 16,),
            Wrap(children: [
              for(var x in listTips)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: InkWell(onTap: (){
                    selectedTip.value=x;
                    tipValue=GetUtils.numericOnly(x);
                  },child: ContainerDecorated(color: selectedTip.value==x?AppColors.primary: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade400,child: SmallText(text: x,color:  selectedTip.value==x?Colors.white:null,fontWeight: FontWeight.w600,),paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 10),)),
                ),
            ],),

            SizedBox(height: 16,),
            selectedTip.value!="Other"?SizedBox(): TextFieldCommon(hintText: "Enter Tip Amount",controller: textEditingController,keyboardType: TextInputType.number,inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
            ],onChanged: (value){
              tipValue=value;
            },),

            SizedBox(height: 100,),
            SmallText(text: "${selectedTip.value} Delivery charge",fontWeight: FontWeight.w800,letterSpacing: 0.8,),
            SizedBox(height: 16,),
            ButtonSingleAtom(widget: "Pay Now",color: Colors.green,tap: (){
              Get.back();
              createOrder();
            },)
          ],),)
        ),
      );
    });
  }

  createOrder() async {

    try{
      showLoading();
      var res=await NetworkManager().post(AppConst.createOrders,contentJson: true,data: jsonEncode({
        "product":list.map((toElement)=>toElement.id).toList(),
        "qty":list.map((toElement)=>mapCart[toElement.id]['qty']).toList(),
        "store":list.map((toElement)=>toElement.store).toList(),
        // "customer":"1",
        "address_type":"Home",
        "address_title":"addr",
        "full_address":"full_address",
        "house_no":"house_no",
        "area":"area",
        "landmark":"landmark",
        "instruction":"instruction",
        "latitude":"23.00",
        "longitude":"72.00",
        "tip":tipValue
      }));

      closeLoading();
      ModelX modelX=ModelX.fromJson(res);

      if(modelX.status==200){
        showToastSuccess(modelX.message);
        list=[];
        mapCart.clear();
        // mapCartDetail.clear();
        update();
        return;
      }
      showToastError(modelX.message);
    }catch(e){
      print(e);
      showToastError("$e");
      closeLoading();
    }
  }
}