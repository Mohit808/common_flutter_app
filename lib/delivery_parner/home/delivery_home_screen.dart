import 'package:common_flutter_app/common_function/time_ago.dart';
import 'package:common_flutter_app/common_widgets/order_common_molecule/order_page_common.dart';
import 'package:common_flutter_app/delivery_parner/home/controller_delivery_orders.dart';
import 'package:common_flutter_app/delivery_parner/login/delivery_login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_see_all_widget.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../a_seller/order_management_screen.dart';
import '../../a_seller/product_management/inventory/inventory_screen.dart';
import '../../a_seller/wallet/wallet_screen.dart';
import '../../common_function/launch_urls/launch_urls.dart';
import '../../screens/address/add_address_screen.dart';
import '../../utils/app_images.dart';
import '../../utils/utils.dart';
import 'delivery_order_screen.dart';

class DeliveryHomeScreen extends StatelessWidget {
  const DeliveryHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ControllerDeliveryOrders(),
      builder: (controller){
      return Scaffold(
        appBar:AppBarCommon(elevation: 0,title: Row(children: [
          ContainerDecorated(padding: 6,color: Color(0xFFBF360C),child: Column(children: [
            Icon(Icons.location_on,color: Colors.white,)
          ],),),
          SizedBox(width: 16,),
          Expanded(
            child: InkWell(onTap: (){
              Get.to(()=>AddAddressScreen())!.then((onValue){
                // if(onValue!=null) controller.update();
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
              Get.to(()=>DeliveryLoginScreen());
              // Get.to(()=>ProfileScreen(deliveryCount: controller.listDelivery.length,));
            },child: Icon(Icons.account_circle_rounded,size: 40,)),
            SizedBox(width: 16,)],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: AppPaddings.paddingAll16, child: onGoingDeliveryWidget(),),
              SizedBox(height: 8,),
              deliveryManagementWidget(),
              SizedBox(height: 24,),
              newOrdersWidget(controller)
            ],
          ),
        ),
      );
    },);
  }
  deliveryManagementWidget(){
    return Padding(
      padding: AppPaddings.paddingAll16,
      child: Column(children: [
        const HeaderWithLineWidget(text: "Delivery Management",),
        SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          ContainerDecorated(onTap: (){Get.to(()=> OrderScreenCommon(isDelivery: true,));},color: Colors.transparent,child: Column(children: [
            ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.orderManagement,height: 50,width: 50,)),
            SizedBox(height: 8,),
            SmallText(text: "Order\nManagement",fontWeight: FontWeight.w600,textAlign: TextAlign.center,)
          ],),),

          ContainerDecorated(onTap: (){Get.to(()=>InventoryScreen());},color: Colors.transparent,child: Column(children: [
            ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.inventoryManagement,height: 50,width: 50,)),
            SizedBox(height: 8,),
            SmallText(text: "Check\nmy status",fontWeight: FontWeight.w600,textAlign: TextAlign.center,)
          ],),),

          ContainerDecorated(color: Colors.transparent,child: Column(children: [
            ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.wallet,height: 50,width: 50,)),
            SizedBox(height: 8,),
            SmallText(text: "Wallet &\nPayment",fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
          ],),onTap: (){
            Get.to(()=>WalletScreen());
          },),

        ],),
      ],),
    );
  }
  newOrdersWidget(ControllerDeliveryOrders controller){
    return Column(children: [
      ContainerDecorated(paddingEdgeInsets: EdgeInsets.only(top: 16),linearGradient: LinearGradient( stops: [0.0,0.1,0.2,0.1,0.9],
          begin: FractionalOffset.topCenter,
          end: FractionalOffset.bottomCenter,
          colors: [
            Color(0xFFFFAF7A).withOpacity(0.1),
            Color(0xFFFFAF7A).withOpacity(0.08),
            Color(0xFFFFAF7A).withOpacity(0.05),
            Color(0xFFFFAF7A).withOpacity(0.03),
            Color(0xFFFFAF7A).withOpacity(0.01),
          ]),),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NormalHeadingText(text: "New Orders",fontWeight: FontWeight.w700,letterSpacing: 0.5,),
                SmallText(text: "Accept to for delivery"),
              ],
            ),
            NormalText(text: "See All",color: AppColors.primary,fontWeight: FontWeight.w600,)
          ],),
          ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                ContainerDecorated(elevation: 1,color: Colors.white,colorBorder: Colors.grey.shade300,child: Column(children: [

                  ContainerDecorated(padding: 8,colorBorder: Colors.grey.shade200,color: Colors.green.withOpacity(0.1),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    Row(children: [
                      NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].storeLogo}",height: 40,width: 40,),
                      SizedBox(width: 16,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: "${controller.list[index].storeName}",fontWeight: FontWeight.w800,maxLine: 1,overflow: TextOverflow.ellipsis,),
                          SizedBox(height: 4,),
                          SmallText(text: "${controller.list[index].orderItem!.length} Item ",color: Colors.green,fontWeight: FontWeight.w700,)
                        ],
                      ),
                    ],),
                  ],),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Row(children: [
                        Icon(Icons.map_outlined),
                        SizedBox(width: 16,),
                        SmallText(text: "${controller.list[index].storeAddress}",fontWeight: FontWeight.w600,),
                      ],),
                      SizedBox(height: 4,),
                      Row(children: [
                        Icon(Icons.pin_drop),
                        SizedBox(width: 16,),
                        SmallText(text: "${controller.list[index].addressTitle}",fontWeight: FontWeight.w500,letterSpacing: 0.2,),
                      ],),
                      SizedBox(height: 16,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        SmallText(text: "Customer",fontWeight: FontWeight.w700,letterSpacing: 1,),
                        SizedBox(height: 8,),
                        Row(children: [
                          NetworkOrAssetImage(src: "${controller.list[index].customerImage}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
                          SizedBox(width: 16,),
                          Expanded(child: SmallText(text:"${controller.list[index].customerName}",fontWeight: FontWeight.w800,)),
                          SizedBox(width: 16,),
                          ContainerDecorated(onTap: (){
                            LaunchUrls().launchCall("${controller.list[index].customerMobile}");
                          },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.call,size: 18,)),
                          SizedBox(width: 16,),
                          ContainerDecorated(onTap: (){
                            LaunchUrls().launchSms("${controller.list[index].customerMobile}");
                          },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.message,size: 18,))
                        ],),
                        SizedBox(height: 8,),
                        Row(
                          children: [
                            SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
                            NormalHeadingText(text: "  ₹${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
                            const Spacer(),
                            SmallText(text: TimeAgo.timeAgo(controller.list[index].createdAt!)),

                          ],
                        ),
                        SizedBox(height: 16,),


                      ],),

                      Row(children: [
                        Expanded(
                          child: ContainerDecorated(colorBorder: Colors.grey,color: Colors.white,padding: 8,
                            child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                              Icon(Icons.map),
                              SizedBox(width: 8,),
                              SmallText(text: "View on map",fontWeight: FontWeight.w600,)
                            ],),
                          ),
                        ),
                        SizedBox(width: 16,),
                        Expanded(child: ButtonSingleAtom(status: controller.apiResponseOrder.status,widget: "Accept",tap: (){
                          controller.orderFunction(index,1);
                        },))
                      ],)
                    ],),
                  )

                ],),)
              ],),
            );
          })

        ],),
      )
    ],);
  }
  Widget onGoingDeliveryWidget(){
    return ContainerDecorated(color: AppColors.primary,child: Row(children: [
      SizedBox(width: 16,),
      SmallText(text: "5 Ongoing Delivery",fontWeight: FontWeight.w800,color: Colors.white,),
      Spacer(),
      InkWell(onTap: (){
        Get.to(()=> OrderScreenCommon(isDelivery: true,));
        // Get.to(()=>const DeliveryOrderScreen());
        // Get.to(()=>const OrderScreen());
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
    ],),);
  }

}
