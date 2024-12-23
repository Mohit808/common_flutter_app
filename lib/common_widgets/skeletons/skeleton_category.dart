import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/category_widget.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonCategory extends StatelessWidget {
  const SkeletonCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: true,
      child: ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 5,itemBuilder: (itemBuilder,index){
        return
          Column(children: [
            HeaderWithLineWidget(text: "Category details",),
            SizedBox(height: 16,),
            GridView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4,mainAxisExtent: 140,crossAxisSpacing: 8), itemCount: 7,itemBuilder: (itemBuilder,indexCat){
              return CategoryWidget(image:"",text: "Hello\nHow are you",loading: true,);
            }),

            SizedBox(height: 16,),
          ],);
      }),
    );
  }
}
