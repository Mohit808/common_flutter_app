import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class AiUploadScreen extends StatelessWidget {
  const AiUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Ai Scanning",titleColor: Colors.black87,elevation: 0,color: AppColors.scaffoldBackgroundColor,),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(),
                  child: NetworkOrAssetImage(src: AppImages.groceryStore),
                ),
                NetworkOrAssetImage(src: AppImages.scan),
              ],
            ),
            SizedBox(height: 24,),
            BigText20(text: "Scan All At Once"),
            SizedBox(height: 4,),
            NormalText(text: "Ai suggested price and weight"),
            SizedBox(height: 16,),
            ButtonSingleAtom(tap: (){
              // Get.to(()=>BusinessDetailScreen());
            },color: Colors.transparent,colorBorder: Colors.grey,widget: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
              NormalHeadingText(text: "Take picture now and scan"),
              SizedBox(width: 16,),
              ContainerDecorated(borderRadius: 20,color: AppColors.primary,child: Icon(Icons.arrow_forward,size: 16,color: Colors.white,),),
            ],),),

            SizedBox(height: 36,),
            Row(children: [
              Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
              NormalHeadingText(text: "  or  "),
              Expanded(child: ContainerDecorated(height: 1,padding: 0,color: Colors.black26,)),
            ],),
            SizedBox(height: 36,),
            Row(
              children: [
                NormalHeadingText(text: "AI Scan FAQs"),
              ],
            ),
            ExpansionTile(dense: true,tilePadding: EdgeInsets.only(),title: SmallText(text: "How AI scan works")),
            ExpansionTile(tilePadding: EdgeInsets.only(),title: SmallText(text: "Can it scan multiple product at once")),

          ],),
        ),
      ),
    );
  }
}
