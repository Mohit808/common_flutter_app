// import 'package:common_flutter_app/common_function/time_ago.dart';
// import 'package:common_flutter_app/common_widgets/common_tab_bar/tab_bar_common.dart';
// import 'package:common_flutter_app/common_widgets/order_common_molecule/order_page_common.dart';
// import 'package:common_flutter_app/screens/orders/order_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modular_ui_package/common_functions/image_network.dart';
// import 'package:modular_ui_package/common_widget/appbar_common.dart';
// import 'package:modular_ui_package/common_widget/button_single_atom.dart';
// import 'package:modular_ui_package/common_widget/container_decorated.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
// import 'package:modular_ui_package/common_widget/textfield_atom.dart';
// import 'package:modular_ui_package/text_atoms/text_common.dart';
// import 'package:modular_ui_package/theme/app_colors.dart';
// import 'package:modular_ui_package/theme/app_paddings.dart';
// import 'package:modular_ui_package/utils/network_handling/api_response.dart';
//
// import '../a_share_wheels/share_wheel_order_history.dart';
// import '../common_function/launch_urls/launch_urls.dart';
// import 'orders/controller_seller_order.dart';
//
// class OrderManagementScreen extends StatefulWidget {
//   const OrderManagementScreen({super.key});
//
//   @override
//   State<OrderManagementScreen> createState() => _OrderManagementScreenState();
// }
//
// class _OrderManagementScreenState extends State<OrderManagementScreen> {
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerSellerOrder(),
//       builder: (controller) {
//         return Scaffold(
//           appBar: AppBarCommon(title: "Order Management",elevation: 0,color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,),
//           body:
//               // true?OrderScreen():
//           SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//                 TabBarCommon(changeTab: ({int? selectedTab}){controller.changeBarFunction(selectedTab);}),
//                 SizedBox(height: 16,),
//                 OrderPageCommon()
//                 // controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,paddingTop: 100,):
//                 // controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,paddingTop: 100,):
//                 // controller.list.isEmpty?NoDataWidget(center: true,paddingTop: 100,):
//                 // ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
//                 //   return Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //     ContainerDecorated(colorBorder: Colors.grey.shade300,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //       ContainerDecorated(padding: 8,color: Colors.green.withOpacity(0.1),
//                 //         child: Row(children: [
//                 //           // NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,),
//                 //           SizedBox(width: 16,),
//                 //           Expanded(
//                 //             child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 //               children: [
//                 //                 SmallText(text: "${controller.list[index].customer!.customerName}",fontWeight: FontWeight.w800,maxLine: 1,overflow: TextOverflow.ellipsis,),
//                 //                 SizedBox(height: 4,),
//                 //                 Row(
//                 //                   children: [
//                 //                     SmallText(text: "${controller.list.length} Item | ₹ ${calculate(controller, index)}",color: Colors.green,fontWeight: FontWeight.w700,),
//                 //                     SizedBox(width: 8,),
//                 //                     InkWell(onTap: (){
//                 //                       showFullOrder=!showFullOrder;
//                 //                       setState(() {
//                 //                       });
//                 //                     },child: !showFullOrder?Icon(Icons.keyboard_arrow_down,color: AppColors.primary,):Icon(Icons.keyboard_arrow_up_rounded,color: Colors.green,))
//                 //                   ],
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //           ),
//                 //           // ContainerDecorated(padding: 8,color: AppColors.primary.withOpacity(0.1),child: SmallText(text: "Ordered",color: AppColors.primary,fontWeight: FontWeight.w600,))
//                 //         ],),
//                 //       ),
//                 //       // SizedBox(height: 8,),
//                 //       showFullOrder? controller.list[index].orderItem==null?SizedBox():Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //           ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: controller.list[index].orderItem!.length,itemBuilder: (itemBuilder,index){
//                 //             return Padding(
//                 //               padding: const EdgeInsets.all(8.0),
//                 //               child: Row(
//                 //                 children: [
//                 //                   ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,)),
//                 //                   SizedBox(width: 16,),
//                 //                   Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 //                     children: [
//                 //                       SmallText(text: "${controller.list[index].orderItem![index].productName}",fontWeight: FontWeight.w600,),
//                 //                       SizedBox(height: 4,),
//                 //                       Row(
//                 //                         children: [
//                 //                           SmallText(text: "${controller.list[index].orderItem![index].price!=null ? controller.list[index].orderItem![index].price:""}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54,textDecoration: TextDecoration.lineThrough,),
//                 //                           SmallText(text: "₹ ${controller.list[index].orderItem![index].discountedPrice!=null?controller.list[index].orderItem![index].discountedPrice:controller.list[index].orderItem![index].price}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54),
//                 //                           SizedBox(width: 16,),
//                 //                           SmallText(text: "x${controller.list[index].orderItem![index].qty}",color: Colors.green,fontWeight: FontWeight.bold,),
//                 //                         ],
//                 //                       ),
//                 //                     ],
//                 //                   ),
//                 //                 ],
//                 //               ),
//                 //             );
//                 //           })
//                 //       ],):SizedBox(),
//                 //
//                 //       // Row(
//                 //       //   children: [
//                 //       //     Expanded(
//                 //       //       child: showFullOrder?SizedBox():Wrap(children: [
//                 //       //         for (int x=0;x<3;x++)
//                 //       //           Padding(
//                 //       //             padding: const EdgeInsets.all(4.0),
//                 //       //             child: Stack(
//                 //       //               children: [
//                 //       //                 Padding(
//                 //       //                   padding: const EdgeInsets.all(4.0),
//                 //       //                   child: ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "",height: 40,width: 40,)),
//                 //       //                 ),
//                 //       //                 Positioned(bottom: 0,right: 0,child: SmallText(text: "x2",color: Colors.green,fontWeight: FontWeight.bold,)),
//                 //       //               ],
//                 //       //             ),
//                 //       //           ),
//                 //       //       ],),
//                 //       //     ),
//                 //       //     InkWell(onTap: (){
//                 //       //       showFullOrder=!showFullOrder;
//                 //       //       // controller.update();
//                 //       //     },child: ContainerDecorated(child: Icon(showFullOrder?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)))
//                 //       //   ],
//                 //       // ),
//                 //
//                 //
//                 //
//                 //       // const Divider(),
//                 //       // calculateMrp(controller,index)-calculate(controller, index)>0?Padding(
//                 //       //   padding: const EdgeInsets.all(8.0),
//                 //       //   child: Row(
//                 //       //     children: [
//                 //       //       SmallText(text: "Your Saved",fontWeight: FontWeight.w600,letterSpacing: 1,),
//                 //       //       NormalHeadingText(text: "  ₹${calculateMrp(controller,index)}",color: Colors.green,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                 //       //     ],
//                 //       //   ),
//                 //       // ):SizedBox(),
//                 //
//                 //       // Padding(
//                 //       //   padding: const EdgeInsets.all(8.0),
//                 //       //   child: Row(
//                 //       //     children: [
//                 //       //       SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
//                 //       //       NormalHeadingText(text: "  ₹ 50",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                 //       //     ],
//                 //       //   ),
//                 //       // ),
//                 //       // SizedBox(height: 8,),
//                 //       ContainerDecorated(colorBorder: Colors.grey.shade200,color: Colors.grey.shade50,padding: 8,
//                 //         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 //           children: [
//                 //             Row(
//                 //               children: [
//                 //                 NormalHeadingText(text: "OTP  : ",fontWeight: FontWeight.w500,size: 16,),
//                 //                 SizedBox(width: 8,),
//                 //                 NormalHeadingText(text: "${controller.list[index].otp}",fontWeight: FontWeight.w800,letterSpacing: 4,size: 16,),
//                 //               ],
//                 //             ),
//                 //
//                 //             Row(
//                 //               children: [
//                 //                 SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
//                 //                 NormalHeadingText(text: "  ₹ ${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                 //               ],
//                 //             ),
//                 //             SizedBox(height: 8,),
//                 //             // ContainerDecorated(padding: 8,color: AppColors.primary.withOpacity(0.1),child: SmallText(text: "Share your otp with delivery agent to complete your delivery.\nIf you have not received your order don't share otp",color: AppColors.primary,fontWeight: FontWeight.w600,size: 11,),),
//                 //             // SizedBox(height: 16,),
//                 //
//                 //
//                 //             // customRow("Status : ", "ordered",Colors.green),
//                 //             // SizedBox(height: 8,),
//                 //             // customRow("Order Id : ", "#5034",Colors.black),
//                 //             Divider(),
//                 //             Row(
//                 //               children: [
//                 //                 Expanded(flex: 1,
//                 //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //                     SmallText(text: "Order ID",fontWeight: FontWeight.w500,color: Colors.black54,),
//                 //                     SizedBox(height: 4,),
//                 //                     SmallText(text: "#${controller.list[index].id}",fontWeight: FontWeight.w600,),
//                 //                   ],),
//                 //                 ),
//                 //                 Expanded(flex: 1,
//                 //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //                     SmallText(text: "Time",fontWeight: FontWeight.w500,color: Colors.black54),
//                 //                     SizedBox(height: 4,),
//                 //                     SmallText(text: "${TimeAgo.timeAgo(controller.list[index].createdAt!)}",fontWeight: FontWeight.w600,),
//                 //                   ],),
//                 //                 ),
//                 //                 Expanded(flex:1,
//                 //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //                     SmallText(text: "Status",fontWeight: FontWeight.w500,color: Colors.black54),
//                 //                     SizedBox(height: 4,),
//                 //                     SmallText(text: "${controller.list[index].statusName}",fontWeight: FontWeight.w600,),
//                 //                   ],),
//                 //                 )
//                 //               ],
//                 //             ),
//                 //             // SizedBox(height: 8,),
//                 //             // customRow("Address : ","${controller.list[index].fullAddress}",Colors.black54),
//                 //             // SizedBox(height: 8,),
//                 //             // customRow("Time : ","1d ago",Colors.black54),
//                 //             SizedBox(height: 4,),
//                 //             Divider(),
//                 //             ContainerDecorated(colorBorder: Colors.transparent,color: Colors.transparent,padding:0,child: Row(
//                 //               children: [
//                 //                 Icon(Icons.location_on,size: 16,),
//                 //                 SizedBox(width: 16,),
//                 //                 Expanded(
//                 //                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //                     SmallText(text: "${controller.list[index].fullAddress}",fontWeight: FontWeight.w600,),
//                 //                     SizedBox(height: 4,),
//                 //                     SmallText(text: "Destination",size: 10,color: Colors.black54,),
//                 //                   ],),
//                 //                 ),
//                 //                 Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //                   SmallText(text: "Distance",color: Colors.black54,size: 10,),
//                 //                   SizedBox(height: 4,),
//                 //                   SmallText(text: "12Km",fontWeight: FontWeight.w600,),
//                 //                 ],),
//                 //               ],
//                 //             ),),
//                 //             Divider(),
//                 //             SizedBox(height: 8,),
//                 //
//                 //             // controller.list[index].deliveryPartner==null?const SizedBox():
//                 //             Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                 //               controller.list[index].deliveryPartner==null?SizedBox():Row(children: [
//                 //                 NetworkOrAssetImage(src: "${controller.list[index].deliveryPartner!.imageUrl}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
//                 //                 SizedBox(width: 16,),
//                 //                 Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                 //                   children: [
//                 //                     SmallText(text:"${controller.list[index].deliveryPartner!.name}",fontWeight: FontWeight.w700,),
//                 //                     SizedBox(height: 4,),
//                 //                     SmallText(text: "Delivery Partner",color: Colors.black54,fontWeight: FontWeight.w500,size: 10,),
//                 //                   ],
//                 //                 )),
//                 //                 SizedBox(width: 16,),
//                 //                 ContainerDecorated(onTap: (){
//                 //                   LaunchUrls().launchCall("${controller.list[index].deliveryPartner!.phoneNumber}");
//                 //                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.call,size: 18,)),
//                 //                 SizedBox(width: 16,),
//                 //                 ContainerDecorated(onTap: (){
//                 //                   LaunchUrls().launchSms("${controller.list[index].deliveryPartner!.phoneNumber}");
//                 //                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.message,size: 18,)),
//                 //               ],),
//                 //               controller.list[index].deliveryPartner==null?SizedBox():SizedBox(height: 16,),
//                 //
//                 //             ],),
//                 //             Row(
//                 //               children: [
//                 //                 ContainerDecorated(color: Colors.transparent,padding: 10,borderRadius: 30,child: Icon(Icons.insert_comment_rounded),),
//                 //                 SizedBox(width: 16,),
//                 //                 Expanded(child: ButtonSingleAtom(tap: (){
//                 //                 },widget: "View on map",color: Colors.transparent,colorText: Colors.black54,)),
//                 //                 SizedBox(width: 16,),
//                 //                 Expanded(child: ButtonSingleAtom(tap: (){},widget: "Cancel",colorText: Colors.red,color: Colors.transparent,)),
//                 //               ],
//                 //             ),
//                 //
//                 //           ],
//                 //         ),
//                 //       )
//                 //     ],),)
//                 //   ],);
//                 // })
//                 //
//               ],),
//             ),
//           ),
//         );
//       }
//     );
//   }
//
//   // customRow(heading,text,color){
//   //   return Row(
//   //     children: [
//   //       Expanded(flex: 1,child: SmallText(text: heading,color: Colors.black54,fontWeight: FontWeight.w600,)),
//   //       SizedBox(width: 16,),
//   //       SmallText(text: text,fontWeight: FontWeight.w600,color: color,),
//   //     ],
//   //   );
//   // }
// }
