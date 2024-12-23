import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';

import '../common_function/calculate_cart_amount.dart';
import '../dashboard_screen.dart';
import 'item_widget.dart';

class CartSnackCommon{
  showCart(){
    return mapCart.isEmpty?null: [
      ContainerDecorated(color: Colors.green,
        child: Row(children: [
          SizedBox(width: 16,),
          SmallText(text: "${mapCart.keys.length} Item | ₹${CalculateCartAmount.calculate()}",color: Colors.white,fontWeight: FontWeight.w700,),
          Spacer(),
          InkWell(onTap: (){
            selectedIndexDashboard.value=2;
          },
            child: ContainerDecorated(paddingEdgeInsets: EdgeInsets.symmetric(vertical: 6,horizontal: 16),color: Colors.white,child: Row(
              children: [
                SmallText(text: "Go to Cart",fontWeight: FontWeight.w700,color: Colors.green,),
                SizedBox(width: 16,),
                ContainerDecorated(color: Colors.green,child: Icon(Icons.arrow_forward_ios_outlined,size: 10,color: Colors.white,))
              ],
            )),
          ),
          SizedBox(width: 8,),
        ],),
      )
    ];

  }
}