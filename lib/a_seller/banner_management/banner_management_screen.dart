import 'package:common_flutter_app/a_seller/banner_management/controller_banner_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/molecules/text_field_with_heading_molecule.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/common_widget/dropdown_common.dart';
import 'package:modular_ui_package/utils/app_images.dart';

class BannerManagementScreen extends StatelessWidget {
  const BannerManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerBannerManagement(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: "Banner Management",color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: Colors.black,),
          body: SingleChildScrollView(
            child: Padding(
              padding:AppPaddings.paddingAll16,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                ListView.separated(physics: NeverScrollableScrollPhysics(),itemCount: 3,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                  return BannerWidget(endColor: "0xFF3D6BF3",startColor: "0xFF9EE0F3",image: AppImagesConst.vegitable);
                }, separatorBuilder: (BuildContext context, int index) { return Column(
                  children: [
                    SizedBox(height: 8,),
                    Row(
                      children: [
                        Row(
                          children: [
                            SmallText(text: "Priority: 9",color: Colors.black54,fontWeight: FontWeight.w600,),
                            SizedBox(width: 16,),
                            Icon(Icons.low_priority_outlined,size: 16,color: Colors.green,),
                            SmallText(text: "Change",fontWeight: FontWeight.w600,color: Colors.green,),

                          ],
                        ),
                        Spacer(),
                        Row(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.edit,size: 16,color: Colors.blue,),
                          SizedBox(width: 8,),
                          SmallText(text: "Edit",fontWeight: FontWeight.w600,color: Colors.blue,),
                          SizedBox(width: 8,),
                        ],),
                        SizedBox(width: 16,),
                        Row(mainAxisSize: MainAxisSize.min,children: [
                          Icon(Icons.delete,size: 16,color: AppColors.primary,),
                          SizedBox(width: 8,),
                          SmallText(text: "Delete",fontWeight: FontWeight.w600,color: AppColors.primary,),
                          SizedBox(width: 8,),
                        ],),

                      ],
                    ),
                    SizedBox(height: 8,),
                    Divider(color: Colors.black38,),
                    SizedBox(height: 16,)
                  ],
                ); },),
                SizedBox(height: 24,),
                Row(
                  children: [
                    SmallText(text: "Select Category"),
                    SmallText(text: " *",color: Colors.red,),
                  ],
                ),
                SizedBox(height: 8,),
                DropdownCommon(hint: "Category",list: [],),
                TextFieldWithHeadingMolecule(controller: controller.textEditingControllerName,hintText: "Enter name",heading: "Heading Name",mandatoryString: "*",colorMandatoryString: Colors.red,onChanged: (value){controller.update();},),
                TextFieldWithHeadingMolecule(controller: controller.textEditingControllerDescription,hintText: "Enter description",heading: "Banner Description",mandatoryString: "*",colorMandatoryString: Colors.red,onChanged: (value){controller.update();},),
                TextFieldWithHeadingMolecule(controller: controller.textEditingControllerButtonText,hintText: "e.g. Order now",heading: "Button Text",mandatoryString: "*",colorMandatoryString: Colors.red,onChanged: (value){controller.update();},),
                TextFieldWithHeadingMolecule(controller: controller.textEditingControllerStartColor,hintText: "e.g. 0xFFf9c58d",heading: "Start Color",mandatoryString: "*",colorMandatoryString: Colors.red,suffixIcon: Icon(Icons.palette),),
                TextFieldWithHeadingMolecule(controller: controller.textEditingControllerEndColor,hintText: "e.g. 0xFFf9c58d",heading: "End Color",mandatoryString: "*",colorMandatoryString: Colors.red,suffixIcon: Icon(Icons.palette),),
                SizedBox(height: 16,),
                SmallText(text: "Priority"),
                SizedBox(height: 8,),
                TextFieldCommon(onChanged: (value){controller.update();},controller: controller.textEditingControllerPriority,hintText: "0 - 10",suffixIcon: Column(children: [
                  Icon(Icons.arrow_drop_up_rounded),
                  Icon(Icons.arrow_drop_down_rounded),
                ],),),
                SizedBox(height: 16,),
                ContainerDecorated(child: Icon(Icons.add),height: 100,width: 100,),
                SizedBox(height: 24,),
                HeaderWithLineWidget(text: "Review Banner",),
                SizedBox(height: 8,),
                BannerWidget(heading: controller.textEditingControllerName.text,description: controller.textEditingControllerDescription.text,image: AppImagesConst.vegitable,startColor: "0xFFf9c58d",endColor: "0xFFf492f0",buttonText: controller.textEditingControllerButtonText.text,),
                SizedBox(height: 150,)
              ],),
            ),
          ),
          persistentFooterButtons: [
            ButtonSingleAtom(widget: "Review and Publish",)
          ],
        );
      }
    );
  }
}
