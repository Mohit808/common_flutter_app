
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class SelectImage extends StatelessWidget {
  const SelectImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:AppPaddings.paddingAll16,
      child: Column(mainAxisSize: MainAxisSize.min,children: [
        InkWell(onTap: (){
          select(ImageSource.gallery);
        },
          child: Row(children: [
            SizedBox(width: 8,),
            ContainerDecorated(padding: 8,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.landscape_rounded,color: Colors.white,)),
            SizedBox(width: 16,),
            HeadingText(text: "Gallery")
          ],),
        ),
        SizedBox(height: 8,),
        Divider(),
        SizedBox(height: 8,),
        InkWell(onTap: (){
          select(ImageSource.camera);
        },
          child: Row(children: [
            SizedBox(width: 8,),
            ContainerDecorated(padding: 8,borderRadius: 30,color: AppColors.primary,child: Icon(Icons.camera_alt_rounded,color: Colors.white,)),
            SizedBox(width: 16,),
            HeadingText(text: "Camera")
          ],),
        ),
        SizedBox(height: 8,),

      ],),
    );
  }
  select(ImageSource imageSource) async {
    XFile? xFile=await ImagePicker().pickImage(source: imageSource);
    if(xFile!=null){
      Get.back(result: xFile.path);
    }
  }
}
