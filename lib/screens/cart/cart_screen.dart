import 'package:common_flutter_app/common_function/calculate_cart_amount.dart';
import 'package:common_flutter_app/common_widgets/item_widget.dart';
import 'package:common_flutter_app/common_widgets/plus_minus_widget.dart';
import 'package:common_flutter_app/dashboard_screen.dart';
import 'package:common_flutter_app/screens/cart/controller_cart.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/billing_widget.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/cart_item_widget.dart';
import 'package:modular_ui_package/common_widget/clear_cart_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../utils/utils.dart';
import '../address/add_address_screen.dart';
import '../auth/login_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerCart(),
      builder: (controller) {
        print(GetUtils.numericOnly(controller.selectedTip.value).isEmpty);
        CalculateCartAmount.calculateMrp();
        CalculateCartAmount.calculate();
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: AppBarCommon(elevation: 0,color:Colors.white,title: ClearCartWidget(hideClearBtn: controller.list.isEmpty?true:null,),),
          body:
              controller.list.isEmpty?
          Column(
            children: [
              Lottie.asset(AppImages.emptyCart),
              NormalHeadingText(text: "Your cart is empty"),
              Padding(
                padding: AppPaddings.paddingAll16,
                child: ButtonSingleAtom(tap: (){
                  selectedIndexDashboard.value=0;
                },widget: Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Shop Now",color: Colors.white,fontWeight: FontWeight.w600,),
                    SizedBox(width: 8,),
                    Icon(Icons.arrow_forward,color: Colors.white,size: 16,)
                  ],
                ),),
              )
            ],
          ):
          SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
              InkWell(onTap: (){
                Get.to(()=>AddAddressScreen())!.then((onValue){
                  if(onValue!=null) controller.update();
                });
              },
                child: Container(padding: EdgeInsets.all(16),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(24),bottomRight: Radius.circular(24))),
                  child: Row(children: [
                    box.read(AppUtils.addressTitle)=="Home"?Icon(Icons.home,size: 18,color: AppColors.primary,):box.read(AppUtils.addressTitle)=="Work"?Icon(Icons.work,size: 18,color: AppColors.primary,):SizedBox(),
                    const SizedBox(width: 4,),
                    Expanded(
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        Row(
                          children: [
                            HeadingText(text: "${box.read(AppUtils.addressTitle)}",fontWeight: FontWeight.w800,size: 14,color: Colors.black,),
                            SizedBox(width: 8,),
                            ContainerDecorated(height: 16,width: 1,color: Colors.black54,),
                            SizedBox(width: 8,),
                            Expanded(child: NormalText(text: "${ box.read(AppUtils.fullAddress)}",color: Colors.grey,size: 14,overflow: TextOverflow.ellipsis,)),
                            Icon(Icons.keyboard_arrow_down,size: 20,)
                          ],
                        ),

                      ],),
                    )
                  ],),
                ),
              ),

             Padding(
               padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
               child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                 SizedBox(height: 16,),
                 NormalText(text: "Review Items",fontWeight: FontWeight.w700,),
                 SizedBox(height: 8,),
                 ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                   return Padding(
                     padding:  EdgeInsets.only(bottom: 8.0),
                     child: CartItemWidget(
                       storeName: controller.list[index].storeName,
                       plusMinus: PlusMinusWidget(controller: controller,removeId: (value){
                       print(value);
                       var index=controller.list.indexWhere((test)=>test.id==value);
                       if(index!= -1){
                         controller.list.removeAt(index);
                       }
                     },id: controller.list[index].id,),name: controller.list[index].name,image: controller.list[index].image,discountedPrice: controller.list[index].discountedPrice,price: controller.list[index].price,),
                   );
                 }),
                 SizedBox(height: 16,),
                 NormalText(text: "Bill Details",fontWeight: FontWeight.w700,),
                 SizedBox(height: 8,),
                 BillingWidget(mrpTotal: CalculateCartAmount.totalMrp,itemSaving: CalculateCartAmount.totalMrp-CalculateCartAmount.totalAmount,totalPayable: CalculateCartAmount.totalAmount,)
               ],),
             )
            ],),
          ),
          persistentFooterButtons:  controller.list.isEmpty?null:[
            Row(children: [
              Expanded(flex: 1,child: Column(
                children: [
                  SmallText(text: "${mapCart.keys.length} Items",color: Colors.black54,),
                  const SizedBox(height: 4,),
                  NormalText(text: "₹${CalculateCartAmount.totalAmount}",color: Colors.green,fontWeight: FontWeight.w700,),
                ],
              )),

              Expanded(flex: 3,child: ButtonSingleAtom(widget: "Pay Now",color: Colors.green,tap: (){
                if(token.isEmpty) return Get.to(()=>LoginScreen());
                // SignUpScreen();
                // if(token.isEmpty) return Get.to(()=>DeliveryLoginScreen());
                controller.showTipsDialog();
              },),)
            ],),
          ],
        );
      }
    );
  }
}
