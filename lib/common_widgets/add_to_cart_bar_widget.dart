import 'package:common_flutter_app/common_widgets/plus_minus_widget.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';

import 'item_widget.dart';

class AddToCartBarWidget extends StatelessWidget {
  const AddToCartBarWidget({super.key, this.id, this.controller, this.item});
  final dynamic id;
  final dynamic controller;
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return
    Expanded(flex: 5,child:
    mapCart.containsKey(id)?
        PlusMinusWidget(id: id,controller:controller):
    InkWell(onTap: (){

      mapCart[id]={"qty":1,"item":item};
      controller.update();
    },child: ContainerDecorated(color: Colors.white,colorBorder: Colors.grey.shade200,paddingEdgeInsets: EdgeInsets.symmetric(vertical: 8),child: Center(child: NormalText(text: "ADD",color: Colors.green,fontWeight: FontWeight.bold,)),)));
  }
}
