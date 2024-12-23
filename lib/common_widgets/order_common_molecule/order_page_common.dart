import 'package:common_flutter_app/common_widgets/order_common_molecule/controller_order_common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import '../../common_function/calculate_items_price.dart';
import '../../common_function/launch_urls/launch_urls.dart';
import '../../common_function/time_ago.dart';
import '../common_tab_bar/tab_bar_common.dart';

class OrderScreenCommon extends StatelessWidget {
  OrderScreenCommon({super.key, this.status, this.isCustomer, this.isDelivery, this.isStore});
  int? status;
  final bool? isCustomer;
  final bool? isDelivery;
  final bool? isStore;
  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerOrderCommon(status: status??0,isCustomer: isCustomer,isDelivery: isDelivery,isStore: isStore),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Order Management",elevation: 0,color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding:  const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(children: [
                ContainerDecorated(
                  child: Row(children: [
                    Expanded(child: ContainerDecorated(onTap: (){controller.changeBar(0);},color: controller.selectedTab==0?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "New",fontWeight: FontWeight.w600,color: controller.selectedTab==0?AppColors.primary:Colors.black54,textAlign: TextAlign.center,))),
                    Expanded(child: ContainerDecorated(onTap: (){controller.changeBar(1);},color: controller.selectedTab==1?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Ready to pick",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==1?AppColors.primary:Colors.black54,))),
                    Expanded(child: ContainerDecorated(onTap: (){controller.changeBar(2);},color: controller.selectedTab==2?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Ready to drop",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==2?AppColors.primary:Colors.black54,))),
                    Expanded(child: ContainerDecorated(onTap: (){controller.changeBar(3);},color: controller.selectedTab==3?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Completed",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==3?AppColors.primary:Colors.black54,))),

                  ],)
                ),
                const SizedBox(height: 16,),
                controller.apiResponse.status==Status.LOADING?const LoadingWidget(center: true,paddingTop: 100,):
                controller.apiResponse.status==Status.ERROR?const SomethingWentWrongWidget(center: true,paddingTop: 100,):
                controller.list.isEmpty?const NoDataWidget(center: true,paddingTop: 100,):
                ListView.builder(physics: const NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                  return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    ContainerDecorated(colorBorder: Colors.grey.shade300,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                      ContainerDecorated(padding: 8,color: Colors.green.withOpacity(0.1),
                        child: Row(children: [
                          // NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,),
                          const SizedBox(width: 16,),
                          Expanded(
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SmallText(text: "${controller.list[index].customer!.customerName}",fontWeight: FontWeight.w800,maxLine: 1,overflow: TextOverflow.ellipsis,),
                                const SizedBox(height: 4,),
                                Row(
                                  children: [
                                    SmallText(text: "${controller.list.length} Item | ₹ ${CalculateItemPrice().calculate(controller.list[index].orderItem!)}",color: Colors.green,fontWeight: FontWeight.w700,),
                                    const SizedBox(width: 8,),
                                    InkWell(onTap: (){
                                      controller.showFullOrder=index;
                                      controller.update();
                                    },child: controller.showFullOrder==index?Icon(Icons.keyboard_arrow_down,color: AppColors.primary,):const Icon(Icons.keyboard_arrow_up_rounded,color: Colors.green,))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // ContainerDecorated(padding: 8,color: AppColors.primary.withOpacity(0.1),child: SmallText(text: "Ordered",color: AppColors.primary,fontWeight: FontWeight.w600,))
                        ],),
                      ),
                      // SizedBox(height: 8,),
                      controller.showFullOrder==index? controller.list[index].orderItem==null?const SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                        ListView.builder(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),itemCount: controller.list[index].orderItem!.length,itemBuilder: (itemBuilder,index){
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: const NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,)),
                                const SizedBox(width: 16,),
                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(text: "${controller.list[index].orderItem![index].productName}",fontWeight: FontWeight.w600,),
                                    const SizedBox(height: 4,),
                                    Row(
                                      children: [
                                        SmallText(text: "${controller.list[index].orderItem![index].price!=null ? controller.list[index].orderItem![index].price:""}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54,textDecoration: TextDecoration.lineThrough,),
                                        SmallText(text: "₹ ${controller.list[index].orderItem![index].discountedPrice!=null?controller.list[index].orderItem![index].discountedPrice:controller.list[index].orderItem![index].price}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54),
                                        const SizedBox(width: 16,),
                                        SmallText(text: "x${controller.list[index].orderItem![index].qty}",color: Colors.green,fontWeight: FontWeight.bold,),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        })
                      ],):const SizedBox(),

                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: showFullOrder?SizedBox():Wrap(children: [
                      //         for (int x=0;x<3;x++)
                      //           Padding(
                      //             padding: const EdgeInsets.all(4.0),
                      //             child: Stack(
                      //               children: [
                      //                 Padding(
                      //                   padding: const EdgeInsets.all(4.0),
                      //                   child: ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,)),
                      //                 ),
                      //                 Positioned(bottom: 0,right: 0,child: SmallText(text: "x2",color: Colors.green,fontWeight: FontWeight.bold,)),
                      //               ],
                      //             ),
                      //           ),
                      //       ],),
                      //     ),
                      //     InkWell(onTap: (){
                      //       showFullOrder=!showFullOrder;
                      //       // controller.update();
                      //     },child: ContainerDecorated(child: Icon(showFullOrder?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)))
                      //   ],
                      // ),



                      // const Divider(),
                      // calculateMrp(controller,index)-calculate(controller, index)>0?Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       SmallText(text: "Your Saved",fontWeight: FontWeight.w600,letterSpacing: 1,),
                      //       NormalHeadingText(text: "  ₹${calculateMrp(controller,index)}",color: Colors.green,fontWeight: FontWeight.w600,letterSpacing: 1,),
                      //     ],
                      //   ),
                      // ):SizedBox(),

                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Row(
                      //     children: [
                      //       SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
                      //       NormalHeadingText(text: "  ₹ 50",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
                      //     ],
                      //   ),
                      // ),
                      // SizedBox(height: 8,),
                      ContainerDecorated(colorBorder: Colors.grey.shade200,color: Colors.grey.shade50,padding: 8,
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const NormalHeadingText(text: "OTP  : ",fontWeight: FontWeight.w500,size: 16,),
                                const SizedBox(width: 8,),
                                NormalHeadingText(text: "${controller.list[index].otp}",fontWeight: FontWeight.w800,letterSpacing: 4,size: 16,),
                              ],
                            ),

                            Row(
                              children: [
                                SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
                                NormalHeadingText(text: "  ₹ ${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
                              ],
                            ),
                            const SizedBox(height: 8,),
                            // ContainerDecorated(padding: 8,color: AppColors.primary.withOpacity(0.1),child: SmallText(text: "Share your otp with delivery agent to complete your delivery.\nIf you have not received your order don't share otp",color: AppColors.primary,fontWeight: FontWeight.w600,size: 11,),),
                            // SizedBox(height: 16,),


                            // customRow("Status : ", "ordered",Colors.green),
                            // SizedBox(height: 8,),
                            // customRow("Order Id : ", "#5034",Colors.black),
                            const Divider(),
                            Row(
                              children: [
                                Expanded(flex: 1,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    const SmallText(text: "Order ID",fontWeight: FontWeight.w500,color: Colors.black54,),
                                    const SizedBox(height: 4,),
                                    SmallText(text: "#${controller.list[index].id}",fontWeight: FontWeight.w600,),
                                  ],),
                                ),
                                Expanded(flex: 1,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    const SmallText(text: "Time",fontWeight: FontWeight.w500,color: Colors.black54),
                                    const SizedBox(height: 4,),
                                    SmallText(text: "${TimeAgo.timeAgo(controller.list[index].createdAt!)}",fontWeight: FontWeight.w600,),
                                  ],),
                                ),
                                Expanded(flex:1,
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    const SmallText(text: "Status",fontWeight: FontWeight.w500,color: Colors.black54),
                                    const SizedBox(height: 4,),
                                    SmallText(text: "${controller.list[index].statusName}",fontWeight: FontWeight.w600,),
                                  ],),
                                )
                              ],
                            ),
                            // SizedBox(height: 8,),
                            // customRow("Address : ","${controller.controller.list[index].fullAddress}",Colors.black54),
                            // SizedBox(height: 8,),
                            // customRow("Time : ","1d ago",Colors.black54),
                            const SizedBox(height: 4,),
                            const Divider(),
                            ContainerDecorated(colorBorder: Colors.transparent,color: Colors.transparent,padding:0,child: Row(
                              children: [
                                Column(children: [
                                  Icon(Icons.arrow_circle_down_rounded,size: 16,color: Colors.blue,),
                                  SizedBox(height: 36,),
                                  Icon(Icons.location_on,size: 16,),
                                ],),


                                SizedBox(width: 16,),
                                Expanded(
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                    SmallText(text: "456 Elm Street, Springfield",fontWeight: FontWeight.w600,),
                                    SizedBox(height: 4,),
                                    SmallText(text: "Pickup point",size: 10,color: Colors.black54,),
                                    SizedBox(height: 24,),
                                    SmallText(text: "${controller.list[index].fullAddress}",fontWeight: FontWeight.w600,),
                                    SizedBox(height: 4,),
                                    SmallText(text: "Destination",size: 10,color: Colors.black54,),
                                  ],),
                                ),

                                Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                  SmallText(text: "Payment",color: Colors.black54,size: 10,),
                                  SizedBox(height: 4,),
                                  ContainerDecorated(color: Colors.green.withOpacity(0.1),child: SmallText(color: Colors.green,text: "₹ 12",fontWeight: FontWeight.w600,)),
                                  SizedBox(height: 16,),
                                  SmallText(text: "Distance",color: Colors.black54,size: 10,),
                                  SizedBox(height: 4,),
                                  SmallText(text: "12Km",fontWeight: FontWeight.w600,),
                                ],),
                                // const Icon(Icons.location_on,size: 16,),
                                // const SizedBox(width: 16,),
                                // Expanded(
                                //   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                //     SmallText(text: "${controller.list[index].fullAddress}",fontWeight: FontWeight.w600,),
                                //     const SizedBox(height: 4,),
                                //     const SmallText(text: "Destination",size: 10,color: Colors.black54,),
                                //   ],),
                                // ),
                                // const Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                //   SmallText(text: "Distance",color: Colors.black54,size: 10,),
                                //   SizedBox(height: 4,),
                                //   SmallText(text: "12Km",fontWeight: FontWeight.w600,),
                                // ],),
                              ],
                            ),),
                            const Divider(),
                            const SizedBox(height: 8,),

                            // controller.controller.list[index].deliveryPartner==null?const SizedBox():
                            Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                              controller.list[index].deliveryPartner==null?const SizedBox():Row(children: [
                                NetworkOrAssetImage(src: "${controller.list[index].deliveryPartner!.imageUrl}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
                                const SizedBox(width: 16,),
                                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SmallText(text:"${controller.list[index].deliveryPartner!.name}",fontWeight: FontWeight.w700,),
                                    const SizedBox(height: 4,),
                                    const SmallText(text: "Delivery Partner",color: Colors.black54,fontWeight: FontWeight.w500,size: 10,),
                                  ],
                                )),
                                const SizedBox(width: 16,),
                                ContainerDecorated(onTap: (){
                                  LaunchUrls().launchCall("${controller.list[index].deliveryPartner!.phoneNumber}");
                                },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: const Icon(Icons.call,size: 18,)),
                                const SizedBox(width: 16,),
                                ContainerDecorated(onTap: (){
                                  LaunchUrls().launchSms("${controller.list[index].deliveryPartner!.phoneNumber}");
                                },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: const Icon(Icons.message,size: 18,)),
                              ],),
                              controller.list[index].deliveryPartner==null?const SizedBox():const SizedBox(height: 16,),

                            ],),

                            controller.selectedTab==3?SizedBox():Row(
                              children: [
                                const ContainerDecorated(color: Colors.transparent,padding: 10,borderRadius: 30,child: Icon(Icons.insert_comment_rounded),),
                                // const SizedBox(width: 16,),
                                Expanded(child: ButtonSingleAtom(tap: (){
                                },widget: "View on map",color: Colors.transparent,colorText: Colors.black54,)),
                                // const SizedBox(width: 16,),
                                isDelivery!=null&&controller.selectedTab==0?SizedBox():Expanded(child: ButtonSingleAtom(tap: (){},widget: "Cancel",colorText: Colors.red,color: Colors.transparent,)),
                                isDelivery!=null && controller.selectedTab==0?Expanded(child: ButtonSingleAtom(tap: (){controller.changeOrderStatus(index, 1);},widget: "Accept",colorText: Colors.green,color: Colors.transparent,)):SizedBox(),
                                isDelivery!=null && controller.list[index].status==1?Expanded(child: ButtonSingleAtom(status: controller.apiResponseOrder.status,tap: (){controller.changeOrderStatus(index, 2);},widget: "Pickup",colorText: Colors.green,color: Colors.green.withOpacity(0.1),)):SizedBox(),
                                isDelivery!=null && controller.list[index].status==2?Expanded(child: ButtonSingleAtom(status: controller.apiResponseOrder.status,tap: (){controller.changeOrderStatus(index, 3);},widget: "Drop",colorText: Colors.green,color: Colors.green.withOpacity(0.1),)):SizedBox(),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],),)
                  ],);
                })

              ],),
            ),
          ),
        );
      }
    );
  }
}
