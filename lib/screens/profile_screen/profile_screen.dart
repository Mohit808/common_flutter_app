import 'package:common_flutter_app/a_seller/build_digital_store_screen.dart';
import 'package:common_flutter_app/a_seller/home/seller_home_screen.dart';
import 'package:common_flutter_app/common_widgets/order_common_molecule/order_page_common.dart';
import 'package:common_flutter_app/delivery_parner/home/delivery_home_screen.dart';
import 'package:common_flutter_app/delivery_parner/login/delivery_login_screen.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:common_flutter_app/screens/auth/login_screen.dart';
import 'package:common_flutter_app/screens/orders/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/molecules/profile/widgets/log_out_widget.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/common_widget/dialog_logout.dart';
import 'package:modular_ui_package/utils/utils.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.deliveryCount});
  final dynamic deliveryCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarCommon(title: "Profile",color: Colors.white,elevation: 0,titleColor: Colors.black,centerTitle: false,),
      body:
      token.isEmpty?Center(child: LoginScreen(),):
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            Row(children: [
              ContainerDecorated(height: 60,width: 60,borderRadius: 40,child: NetworkOrAssetImage(src: AppImagesConst.user,),),
              SizedBox(width: 16,),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                  HeadingText(text: "Coffiestories"),
                  SizedBox(height: 2,),
                  SmallText(text: "Email: coffie@icloud.com",fontWeight: FontWeight.w600,color: Colors.grey,),
                  SizedBox(height: 2,),
                  SmallText(text: "Mob: 9876543210",fontWeight: FontWeight.w600,),
                ],),
              ),
              ContainerDecorated(color: AppColors.primary,child: Icon(Icons.edit,color: Colors.white,))
            ],),
            SizedBox(height:24,),
            deliveryCount==null?SizedBox():Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ContainerDecorated(padding: 16,color: Colors.green.withOpacity(0.1),child: Column(children: [
                NormalHeadingText(text: "You have $deliveryCount Delivery Pending",color: Colors.green,),
                SizedBox(height: 8,),
                ButtonSingleAtom(widget: "Go To Orders",color: Colors.green,tap: (){
                  Get.off(()=>OrderScreenCommon())!.then((onValue){
                  });
                },)
              ],),),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SmallText(text: "Inventories",color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 8,),
            ContainerDecorated(borderRadius: 16,child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                InkWell(onTap: (){
                  // Get.to(()=>DeliveryLoginScreen());
                  Get.to(()=>DeliveryHomeScreen());
                },child: commonRow(Icons.shopping_bag,"Delivery Partner")),

                Divider(height: 32,),

                InkWell(onTap: (){
                  Get.to(()=>SellerHomeScreen());
                  // Get.to(()=>BuildDigitalStoreScreen());
                },child: commonRow(Icons.shopping_bag,"Seller")),

                Divider(height: 32,),

                InkWell(onTap: (){
                  Get.to(()=>OrderScreenCommon(isCustomer: true,));
                },child: commonRow(Icons.shopping_bag,"Orders")),

                // SizedBox(height: 16,),
                Divider(height: 32,),
                InkWell(onTap: (){
                  Get.to(()=>AddAddressScreen());
                },child: commonRow(Icons.location_on,"Address")),
              ],),
            ),),



            SizedBox(height: 24,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: SmallText(text: "Help",color: Colors.black54,),
                ),
              ],
            ),
            SizedBox(height: 8,),
            ContainerDecorated(borderRadius: 16,child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                commonRow(Icons.support,"About Us"),
                Divider(height: 32,),
                commonRow(Icons.support_agent,"Support"),
                Divider(height: 32,),
                commonRow(Icons.privacy_tip_outlined,"Terms and Conditions"),
                Divider(height: 32,),
                commonRow(Icons.local_police_outlined,"Privacy Policy"),
              ],),
            ),),
            SizedBox(height: 24,),
            Divider(height: 32,),
            ContainerDecorated(onTap: (){
              Get.dialog(DialogLogout()).then((onValue){
                if(onValue!=null){
                  token="";
                  box.erase();
                  Get.back();
                }
              });
            },borderRadius: 16,child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                  ContainerDecorated(elevation: 2,borderRadius: 8,color: Colors.red.shade50,child: Icon(Icons.exit_to_app_rounded,size: 16,color: Colors.red,),),
                  SizedBox(width: 16,),
                  SmallText(text: "Logout",fontWeight: FontWeight.w600,color: Colors.red,)
                ],)
            )),
          ],),
        ),
      ),
    );
  }
  Widget commonRow(icon,text,{action}){
    return Row(children: [
      ContainerDecorated(elevation: 2,borderRadius: 8,color: Colors.white,child: Icon(icon,size: 16,color: AppColors.primary,),),
      SizedBox(width: 16,),
      SmallText(text: text),
      Spacer(),
      action??Icon(Icons.arrow_forward,color: AppColors.primary,size: 18,)
    ],);
  }
}
