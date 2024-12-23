import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Help & Support",color: AppColors.scaffoldBackgroundColor,elevation: 0,titleColor: Colors.black,),
      body: Padding(
        padding:EdgeInsets.symmetric(vertical: 8,horizontal: 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          BigText20(text: "We are here to help you with anything and everything on Quick-Commerce",letterSpacing: 0.5,fontWeight: FontWeight.w500,),
          SizedBox(height: 16,),
          NormalText(text: "At Quick-commerce everything we expect at a day's start is you, better and happier than yesterday. We have got you covered. share you concern or check our frequently asked questions listed below.",color: Colors.black54,),
          SizedBox(height: 24,),
          ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8,horizontal: 16),borderRadius: 30,
            child: Row(children: [
              Icon(Icons.search),
              SizedBox(width: 16,),
              NormalText(text: "Search Help")
            ],),
          ),
          SizedBox(height: 24,),
          NormalHeadingText(text: "FAQ",fontWeight: FontWeight.w800,),
          ExpansionTile(tilePadding: EdgeInsets.zero,trailing: Icon(Icons.add),title: SmallText(text: "Why choose quick-commerce",color: Colors.black54,size: 14,)),
          ExpansionTile(tilePadding: EdgeInsets.zero,trailing: Icon(Icons.add),title: SmallText(text: "Why we are diffrent",color: Colors.black54,size: 14,)),
          ExpansionTile(tilePadding: EdgeInsets.zero,trailing: Icon(Icons.add),title: SmallText(text: "How much time it will take for withdraw",color: Colors.black54,size: 14,)),
        ],),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(mainAxisSize: MainAxisSize.min,children: [
          SmallText(text: "Still stuck? Help is a mail away",fontWeight: FontWeight.w600,size: 13,),
          SizedBox(height: 8,),
          ButtonSingleAtom(widget: "Send a message",)
        ],),
      ),
    );
  }
}
