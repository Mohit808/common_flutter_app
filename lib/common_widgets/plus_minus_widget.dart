import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';

import 'item_widget.dart';

class PlusMinusWidget extends StatelessWidget {
  const PlusMinusWidget({super.key, this.id, this.controller, this.removeId});
  final dynamic id;
  final dynamic controller;
  final Function(int index)? removeId;

  @override
  Widget build(BuildContext context) {
    return ContainerDecorated(color: Colors.white,padding: 0,colorBorder: Colors.grey.shade200,child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [

      Expanded(
        child: InkWell(onTap: (){
          if(mapCart[id]['qty']==1){
            mapCart.remove(id);
            if(removeId!=null) removeId!.call(id);
          }else{
            print(mapCart[id]);
            mapCart[id]['qty']=mapCart[id]['qty']-1;
          }
          controller.update();
        },child: ContainerDecorated(color: Colors.white,padding: 7,child: NormalText(text: "-",color: Colors.green,fontWeight: FontWeight.bold,)
        )),),

      NormalText(text: "${mapCart[id]['qty']}",color: Colors.green,fontWeight: FontWeight.bold,),
      Expanded(
        child: ContainerDecorated(
          paddingEdgeInsets: EdgeInsets.only(top: 7,bottom: 7,right: 4),color: Colors.white,
          child: InkWell(onTap: (){
            if(mapCart[id]['qty']==99) return;
            mapCart[id]['qty']=mapCart[id]['qty']+1;
            controller.update();
          },child: Align(alignment: AlignmentDirectional.centerEnd,child: NormalText(text: "+ ",color: Colors.green,fontWeight: FontWeight.bold,))),
        ),
      )
    ],),);
  }
}
