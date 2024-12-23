import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';

import 'controllers/controller_variant.dart';

class VariantTabWidget extends StatelessWidget {
  const VariantTabWidget({super.key,this.id, this.color, this.onTap, this.selectedTab});
  final id;
  final Color? color;
  final Function(int index)? onTap;
  final selectedTab;

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerVariant(id: id),
        builder: (controllerVariant) {
          return
            controllerVariant.apiResponse.status==Status.LOADING?Padding(
              padding: const EdgeInsets.all(16.0),
              child: LoadingWidget(center: true,),
            ):
            controllerVariant.apiResponse.status==Status.ERROR?Padding(
              padding: const EdgeInsets.all(16.0),
              child: SomethingWentWrongWidget(msg: controllerVariant.apiResponse.message,),
            ):
            controllerVariant.list.isEmpty?SizedBox():ContainerDecorated(padding: 0,color: color??Colors.white,
              child: SizedBox(height: 110,
                child:
                ListView.builder(scrollDirection: Axis.horizontal,itemCount: controllerVariant.list.length,itemBuilder: (itemBuilder,index){
                  return
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: InkWell(onTap: (){
                        if(onTap!=null) onTap!.call(index);
                      },
                        child: SizedBox(width: 60,
                          child: Column(
                            children: [
                              ContainerDecorated(borderRadius: 50,height: 60,width: 60,child: NetworkOrAssetImage(src: "${controllerVariant.list[index].image}",fit: BoxFit.cover,)),
                              SizedBox(height: 8,),
                              Expanded(child: SmallText(text: "${controllerVariant.list[index].name}",textAlign: TextAlign.center,fontWeight: FontWeight.w700,maxLine: 2,)),
                              SizedBox(height: 8,),

                              ContainerDecorated(height: 4,width: 60,color: index==selectedTab?AppColors.primary:null,)
                            ],
                          ),
                        ),
                      ),
                    );
                }),
              ),
            );
        }
    );
  }
}
