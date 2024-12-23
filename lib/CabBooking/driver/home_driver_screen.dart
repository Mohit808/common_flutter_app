import 'package:common_flutter_app/CabBooking/PolyForDriverFunction.dart';
import 'package:common_flutter_app/CabBooking/driver/controller_driver_home.dart';
import 'package:common_flutter_app/CabBooking/waiting_for_driver_screen.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/network_widgets/loading_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/no_data_widget.dart';
import 'package:modular_ui_package/common_widget/network_widgets/something_went_wrong_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/network_handling/api_response.dart';
import 'package:modular_ui_package/utils/utils.dart';

class HomeDriverScreen extends StatelessWidget {
  const HomeDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(init: ControllerDriverHome(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBarCommon(title: NormalHeadingText(text: "Share Wheels Driver",fontWeight: FontWeight.w700,color: Colors.black,size: 16,),color: AppColors.scaffoldBackgroundColor,elevation: 0,),
          body:

              controller.apiResponse.status==Status.LOADING?LoadingWidget(center: true,):
              controller.apiResponse.status==Status.ERROR?SomethingWentWrongWidget(center: true,msg: controller.apiResponse.message,):
                  controller.list.isEmpty?NoDataWidget(center: true,):

          ListView.builder(shrinkWrap: true,itemCount: controller.list.length,itemBuilder: (itemBuilder,index){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              child: ContainerDecorated(padding: 8,color: Colors.white,colorBorder: Colors.grey.shade300,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  Row(
                    children: [
                      ContainerDecorated(padding: 0,borderRadius: 30,child: NetworkOrAssetImage(src: AppImages.userBeared,height: 40,width: 40,fit: BoxFit.cover,)),
                      SizedBox(width: 16,),
                      Row(
                        children: [
                          NormalText(text: "Amit Yadav",fontWeight: FontWeight.w600,),
                          // Column(crossAxisAlignment: CrossAxisAlignment.start,
                          //   children: [
                          //     SmallText(text: "4 KM | 14 min away"),
                          //     SmallText(text: "Rs 120"),
                          //   ],
                          // ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ContainerDecorated(color: Colors.grey.shade50,
                      child: Row(children: [
                        Column(mainAxisSize: MainAxisSize.min,children: [
                          ContainerDecorated(color: Colors.green,borderRadius: 40,padding: 4,child: Icon(Icons.arrow_upward_outlined,size: 16,color: Colors.white,)),
                          Container(height: 24,width: 2,decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),),
                          ContainerDecorated(color: Colors.green.withOpacity(0.1),borderRadius: 40,padding: 8,child: ContainerDecorated(color: Colors.green,))
                        ],),
                        SizedBox(width: 16,),
                        Expanded(
                          child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisSize: MainAxisSize.min,children: [
                            // searchBar(controller.textEditingController, controller),
                            SmallText(text: "From",fontWeight: FontWeight.w500,color: Colors.black54,),
                            SizedBox(height: 4,),
                            SmallText(text: "${controller.list[index].addressFrom}",fontWeight: FontWeight.w500,color: Colors.black54,),
                            // SizedBox(height: 16,),
                            Divider(),

                            SmallText(text: "To",fontWeight: FontWeight.w500,color: Colors.black54),
                            SizedBox(height: 4,),
                            InkWell(onTap: (){
                            },child: SmallText(text: "${controller.list[index].addressTo}",color: Colors.black,fontWeight: FontWeight.w500,)),
                          ],),
                        ),
                      ],),
                    ),
                  ),
                  SizedBox(height: 16,),
                  ContainerDecorated(padding: 8,colorBorder: Colors.grey.shade300,color: AppColors.scaffoldBackgroundColor,
                    child: Row(mainAxisSize: MainAxisSize.min,children: [
                      Icon(Icons.map,size: 20,),
                      SizedBox(width: 8,),
                      SmallText(text: "Check from Map",fontWeight: FontWeight.w500,)
                    ],),
                  ),
                  SizedBox(height: 16,),
                  Row(children: [
                    SizedBox(width: 8,),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SmallText(text: "${controller.list[index].distance} KM | ${controller.list[index].time} min",fontWeight: FontWeight.w500,color: Colors.black54,),
                        NormalHeadingText(text: "₹ ${controller.list[index].price}",fontWeight: FontWeight.w600,),
                      ],
                    )),
                    SizedBox(width: 16,),
                    Expanded(child: ButtonSingleAtom(widget: "Accept",color: Colors.green,tap: () async {
                      showLoading();
                      await Polyfordriverfunction.makePolyLine(30.6935617, 76.8877217,  30.700317779725122, 76.8575543537736);
                      closeLoading();
                      Get.to(()=>WaitingForDriverScreen(addFrom: "57, sector 31, nada sahib, haryana,",latitudeFrom: 30.6935617,longitudeFrom: 76.8877217,latitudeTo: 30.700317779725122,longitudeTo: 76.8575543537736,addTo: "sector 5, panchkula",));
                    },))
                  ],)
                ],),
              ),
            );
          }),
        );
      }
    );
  }
}
