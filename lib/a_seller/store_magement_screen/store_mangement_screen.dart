import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class StoreManagementScreen extends StatelessWidget {
  const StoreManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBarCommon(title: "Store",color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: Colors.black,height: 0,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Column(
            children: [

              Stack(
                children: [
                  Container(padding: EdgeInsets.only(top: 90),width: double.infinity,
                    decoration: const BoxDecoration(gradient: LinearGradient(
                      colors: [
                        Color(0xFF3D6BF3),
                        Color(0xFF9EE0F3),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.centerRight,
                      stops: [0.0, 0.8],
                    ),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 0),
                            blurRadius: 5,
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                          )
                        ]
                    ),
                    child: Padding(
                      padding: AppPaddings.paddingAll16,
                      child: Column(
                        children: [
                          // Row(
                          //   children: [
                          //     Stack(
                          //       children: [
                          //         Container(margin: EdgeInsets.only(left: 200,right: 16),child: NetworkOrAssetImage(borderRadius: 20,src: AppImages.storeManagement2Story,fit: BoxFit.cover,), width: 100,height: 80,),
                          //         Container(margin: EdgeInsets.only(left: 140),child: NetworkOrAssetImage(borderRadius: 20,src: "https://cdn.prod.website-files.com/621ed1db4fa2cb2de34c2b95/660fc8d34193db5249e9d483_wynshop%20blog.png",fit: BoxFit.cover,), width: 110,height: 100,),
                          //         Container(child: NetworkOrAssetImage(borderRadius: 30,src: "https://smartstore.com/media/6787/file/3d-jpg/3d-walk-in-store-konzept-1024p-chatgpt-original1-1_960_960.jpg",fit: BoxFit.cover,), width: 180,height: 120,),
                          //
                          //       ],
                          //     ),
                          //     Expanded(child: SizedBox())
                          //   ],
                          // ),
                          Container(child: NetworkOrAssetImage(borderRadius: 20,src: AppImages.storeManagement2Story,fit: BoxFit.cover,), ),

                          SizedBox(height: 16,),
                          Row(children: [
                            // SmallText(text: "Kanchan kirana store",color: Colors.white,fontWeight: FontWeight.w600,),
                            Expanded(child: ContainerDecorated(padding: 0,color: Colors.white,child: TextFieldCommon(controller: TextEditingController(text: "Kanchan Kirana Store"),hintText: "Kanchan kirana store",suffixIcon: ContainerDecorated(color: AppColors.primary.withOpacity(0.1),child: Icon(Icons.arrow_forward_rounded,color: Colors.red,)),),)),
                            // ContainerDecorated(borderRadius: 20,color: AppColors.primary,child: Icon(Icons.arrow_forward_rounded,size: 16,color: Colors.white,))
                          ],)
                        ],
                      ),
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0,left: 16,right: 16),
                    child: Row(children: [
                      InkWell(onTap: (){
                        Get.back();
                      },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.arrow_back,color: Colors.white,)),),
                      SizedBox(width: 24,),
                      Expanded(child: HeadingText(text: "Store details",color: Colors.white,)),
                      // Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.search)),
                      SizedBox(width: 16,),
                      Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.white.withOpacity(0.4,),borderRadius: BorderRadius.circular(50)),child: Icon(Icons.share)),

                    ],),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(children: [
                  TextFieldCommon(hintText: "Store description",maxLines: 8,maxLength: 1000,),
                  SizedBox(height: 24,),
                  ContainerDecorated(padding: 8,colorBorder: Colors.grey.shade300,color: Colors.white,child: Row(children: [
                    Icon(Icons.location_on,color: AppColors.primary,),
                    SizedBox(width: 8,),
                    Expanded(child: SmallText(text: "Advant navis park, sector 142, noida",fontWeight: FontWeight.w500,)),
                    ContainerDecorated(color: AppColors.primary.withOpacity(0.1),child: Icon(Icons.arrow_forward_rounded,color: Colors.red,)),
                  ],),),
                  SizedBox(height: 48,),
                  HeaderWithLineWidget(text: "Additional Details"),
                  SizedBox(height: 16,),
                  TextFieldWithHeadingMolecule(heading: "GST",hintText: "Enter gst",),
                  TextFieldWithHeadingMolecule(heading: "Business Pan",hintText: "Enter pan",),
                  TextFieldWithHeadingMolecule(heading: "Store privacy",hintText: "Enter privacy",),
                  TextFieldWithHeadingMolecule(heading: "Store refund policy",hintText: "Enter refund policy",),

                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}




// SingleChildScrollView(scrollDirection: Axis.horizontal,
//   child: Padding(
//     padding: const EdgeInsets.symmetric(vertical: 108.0),
//     child: Row(
//       children: [
//         Stack(children: [
//
//           Container(margin: EdgeInsets.only(left: 310,right: 16),child: ContainerDecorated(borderRadius: 20,color: AppColors.primary,), width: 170,height: 120,),
//           Container(margin: EdgeInsets.only(left: 210),child: ContainerDecorated(borderRadius: 20,color: Colors.green,), width: 200,height: 160,),
//           Container(padding: EdgeInsets.only(left: 16),child: ContainerDecorated(borderRadius: 30,), width: 310,height: 200,),
//
//
//           // Container(margin: EdgeInsets.only(left: 310,right: 16),child: NetworkOrAssetImage(borderRadius: 20,src: AppImages.storeManagement2Story,fit: BoxFit.cover,), width: 170,height: 120,),
//           // Container(margin: EdgeInsets.only(left: 210),child: NetworkOrAssetImage(borderRadius: 20,src: "https://cdn.prod.website-files.com/621ed1db4fa2cb2de34c2b95/660fc8d34193db5249e9d483_wynshop%20blog.png",fit: BoxFit.cover,), width: 200,height: 160,),
//           // Container(padding: EdgeInsets.only(left: 16),child: NetworkOrAssetImage(borderRadius: 30,src: "https://smartstore.com/media/6787/file/3d-jpg/3d-walk-in-store-konzept-1024p-chatgpt-original1-1_960_960.jpg",fit: BoxFit.cover,), width: 310,height: 200,),
//         ],),
//       ],
//     ),
//   ),
// ),