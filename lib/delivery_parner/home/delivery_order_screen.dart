// import 'package:common_flutter_app/delivery_parner/home/controller_delivery_my_orders.dart';
// import 'package:common_flutter_app/delivery_parner/onboarding/delivery_onboarding_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modular_ui_package/common_functions/image_network.dart';
// import 'package:modular_ui_package/common_widget/appbar_common.dart';
// import 'package:modular_ui_package/common_widget/button_single_atom.dart';
// import 'package:modular_ui_package/common_widget/container_decorated.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
// import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
// import 'package:modular_ui_package/common_widget/otp_atom.dart';
// import 'package:modular_ui_package/common_widget/textfield_atom.dart';
// import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
// import 'package:modular_ui_package/text_atoms/text_common.dart';
// import 'package:modular_ui_package/theme/app_colors.dart';
// import 'package:modular_ui_package/theme/app_paddings.dart';
// import 'package:modular_ui_package/utils/app_images.dart';
// import 'package:modular_ui_package/utils/network_handling/api_response.dart';
// import 'package:modular_ui_package/utils/utils.dart';
//
// import '../../common_function/launch_urls/launch_urls.dart';
// import '../../common_function/time_ago.dart';
// import '../../screens/orders/order_screen.dart';
// import '../../utils/utils.dart';
//
// class DeliveryOrderScreen extends StatelessWidget {
//   const DeliveryOrderScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder(init: ControllerDeliveryMyOrders(),
//       builder: (controller) {
//         return Scaffold(
//           appBar:AppBarCommon(elevation: 0,title: "Orders",titleColor: Colors.black,centerTitle: true,color: AppColors.scaffoldBackgroundColor,),
//           body:
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 16),
//                   child: ContainerDecorated(
//                     child: Row(children: [
//                       Expanded(child: ContainerDecorated(onTap: (){controller.changeTab(1);},color: controller.selectedTab==1?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Ready to pickup",fontWeight: FontWeight.w600,color: controller.selectedTab==1?AppColors.primary:Colors.black54,textAlign: TextAlign.center,))),
//                       Expanded(child: ContainerDecorated(onTap: (){controller.changeTab(2);},color: controller.selectedTab==2?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Ready to deliver",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==2?AppColors.primary:Colors.black54,))),
//                       Expanded(child: ContainerDecorated(onTap: (){controller.changeTab(3);},color: controller.selectedTab==3?Colors.white:null,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: SmallText(text: "Completed",fontWeight: FontWeight.w600,textAlign: TextAlign.center,color: controller.selectedTab==3?AppColors.primary:Colors.black54,))),
//
//                     ],),
//                   ),
//                 ),
//                 controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,paddingTop: 100,):
//                 controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,msg: controller.apiResponse.message,paddingTop: 100,):
//                 controller.list.isEmpty?NoDataWidget(center: true,paddingTop: 100,):
//                 ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
//                   return Padding(
//                     padding: AppPaddings.paddingAll16,
//                     child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                       ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade300,child: Column(children: [
//
//                         ContainerDecorated(padding: 8,colorBorder: Colors.grey.shade200,color: Colors.green.withOpacity(0.1),child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                           Row(children: [
//                             NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].storeLogo}",height: 40,width: 40,),
//                             SizedBox(width: 16,),
//                             Column(crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SmallText(text: "${controller.list[index].storeName}",fontWeight: FontWeight.w800,maxLine: 1,overflow: TextOverflow.ellipsis,),
//                                 SizedBox(height: 4,),
//                                 SmallText(text: "${controller.list[index].orderItem!.length} Item ",color: Colors.green,fontWeight: FontWeight.w700,)
//                               ],
//                             ),
//                           ],),
//                         ],),),
//
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(children: [
//                             Row(children: [
//                               Icon(Icons.map_outlined),
//                               SizedBox(width: 16,),
//                               SmallText(text: "${controller.list[index].storeAddress}",fontWeight: FontWeight.w600,),
//                             ],),
//                             SizedBox(height: 4,),
//                             Row(children: [
//                               Icon(Icons.pin_drop),
//                               SizedBox(width: 16,),
//                               SmallText(text: "${controller.list[index].addressTitle}",fontWeight: FontWeight.w500,letterSpacing: 0.2,),
//                             ],),
//                             SizedBox(height: 16,),
//                             Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
//                               SmallText(text: "Customer",fontWeight: FontWeight.w700,letterSpacing: 1,),
//                               SizedBox(height: 8,),
//                               Row(children: [
//                                 NetworkOrAssetImage(src: "${controller.list[index].customerImage}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
//                                 SizedBox(width: 16,),
//                                 Expanded(child: SmallText(text:"${controller.list[index].customerName}",fontWeight: FontWeight.w800,)),
//                                 SizedBox(width: 16,),
//                                 ContainerDecorated(onTap: (){
//                                   LaunchUrls().launchCall("${controller.list[index].customerMobile}");
//                                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.call,size: 18,)),
//                                 SizedBox(width: 16,),
//                                 ContainerDecorated(onTap: (){
//                                   LaunchUrls().launchCall("${controller.list[index].customerMobile}");
//                                 },borderRadius: 20,color: Colors.transparent,colorBorder: Colors.grey.shade300,child: Icon(Icons.message,size: 18,))
//                               ],),
//                               SizedBox(height: 8,),
//                               Row(
//                                 children: [
//                                   SmallText(text: "Delivery Tips",fontWeight: FontWeight.w600,letterSpacing: 1,color: AppColors.primary,),
//                                   NormalHeadingText(text: "  ₹${controller.list[index].tip}",color: AppColors.primary,fontWeight: FontWeight.w600,letterSpacing: 1,),
//                                   Spacer(),
//                                   SmallText(text: TimeAgo.timeAgo(controller.list[index].createdAt!)),
//                                 ],
//                               ),
//                               SizedBox(height: 4,),
//                               SmallText(text: "Order Id : #${controller.list[index].id}",fontWeight: FontWeight.w600,letterSpacing: 1,),
//                               SizedBox(height: 4,),
//                               SmallText(text: "Order status : ${controller.list[index].statusName}",color: Colors.green,fontWeight: FontWeight.w600,),
//                               SizedBox(height: 4,),
//                               controller.selectedTab==3?SizedBox():SmallText(text: "Enter OTP to pickup items",fontWeight: FontWeight.w600,),
//                               controller.selectedTab==3?SizedBox():SizedBox(height: 16,),
//                             ],),
//                             controller.selectedTab==3?SizedBox():OtpAtom(textEditingController: TextEditingController(), length: 6,),
//                             SizedBox(height: 8,),
//                             controller.selectedTab==3?SizedBox():ButtonSingleAtom(status: controller.apiResponseOrder.status,widget: controller.selectedTab==0?"Pickup":"Drop",tap: (){
//                               controller.orderFunction(index,controller.selectedTab+1);
//                             },),
//                             SizedBox(height: 8,),
//                             Row(children: [
//                               Expanded(
//                                 child: ContainerDecorated(colorBorder: Colors.grey,color: Colors.white,padding: 8,
//                                   child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
//                                     Icon(Icons.map),
//                                     SizedBox(width: 8,),
//                                     SmallText(text: "View on map",fontWeight: FontWeight.w600,)
//                                   ],),
//                                 ),
//                               ),
//                               // SizedBox(width: 16,),
//                               // Expanded(child: ButtonSingleAtom(widget: "Accept",))
//                             ],)
//                           ],),
//                         )
//
//                       ],),)
//                     ],),
//                   );
//                 }),
//               ],
//             ),
//           )
//         );
//       }
//     );
//   }
// }
