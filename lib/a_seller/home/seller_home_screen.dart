import 'package:common_flutter_app/a_seller/ai_upload_screen.dart';
import 'package:common_flutter_app/a_seller/banner_management/banner_management_screen.dart';
import 'package:common_flutter_app/a_seller/help_support/help_support_screen.dart';
import 'package:common_flutter_app/a_seller/home/controller_seller_home_order.dart';
import 'package:common_flutter_app/a_seller/order_management_screen.dart';
import 'package:common_flutter_app/a_seller/product_management/create_product/controller_create_product.dart';
import 'package:common_flutter_app/a_seller/product_management/inventory/inventory_screen.dart';
import 'package:common_flutter_app/a_seller/store_magement_screen/store_mangement_screen.dart';
import 'package:common_flutter_app/a_seller/wallet/wallet_screen.dart';
import 'package:common_flutter_app/common_widgets/festival_banner/festival_banner_widget.dart';
import 'package:common_flutter_app/screens/store_details/store_detail_screen.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/utils.dart';

import '../../common_function/launch_urls/launch_urls.dart';
import '../../common_widgets/order_common_molecule/order_page_common.dart';
import '../../screens/profile_screen/profile_screen.dart';
import '../../utils/utils.dart';

class SellerHomeScreen extends StatelessWidget {
  const SellerHomeScreen({super.key});

