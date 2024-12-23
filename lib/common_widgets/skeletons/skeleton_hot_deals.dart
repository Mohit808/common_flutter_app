import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SkeletonHotDeals extends StatelessWidget {
  const SkeletonHotDeals({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(enabled: true,
      child: ListView.builder(itemCount:4,shrinkWrap: true,scrollDirection: Axis.horizontal, itemBuilder: (itemBuilder,index) {
        return Padding(
          padding: const EdgeInsets.only(),
          child: SizedBox(width: 125,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: ContainerDecorated(color: Colors.transparent,colorBorder: Colors.grey.shade200,child: NetworkOrAssetImage(src:"",height: 125,width: 125,fit: BoxFit.fitWidth,)),
                    ),
                  ],
                ),
                const SizedBox(height: 8,),
                Expanded(child: SizedBox(width: 75,child: SmallText(text: "Name of product",fontWeight: FontWeight.w700,maxLine: 2,overflow: TextOverflow.ellipsis,))),
                SizedBox(height: 8,),
                SmallText(text: "3 pieces",),
                SizedBox(height: 4,),
                Row(children: [
                  SmallText(text: "₹30",textDecoration: TextDecoration.lineThrough,color: Colors.grey,),
                  SizedBox(width: 6,),
                  SmallText(text: "₹50",fontWeight: FontWeight.w700,),
                ],)
              ],
            ),
          ),
        );
      }),
    );

  }
}
