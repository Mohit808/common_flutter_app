import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: "Wallet",color: AppColors.scaffoldBackgroundColor,titleColor: Colors.black,elevation: 0,colorIconTheme: Colors.black54,),
      body: Column(children: [

        Container(padding: EdgeInsets.only(top: 16),decoration: BoxDecoration(color: AppColors.scaffoldBackgroundColor,borderRadius: BorderRadius.only(bottomRight: Radius.circular(16),bottomLeft: Radius.circular(16))),
          child: Padding(
            padding: AppPaddings.paddingAll16,
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.blue.withOpacity(0.1),borderRadius: BorderRadius.circular(10)),
                  child: Row(mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.wallet,size: 40,color: Colors.blue,),
                      SizedBox(width: 8,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: "Wallet Balance",color: Colors.blue,fontWeight: FontWeight.w400,),
                          SizedBox(height: 4,),
                          NormalHeadingText(text: "₹ 3,60,000",color: Colors.blue,),
                        ],
                      ),
                      SizedBox(width: 16,)
                    ],
                  ),
                ),
                Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(color:Colors.deepPurple.shade300.withOpacity(0.1),borderRadius: BorderRadius.circular(10)),
                  child: Row(mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.monetization_on_outlined,size: 40,color:Colors.deepPurple.shade300,),
                      SizedBox(width: 8,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SmallText(text: "Pending Amount",color:Colors.deepPurple.shade300,fontWeight: FontWeight.w400,),
                          SizedBox(height: 4,),
                          NormalHeadingText(text: "₹ 3,60,000",color: Colors.deepPurple.shade300,),
                        ],
                      ),
                      SizedBox(width: 16,)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 16,),
        Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Row(children: [
              SmallText(text: "All Transactions",fontWeight: FontWeight.w700,letterSpacing: 1,size: 14,),
              const SizedBox(width: 16,),
              Expanded(child: Container(width: double.infinity,height: 1,decoration: BoxDecoration(color: Colors.grey,gradient: LinearGradient(colors: [
                Colors.grey.shade400,
                Colors.transparent
              ],stops: [0,0.9])),))
            ],),
            SizedBox(height: 24,),
            ListView.builder(shrinkWrap: true,itemCount: 5,itemBuilder: (itemBuilder,index){
              return Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  SmallText(text: "Amit Yadav",fontWeight: FontWeight.w600,),
                  SmallText(text: index.isEven?"-  ₹ 1,600":"+  ₹ 4,800",fontWeight: FontWeight.w600,size: 14,color: index.isEven?Colors.red:Colors.green,),
                ],),
                SizedBox(height: 4,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                  SmallText(text: "Transaction Id : 0230231",color: Colors.black54,),
                  SmallText(text: "21 jun 2024",color: Colors.black54,),
                ],),
                SizedBox(height: 8,),
                Divider(),
                SizedBox(height: 8,)
              ],);
            })
          ],),
        )
      ],),
      persistentFooterButtons: [
       Row(children: [
         Expanded(child: ButtonSingleAtom(widget: "Withdraw",color: Colors.green.shade100,colorText: Colors.green)),
         SizedBox(width: 16,),
         Expanded(child: ButtonSingleAtom(widget: "Report",color: Colors.green,colorText: Colors.black54))
       ],)
      ],
    );
  }
}
