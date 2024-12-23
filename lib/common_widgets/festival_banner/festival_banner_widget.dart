import 'package:common_flutter_app/common_widgets/festival_banner/controller_festival_banner.dart';
import 'package:common_flutter_app/screens/festival_detail/festival_detail_screen.dart';
import 'package:common_flutter_app/screens/store_details/store_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../category_details_screen.dart';
import '../../utils/app_images.dart';

class FestivalBannerWidget extends StatelessWidget {
  const FestivalBannerWidget({super.key, this.bigFocusText, this.smallFocusText, this.image, this.onTap});
  final String? bigFocusText;
  final String? smallFocusText;
  final String? image;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerFestivalBanner(),
      builder: (controller) {
        return
          InkWell(onTap: (){
            if(onTap!=null){
              onTap!();
              return;
            }
          // Get.to(()=>CategoryDetailsScreen(name:  controller.data!.name??"The Softest & Creamiest Paneer",description:  controller.data!.description??"Freshly hand churned,\njust for you!",image:  controller.data!.image??AppImages.paneer,));
            Get.to(()=>FestivalDetailScreen(id: controller.data!.id,heading: controller.data!.name,desc: controller.data!.description,logo: controller.data!.image,));
        }, child: Skeletonizer(enabled: controller.data==null,containersColor: Colors.grey.shade100,
          child: Stack(
            children: [
              ContainerDecorated(borderRadius: 16,paddingEdgeInsets: EdgeInsets.symmetric(horizontal: 16,vertical: 8),color: controller.data==null?null:Colors.indigoAccent,child: Row(children: [
                Expanded(flex: 2,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                    SmallText(text:  smallFocusText!=null? smallFocusText!: controller.data==null?"The Softest & Creamiest Paneer":controller.data!.name!,color: Colors.white,fontWeight: FontWeight.w800,),
                    SizedBox(height: 8,),
                    BigSemiText(text: bigFocusText!=null? bigFocusText!:  controller.data==null?"Freshly hand churned,\njust for you!":controller.data!.description!,color: Colors.white,fontWeight: FontWeight.w800,),
                  ],),
                ),
                // Spacer(),
                SizedBox(width: 8,),
                Expanded(child: NetworkOrAssetImage(src: image!=null? image!:  controller.data==null?AppImages.paneer:controller.data!.image!,height: 80,width: 80,fit: BoxFit.cover,borderRadius: 4,)),
              ],),),

              Positioned(bottom: 0,right: 0,child: Container(decoration: BoxDecoration(color: AppColors.scaffoldBackgroundColor,borderRadius: BorderRadius.only(topLeft: Radius.circular(10))),child: Icon(Icons.arrow_forward_rounded,size: 18,)))

            ],
          ),
        ),);
      }
    );
  }
}