  calculate(ControllerSellerHomeOrder controller,index){
    List<double> list=controller.list[index].orderItem!.map((toElement)=>toElement.qty!.toInt()* (double.parse(toElement.discountedPrice??toElement.price!))).toList();
    num sum = list.reduce((a, b) => a + b);
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBarCommon(elevation: 0,title: Row(children: [
        ContainerDecorated(padding: 6,color: Color(0xFFBF360C),child: Column(children: [
          Icon(Icons.location_on,color: Colors.white,)
        ],),),
        SizedBox(width: 16,),
        Expanded(
          child: InkWell(onTap: (){
            // Get.to(()=>AddAddressScreen())!.then((onValue){
            //   // if(onValue!=null) controller.update();
            // });
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
            // Get.to(()=>DeliveryLoginScreen());
            Get.to(()=>ProfileScreen());
          },child: Icon(Icons.account_circle_rounded,size: 40,)),
          SizedBox(width: 16,)],
      ),


      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

          Padding(
            padding:EdgeInsets.symmetric(horizontal: 16,vertical: 4),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SmallText(text: "Business Stories",fontWeight: FontWeight.w600,letterSpacing: 1,size: 14,color: Colors.black,),
                SizedBox(height: 8,),
                SingleChildScrollView(scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    for(var x in [1,2,3,4,5])
                      ContainerDecorated(color: x==1?AppColors.primary:null,marginEdgeInsets: EdgeInsets.only(right: 16),padding: 20,borderRadius: 40,child: Icon(Icons.add,color: x==1?Colors.white:null,))
                  ],),
                )
              ],
            ),
          ),


          SizedBox(height: 16,),
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
                   NormalHeadingText(text: "New Orders Recieved",fontWeight: FontWeight.w700,letterSpacing: 0.5,),
                   SmallText(text: "Get ready the package for delivery"),
                 ],
               ),
               NormalText(text: "See All",color: AppColors.primary,fontWeight: FontWeight.w600,)
             ],),

             GetBuilder(init: ControllerSellerHomeOrder(),
               builder: (controller) {
                 return ListView.builder(shrinkWrap: true,physics: NeverScrollableScrollPhysics(),itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
                   return Padding(
                     padding: const EdgeInsets.only(top: 16.0),
                     child: ContainerDecorated(padding: 8,color: Colors.white,colorBorder: Colors.grey.shade300,
                       child: Column(
                         children: [
                           Row(children: [
                             NetworkOrAssetImage(src: "${controller.list[index].customer!.customerImage}",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
                             SizedBox(width: 16,),
                             Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 SmallText(text: "${controller.list[index].customer!.customerName}",fontWeight: FontWeight.w600,),
                                 SizedBox(height: 4,),
                                 Row(
                                   children: [
                                     SmallText(text: "${controller.list[index].orderItem!.length} Items   |   ₹${calculate(controller,index)}",fontWeight: FontWeight.w600,color: Colors.green,),
                                     SizedBox(width: 8,),
                                     InkWell(onTap: (){
                                       controller.showFullOrder=!controller.showFullOrder;
                                       controller.update();
                                     },child: Icon(controller.showFullOrder?Icons.keyboard_arrow_up_rounded:Icons.keyboard_arrow_down_rounded,size: 18,color: Colors.green,))
                                   ],
                                 )
                               ],
                             )),
                             SizedBox(width: 16,),
                             ContainerDecorated(color: Colors.green.withOpacity(0.1),padding: 8,child: SmallText(text: "Accept",fontWeight: FontWeight.w600,color: Colors.green,),)
                           ],),
                           SizedBox(height: 8,),
                           controller.showFullOrder? Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                             for (int x=0;x<controller.list[index].orderItem!.length;x++)
                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Row(
                                   children: [
                                     ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].orderItem![x].productImage}",height: 40,width: 40,)),
                                     SizedBox(width: 16,),
                                     Column(crossAxisAlignment: CrossAxisAlignment.start,
                                       children: [
                                         SmallText(text: "${controller.list[index].orderItem![x].productName}",fontWeight: FontWeight.w600,),
                                         SizedBox(height: 4,),
                                         Row(
                                           children: [
                                             SmallText(text: controller.list[index].orderItem![x].discountedPrice==null?"":"₹${controller.list[index].orderItem![x].price}  ",fontWeight: FontWeight.w700,size: 13,color: Colors.black54,textDecoration: TextDecoration.lineThrough,),
                                             SmallText(text: "₹${controller.list[index].orderItem![x].discountedPrice??controller.list[index].orderItem![x].price}",fontWeight: FontWeight.w700,size: 13,color: Colors.black54),
                                             SizedBox(width: 16,),
                                             SmallText(text: "x${controller.list[index].orderItem![x].qty}",color: Colors.green,fontWeight: FontWeight.bold,),
                                           ],
                                         ),
                                       ],
                                     ),
                                   ],
                                 ),
                               )
                           ],):SizedBox(),

                           // Row(
                           //   children: [
                           //     Expanded(
                           //       child: controller.showFullOrder?SizedBox():Wrap(children: [
                           //         for (int x=0;x<controller.list[index].orderItem!.length;x++)
                           //           Padding(
                           //             padding: const EdgeInsets.all(4.0),
                           //             child: Stack(
                           //               children: [
                           //                 Padding(
                           //                   padding: const EdgeInsets.all(4.0),
                           //                   child: ContainerDecorated(color: Colors.grey.shade100,padding: 0,child: NetworkOrAssetImage(borderRadius: 8,src: "${controller.list[index].orderItem![x].productImage}",height: 40,width: 40,)),
                           //                 ),
                           //                 Positioned(bottom: 0,right: 0,child: SmallText(text: "x${controller.list[index].orderItem![x].qty}",color: Colors.green,fontWeight: FontWeight.bold,)),
                           //               ],
                           //             ),
                           //           ),
                           //       ],),
                           //     ),
                           //     InkWell(onTap: (){
                           //       controller.showFullOrder=!controller.showFullOrder;
                           //       controller.update();
                           //     },child: ContainerDecorated(child: Icon(controller.showFullOrder?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down)))
                           //   ],
                           // ),

                           ContainerDecorated(colorBorder: Colors.transparent,color: Colors.transparent,padding:8,child: Row(
                             children: [
                               Icon(Icons.location_on,size: 16,),
                               SizedBox(width: 16,),
                               Expanded(
                                 child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                   SmallText(text: "${controller.list[index].fullAddress}",fontWeight: FontWeight.w600,),
                                   // SmallText(text: "739 Main Street, Springfield",fontWeight: FontWeight.w600,),
                                   SizedBox(height: 4,),
                                   SmallText(text: "Destination",size: 10,color: Colors.black54,),
                                 ],),
                               ),
                               Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                                 SmallText(text: "Distance",color: Colors.black54,size: 10,),
                                 SizedBox(height: 4,),
                                 SmallText(text: "12Km",fontWeight: FontWeight.w600,),
                               ],),
                             ],
                           ),),
                         ],
                       ),
                     ),
                   );
                 });
               }
             ),

             SizedBox(height: 36,),
             HeaderWithLineWidget(text: "Delivery Partner Reached",),
             SizedBox(height: 16,),
             ContainerDecorated(color: AppColors.primary.withOpacity(0.1),padding: 16,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
               Row(
                 children: [
                   Expanded(child: NetworkOrAssetImage(src: AppImages.deliveryBoy,)),
                   Expanded(
                     child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                       children: [
                         Column(children: [
                           NetworkOrAssetImage(src: "",height: 40,width: 40,borderRadius: 30,fit: BoxFit.cover,),
                           SizedBox(height: 8,),
                           ConstrainedBox(constraints: BoxConstraints(maxWidth: 200),child: SmallText(text: "Abhinav Saxena",fontWeight: FontWeight.w600,)),
                           SizedBox(height: 8,),
                           Row(mainAxisSize: MainAxisSize.min,children: [
                             ContainerDecorated(onTap: (){
                               LaunchUrls().launchCall("");
                             },borderRadius: 20,color: AppColors.primary,child: Icon(Icons.call,size: 18,color: Colors.white,)),
                             SizedBox(width: 16,),
                             ContainerDecorated(onTap: (){
                               LaunchUrls().launchSms("");
                             },borderRadius: 20,color: AppColors.primary,child: Icon(Icons.message,size: 18,color: Colors.white,))

                           ],),
                         ],)
                       ],
                     ),
                   ),
                 ],
               ),
               SmallText(text: "Delivery Partner is on your door-step",fontWeight: FontWeight.w600,size: 13,),
               SizedBox(height: 4,),
               SmallText(text: "Order No: 65",color: AppColors.primary,fontWeight: FontWeight.w600,),
               SizedBox(height: 4,),
               SmallText(text: "OTP : 4594",color: Colors.green,fontWeight: FontWeight.w600,letterSpacing: 2,),
               SizedBox(height: 8,),

             ],),),

             SizedBox(height: 36,),
             HeaderWithLineWidget(text: "My Banner",),
             SizedBox(height: 16,),
             BannerWidget(image: AppImagesConst.vegitable,isNetworkImage: true,startColor: "0xFF73C8A9",endColor: "0xFF373B44",),

             SizedBox(height: 36,),
             HeaderWithLineWidget(text: "Store Management",),
             SizedBox(height: 16,),

             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
               ContainerDecorated(onTap: (){Get.to(()=>OrderScreenCommon(isStore: true,));},color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.orderManagement,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Order\nManagement",fontWeight: FontWeight.w600,textAlign: TextAlign.center,)
               ],),),

               ContainerDecorated(onTap: (){Get.to(()=>InventoryScreen());},color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.inventoryManagement,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Inventory\nManagement",fontWeight: FontWeight.w600,textAlign: TextAlign.center,)
               ],),),

               ContainerDecorated(color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.wallet,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Wallet &\nPayment",fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
               ],),onTap: (){
                 Get.to(()=>WalletScreen());
               },),

             ],),
             SizedBox(height: 16,),
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
               ContainerDecorated(color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.billboard,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Banner\nManagement",fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
               ],),onTap: (){
                 Get.to(()=>BannerManagementScreen());
               },),

               ContainerDecorated(color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.storeManagement,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Store\nDetails",fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
               ],),onTap: (){
                 // Get.to(()=>StoreDetailScreen(id: 1,));
                 Get.to(()=>StoreManagementScreen());
               },),

               ContainerDecorated(color: Colors.transparent,child: Column(children: [
                 ContainerDecorated(borderRadius: 50,color: AppColors.primary.withOpacity(0.09),child: NetworkOrAssetImage(src: AppImages.support,height: 50,width: 50,)),
                 SizedBox(height: 8,),
                 SmallText(text: "Help &\nSupport",fontWeight: FontWeight.w600,textAlign: TextAlign.center,),
               ],),onTap: (){
                 Get.to(()=>HelpSupportScreen());
               },),

             ],),

             SizedBox(height: 48,),
             HeaderWithLineWidget(text: "Ai Store Listing",),
             SizedBox(height: 16,),
             FestivalBannerWidget(onTap: (){
               Get.to(()=>AiUploadScreen());
             },smallFocusText: "Ai Make work faster & smarter",bigFocusText: "Product Listing easy, with Ai Vision",image: AppImages.ai,),

             SizedBox(height: 48,),
             HeaderWithLineWidget(text: "Store Status",),
             SizedBox(height: 8,),

             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
               Expanded(
                 child: Column(
                   children: [


                     Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [

                       Expanded(
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                           SmallText(text: "Available Items",fontWeight: FontWeight.w800,),
                           SizedBox(height: 4,),
                           SmallText(text: "100"),
                         ],),
                       ),

                       Expanded(
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                           SmallText(text: "Sold Items",fontWeight: FontWeight.w800,),
                           SizedBox(height: 4,),
                           SmallText(text: "45"),
                         ],),
                       ),
                     ],),
                     SizedBox(height: 16,),
                     Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                       Expanded(
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                           SmallText(text: "Ongoing Orders",fontWeight: FontWeight.w800,),
                           SizedBox(height: 4,),
                           SmallText(text: "20"),
                         ],),
                       ),

                       Expanded(
                         child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                           SmallText(text: "Total Revenue",fontWeight: FontWeight.w800,),
                           SizedBox(height: 4,),
                           SmallText(text: "4500",fontWeight: FontWeight.w500,),
                         ],),
                       ),
                     ],),
                   ],
                 ),
               ),

               SizedBox(height: 120,width: 120,
                 child: Stack(
                   children: [
                     NetworkOrAssetImage(src: AppImages.progress,height: 120,width: 120,),
                     Center(child: HeadingText(text: "78%",fontWeight: FontWeight.w800,))
                   ],
                 ),
               )
             ],),


             SizedBox(height: 36,),
             HeaderWithLineWidget(text: "Statics",),
             SizedBox(height: 16,),
             Row(children: [
               Expanded(child: ContainerDecorated(borderRadius: 0,padding: 8,color: Colors.white,colorBorder: Colors.grey.shade300,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                 NormalText(text: "New Orders",fontWeight: FontWeight.w500,),
                 SizedBox(height: 16,),
                 Row(
                   children: [
                     BigSemiText(text: "320",fontWeight: FontWeight.w800,),
                     SizedBox(width: 8,),
                     ContainerDecorated(borderRadius: 30,padding: 0,color: Colors.deepOrangeAccent.withOpacity(0.1),child: Icon(Icons.arrow_downward_rounded,size: 16,color: Colors.deepOrangeAccent,),),
                     SizedBox(width: 8,),
                     SmallText(text: "4%",color: Colors.deepOrangeAccent,fontWeight: FontWeight.w600,)
                   ],
                 ),
                 SizedBox(height: 4,),
                 SmallText(text: "compared to last week",color: Colors.grey,size: 10,)
               ],),)),

               // SizedBox(width: 16,),

               Expanded(child: ContainerDecorated(borderRadius: 0,padding: 8,color: Colors.white,colorBorder: Colors.grey.shade300,child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                 NormalText(text: "Avg. order revenue",fontWeight: FontWeight.w500,),
                 SizedBox(height: 16,),
                 Row(
                   children: [
                     BigSemiText(text: "₹1,080",fontWeight: FontWeight.w800,),
                     SizedBox(width: 8,),
                     ContainerDecorated(borderRadius: 30,padding: 0,color: Colors.green.withOpacity(0.1),child: Icon(Icons.arrow_upward_rounded,size: 16,color: Colors.green,),),
                     SizedBox(width: 8,),
                     SmallText(text: "4%",color: Colors.green,fontWeight: FontWeight.w600,)
                   ],
                 ),
                 SizedBox(height: 4,),
                 SmallText(text: "compared to last week",color: Colors.grey,size: 10,)
               ],),)),


             ],),

             SizedBox(height: 24,),
             ContainerDecorated(color: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade300,
               child: SizedBox(height: 300,width: double.infinity,
                   child: BarChartSample2()// orders, delivers
               ),
             ),
             SizedBox(height: 36,),
             Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
               NormalHeadingText(text: "Invite Friends",size: 15,),
               SizedBox(height: 4,),
               SmallText(text: "Invite Your Friends or Family to join quick commere application. You will earn varifiaction badge"),
               SizedBox(height: 16,),
               Lottie.asset(AppImages.invite),
               SizedBox(height: 16,),
               NormalHeadingText(text: "Share Invite via",size: 15,),
               SizedBox(height: 16,),
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                 Column(
                   children: [
                     Icon(Icons.whatshot,size: 30,),
                     SmallText(text: "Whatsapp")
                   ],
                 ),
                 Column(
                   children: [
                     Icon(Icons.facebook_rounded,size: 30,),
                     SmallText(text: "Facebook")
                   ],
                 ),
                 Column(
                   children: [
                     Icon(Icons.mail_rounded,size: 30,),
                     SmallText(text: "Mail")
                   ],
                 ),
                 Column(
                   children: [
                     Icon(Icons.message,size: 30,),
                     SmallText(text: "message")
                   ],
                 ),
                 Column(
                   children: [
                     Icon(Icons.more_vert,size: 30,),
                     SmallText(text: "More")
                   ],
                 ),
               ],)
             ],),
             SizedBox(height: 24,),
             ContainerDecorated(padding: 0,color: AppColors.scaffoldBackgroundColor,colorBorder: Colors.grey.shade300,
               child: Row(children: [
                 Expanded(child: Padding(
                   padding: const EdgeInsets.only(left: 8.0),
                   child: SmallText(text: "https://playstore.cpm/quickcommerce",fontWeight: FontWeight.w600,overflow: TextOverflow.ellipsis,),
                 )),
                 Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),color: Colors.green),child: SmallText(text: "Copy Link",color: Colors.white,fontWeight: FontWeight.w600,))
               ],),
             ),
             SizedBox(height: 100,),

           ],),
         )
        ],),
      ),
    );
  }
}




