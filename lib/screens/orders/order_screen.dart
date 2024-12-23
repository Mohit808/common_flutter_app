// import 'package:common_flutter_app/common_function/launch_urls/launch_urls.dart';
// import 'package:common_flutter_app/common_function/time_ago.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import 'package:modular_ui_package/common_functions/image_network.dart';
// import 'package:modular_ui_package/common_widget/appbar_common.dart';
// import 'package:modular_ui_package/common_widget/button_single_atom.dart';
// import 'package:modular_ui_package/common_widget/container_decorated.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
// import 'package:modular_ui_package/text_atoms/text_common.dart';
// import 'package:modular_ui_package/theme/app_colors.dart';
// import 'package:modular_ui_package/theme/app_paddings.dart';
// import 'package:modular_ui_package/utils/network_handling/api_response.dart';
// import 'controller_order.dart';
//
// class OrderScreen extends StatelessWidget {
//   const OrderScreen({super.key});
//
//   calculate(ControllerOrder controller,index){
//     List<double> list=controller.list[index].orderItem!.map((toElement)=>toElement.qty!.toInt()* (double.parse(toElement.discountedPrice??toElement.price!))).toList();
//     num sum = list.reduce((a, b) => a + b);
//     return sum;
//   }
//   calculateMrp(ControllerOrder controller,index0){
//     List<double> list=controller.list[index].orderItem!.map((toElement)=>toElement.qty!.toInt()* (double.parse(toElement.price!))).toList();
//     num sum = list.reduce((a, b) => a + b);
//     return sum;
//   }
//   changeTab({required ControllerOrder controller, required int selectedTab, required int status}){
//     controller.selectedTab=selectedTab;
//     controller.apiResponse=ApiResponse(status: Status.LOADING);
//     controller.list=[];
//     controller.update();
//     controller.fetchData(status: status);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerOrder(),
//       builder: (controller) {
//         return Scaffold(
//           // backgroundColor: Colors.grey.shade200,
//           appBar: AppBarCommon(title: "Orders",elevation: 0,titleColor: Colors.black,color: Colors.white,),
//           body:
//             SingleChildScrollView(child:Column(children: [
//               ContainerDecorated(marginEdgeInsets: EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(children: [
//                   Expanded(child: ContainerDecorated(onTap: (){changeTab(controller: controller,selectedTab: 0,status: 0);},color: controller.selectedTab==0?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "New",fontWeight: FontWeight.w600,color: controller.selectedTab==0?AppColors.primary:Colors.black54,textAlign: TextAlign.center,))),
//                   Expanded(child: ContainerDecorated(onTap: (){changeTab(controller: controller,selectedTab: 1,status: 1);},color: controller.selectedTab==1?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "Ongoing",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==1?AppColors.primary:Colors.black54,))),
//                   Expanded(child: ContainerDecorated(onTap: (){changeTab(controller: controller,selectedTab: 2,status: 3);},color: controller.selectedTab==2?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: NormalHeadingText(text: "Completed",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==2?AppColors.primary:Colors.black54,))),
//
//                 ],),
//               ),
//               // SizedBox(height: 16,),
//
//               controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,):
//               controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,msg: controller.apiResponse.message,):
//               controller.list.isEmpty?NoDataWidget(center: true,):
//               ListView.builder(shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
//                 return Padding(
//                   padding: AppPaddings.paddingAll16,
//                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//
//                     ContainerDecorated(colorBorder: Colors.grey.shade200,color: Colors.white,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//
//                       Column(
//                         children: [
//                           ContainerDecorated(padding: 8,color: controller.list[index].status==0? Colors.green.withOpacity(0.1):null,
//                             child: Row(children: [
//                               NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].storeLogo}",height: 40,width: 40,),
//                               SizedBox(width: 16,),
//                               Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   SmallText(text: "${controller.list[index].storeName}",fontWeight: FontWeight.w800,maxLine: 1,overflow: TextOverflow.ellipsis,),
//                                   SizedBox(height: 4,),
//                                   SmallText(text: "${controller.list[index].orderItem!.length} Item | ₹${calculate(controller,index)}",color: Colors.green,fontWeight: FontWeight.w700,)
//                                 ],
//                               ),
//                             ],),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 8,),
//                       controller.showFullOrder? Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                         for (int x=0;x<controller.list[index].orderItem!.length;x++)
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               children: [
//                                 ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].orderItem![x].productImage}",height: 40,width: 40,)),
//                                 SizedBox(width: 16,),
//                                 Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SmallText(text: "${controller.list[index].orderItem![x].productName}",fontWeight: FontWeight.w600,),
//                                     SizedBox(height: 4,),
//                                     Row(
//                                       children: [
//                                         SmallText(text: controller.list[index].orderItem![x].discountedPrice==null?"":"₹${controller.list[index].orderItem![x].price}  ",fontWeight: FontWeight.w700,size: 13,color: Colors.black54,textDecoration: TextDecoration.lineThrough,),
//                                         SmallText(text: "₹${controller.list[index].orderItem![x].discountedPrice??controller.list[index].orderItem![x].price}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54),
//                                         SizedBox(width: 16,),
//                                         SmallText(text: "x${controller.list[index].orderItem![x].qty}",color: Colors.green,fontWeight: FontWeight.bold,),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           )
//                       ],):SizedBox(),
//
//                       ContainerDecorated(
//                         child: Row(
//                           children: [
//                             Expanded(
//                               child: controller.showFullOrder?SizedBox():Wrap(children: [
//                                 for (int x=0;x<controller.list[index].orderItem!.length;x++)
//                                   Padding(
//                                     padding: const EdgeInsets.all(0.0),
//                                     child: Stack(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(0.0),
//                                           child: ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].orderItem![x].productImage}",height: 40,width: 40,)),
//                                         ),
//                                         Positioned(bottom: 0,right: 0,child: SmallText(text: "x${controller.list[index].orderItem![x].qty}",color: Colors.green,fontWeight: FontWeight.bold,)),
//                                       ],
//                                     ),
//                                   ),
//                               ],),
//                             ),
//                             InkWell(onTap: (){
//                               controller.showFullOrder=!controller.showFullOrder;
//                               controller.update();
//                             },child: Icon(Icons.keyboard_arrow_down_rounded)
//                               // ContainerDecorated(child: Icon(controller.showFullOrder?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down))
//                             )
//                           ],
//                         ),
//                       ),
//
//
//
//                       // const Divider(height: 4,),
//                       calculateMrp(controller,index)-calculate(controller, index)>0?Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Row(
//                           children: [
//                             SmallText(text: "Your Saved",fontWeight: FontWeight.w600,letterSpacing: 1,),
//                             NormalHeadingText(text: "  ₹${calculateMrp(controller,index)}",color: Colors.green,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                           ],
//                         ),
//                       ):SizedBox(),
//
//                       // controller.list[index].tip!>0?Padding(
//                       //   padding: const EdgeInsets.all(8.0),
//                       //   child: Row(
//                       //     children: [
//                       //       SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
//                       //       NormalHeadingText(text: "  ₹${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                       //     ],
//                       //   ),
//                       // ):SizedBox(),
//                       // SizedBox(height: 8,),
//                       ContainerDecorated(color: Colors.grey.shade50,padding: 8,
//                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 NormalHeadingText(text: "OTP  : ",fontWeight: FontWeight.w500,size: 16,),
//                                 SizedBox(width: 8,),
//                                 NormalHeadingText(text: "${controller.list[index].otp}",fontWeight: FontWeight.w800,letterSpacing: 4,size: 16,),
//                               ],
//                             ),
//
//                             controller.list[index].tip!>0?Row(
//                               children: [
//                                 SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
//                                 NormalHeadingText(text: "  ₹${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                               ],
//                             ):SizedBox(),
//                             SizedBox(height: 8,),
//                             Divider(),
//                             // ContainerDecorated(padding: 8,color: AppColors.primary.withOpacity(0.1),child: SmallText(text: "Share your otp with delivery agent to complete your delivery.\nIf you have not received your order don't share otp",color: AppColors.primary,fontWeight: FontWeight.w600,),),
//                             // SizedBox(height: 16,),
//
//                             Row(
//                               children: [
//                                 Expanded(flex: 1,
//                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                                     SmallText(text: "Order ID",fontWeight: FontWeight.w500,color: Colors.black54,),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "#${controller.list[index].id}",fontWeight: FontWeight.w600,),
//                                   ],),
//                                 ),
//                                 Expanded(flex: 1,
//                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                                     SmallText(text: "Time",fontWeight: FontWeight.w500,color: Colors.black54),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "${TimeAgo.timeAgo(controller.list[index].createdAt!)}",fontWeight: FontWeight.w600,),
//                                   ],),
//                                 ),
//                                 Expanded(flex:1,
//                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                                     SmallText(text: "Status",fontWeight: FontWeight.w500,color: Colors.black54),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "${controller.list[index].statusName}",fontWeight: FontWeight.w600,),
//                                   ],),
//                                 )
//                               ],
//                             ),
//
//                             // customRow("Status : ", "${controller.list[index].status}",Colors.green),
//                             // SizedBox(height: 8,),
//                             // customRow("Order Id : ", "#${controller.list[index].id}",Colors.black),
//                             // SizedBox(height: 8,),
//                             // // customRow("Address : ","${controller.list[index].fullAddress}",Colors.black54),
//                             // // SizedBox(height: 8,),
//                             // customRow("Time : ","${TimeAgo.timeAgo(controller.list[index].createdAt!)}",Colors.black54),
//                             // SizedBox(height: 16,),
//                             Divider(),
//                             ContainerDecorated(colorBorder: Colors.transparent,color: Colors.transparent,padding:0,child: Row(
//                               children: [
//                                 Column(children: [
//                                   Icon(Icons.arrow_circle_down_rounded,size: 16,color: Colors.blue,),
//                                   SizedBox(height: 36,),
//                                   Icon(Icons.location_on,size: 16,),
//                                 ],),
//
//
//                                 SizedBox(width: 16,),
//
//                                 Expanded(
//                                   child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                                     SmallText(text: "456 Elm Street, Springfield",fontWeight: FontWeight.w600,),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "Pickup point",size: 10,color: Colors.black54,),
//                                     SizedBox(height: 24,),
//                                     SmallText(text: "739 Main Street, Springfield",fontWeight: FontWeight.w600,),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "Destination",size: 10,color: Colors.black54,),
//                                   ],),
//                                 ),
//
//                                 Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                                   SmallText(text: "Payment",color: Colors.black54,size: 10,),
//                                   SizedBox(height: 4,),
//                                   ContainerDecorated(color: Colors.green.withOpacity(0.1),child: SmallText(color: Colors.green,text: "₹ 12",fontWeight: FontWeight.w600,)),
//                                   SizedBox(height: 16,),
//                                   SmallText(text: "Distance",color: Colors.black54,size: 10,),
//                                   SizedBox(height: 4,),
//                                   SmallText(text: "12Km",fontWeight: FontWeight.w600,),
//                                 ],),
//                               ],
//                             ),),
//                             Divider(),
//                             // SizedBox(height: 16,),
//
//                             controller.list[index].deliveryPartner==null?const SizedBox():
//                             Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                               // SizedBox(height: 8,),
//                               Row(children: [
//                                 NetworkOrAssetImage(src: "${controller.list[index].deliveryPartner!.imageUrl}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
//                                 SizedBox(width: 16,),
//                                 Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     SmallText(text:"${controller.list[index].deliveryPartner!.name}",fontWeight: FontWeight.w800,),
//                                     SizedBox(height: 4,),
//                                     SmallText(text: "Delivery Partner",color: Colors.black54,fontWeight: FontWeight.w500,size: 10,),
//                                   ],
//                                 )),
//                                 SizedBox(width: 16,),
//                                 ContainerDecorated(onTap: (){
//                                   LaunchUrls().launchCall("+918858459011");
//                                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.call,size: 18,)),
//                                 SizedBox(width: 16,),
//                                 ContainerDecorated(onTap: (){
//                                   LaunchUrls().launchSms("+918858459011");
//                                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.message,size: 18,))
//                               ],),
//                               SizedBox(height: 16,),
//
//                             ],),
//                             ButtonSingleAtom(widget: "Cancel",),
//
//                           ],
//                         ),
//                       )
//                     ],),)
//                   ],),
//                 );
//               })
//             ],),)
//
//         );
//       }
//     );
//   }
//   formatDate(dateStr){
//
//     DateTime dateTime = DateTime.parse(dateStr);
//
//     // Format the DateTime to the desired format: "02:10 PM 13 JULY 2024"
//     String formattedDate = DateFormat('hh:mm a dd MMMM yyyy').format(dateTime).toUpperCase();
//
//   }
//   customRow(heading,text,color){
//     return Row(
//       children: [
//         Expanded(flex: 1,child: SmallText(text: heading,color: Colors.black54,fontWeight: FontWeight.w600,)),
//         SizedBox(width: 16,),
//         Expanded(flex: 2,child: SmallText(text: text,fontWeight: FontWeight.w600,color: color,)),
//       ],
//     );
//   }
// }