class BarChartSample2 extends StatefulWidget {
  BarChartSample2({super.key});
  final Color leftBarColor = Colors.red;
  final Color rightBarColor = Colors.blue;
  final Color avgColor = Colors.green;
  // AppColors.contentColorOrange.avg(AppColors.contentColorRed);
  @override
  State<StatefulWidget> createState() => BarChartSample2State();
}

class BarChartSample2State extends State<BarChartSample2> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final barGroup1 = makeGroupData(0, 5, 12);
    final barGroup2 = makeGroupData(1, 16, 12);
    final barGroup3 = makeGroupData(2, 18, 5);
    final barGroup4 = makeGroupData(3, 20, 16);
    final barGroup5 = makeGroupData(4, 17, 6);
    final barGroup6 = makeGroupData(5, 19, 1.5);
    final barGroup7 = makeGroupData(6, 10, 1.5);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
      barGroup5,
      barGroup6,
      barGroup7,
    ];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                makeTransactionsIcon(),
                const SizedBox(
                  width: 38,
                ),
                NormalHeadingText(text: 'Transactions',),
                const SizedBox(
                  width: 4,
                ),
                // const Text(
                //   'state',
                //   style: TextStyle(color: Color(0xff77839a), fontSize: 16),
                // ),
              ],
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 20,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: ((group) {
                        return Colors.grey;
                      }),
                      getTooltipItem: (a, b, c, d) => null,
                    ),
                    touchCallback: (FlTouchEvent event, response) {
                      if (response == null || response.spot == null) {
                        setState(() {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                        });
                        return;
                      }

                      touchedGroupIndex = response.spot!.touchedBarGroupIndex;

                      setState(() {
                        if (!event.isInterestedForInteractions) {
                          touchedGroupIndex = -1;
                          showingBarGroups = List.of(rawBarGroups);
                          return;
                        }
                        showingBarGroups = List.of(rawBarGroups);
                        if (touchedGroupIndex != -1) {
                          var sum = 0.0;
                          for (final rod
                          in showingBarGroups[touchedGroupIndex].barRods) {
                            sum += rod.toY;
                          }
                          final avg = sum /
                              showingBarGroups[touchedGroupIndex]
                                  .barRods
                                  .length;

                          showingBarGroups[touchedGroupIndex] =
                              showingBarGroups[touchedGroupIndex].copyWith(
                                barRods: showingBarGroups[touchedGroupIndex]
                                    .barRods
                                    .map((rod) {
                                  return rod.copyWith(
                                      toY: avg, color: widget.avgColor);
                                }).toList(),
                              );
                        }
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Color(0xff7589a2),
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1K';
    } else if (value == 10) {
      text = '5K';
    } else if (value == 19) {
      text = '10K';
    } else {
      return Container();
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Text(text, style: style),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['Mn', 'Te', 'Wd', 'Tu', 'Fr', 'St', 'Su'];

    final Widget text = Text(
      titles[value.toInt()],
      style: const TextStyle(
        color: Color(0xff7589a2),
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16, //margin top
      child: text,
    );
  }

  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y1,
          color: widget.leftBarColor,
          width: width,
        ),
        BarChartRodData(
          toY: y2,
          color: widget.rightBarColor,
          width: width,
        ),
      ],
    );
  }

  Widget makeTransactionsIcon() {
    const width = 4.5;
    const space = 3.5;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: AppColors.primary.withOpacity(0.4),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: AppColors.primary.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 42,
          color: AppColors.primary.withOpacity(1),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 28,
          color: AppColors.primary.withOpacity(0.8),
        ),
        const SizedBox(
          width: space,
        ),
        Container(
          width: width,
          height: 10,
          color: AppColors.primary.withOpacity(0.4),
        ),
      ],
    );
  }
}
