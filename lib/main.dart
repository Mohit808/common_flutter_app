import 'package:bot_toast/bot_toast.dart';
import 'package:common_flutter_app/CabBooking/booking_home.dart';
import 'package:common_flutter_app/CabBooking/pickup_wheel_screen.dart';
import 'package:common_flutter_app/a_seller/ai_upload_screen.dart';
import 'package:common_flutter_app/a_seller/become_seller/become_seller_screen.dart';
import 'package:common_flutter_app/a_seller/business_details/business_detail_screen.dart';
import 'package:common_flutter_app/a_seller/start_listing_screen.dart';
import 'package:common_flutter_app/a_seller/store_feature_screen.dart';
import 'package:common_flutter_app/a_share_wheels/share_wheel_home.dart';
import 'package:common_flutter_app/category_details_screen.dart';
import 'package:common_flutter_app/common_widgets/categories_page.dart';
import 'package:common_flutter_app/dashboard_screen.dart';
import 'package:common_flutter_app/delivery_parner/onboarding/delivery_onboarding_screen.dart';
import 'package:common_flutter_app/product_detail_screen.dart';
import 'package:common_flutter_app/screens/address/add_address_screen.dart';
import 'package:common_flutter_app/screens/orders/order_screen.dart';
import 'package:common_flutter_app/screens/search_screen/search_screen.dart';
import 'package:common_flutter_app/screens/store_details/store_detail_screen.dart';
import 'package:common_flutter_app/utils/app_const.dart';
import 'package:common_flutter_app/utils/app_images.dart';
import 'package:common_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/banner_widget.dart';
import 'package:modular_ui_package/common_widget/button_single_atom.dart';
import 'package:modular_ui_package/common_widget/category_widget.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/common_widget/header/header_see_all_widget.dart';
import 'package:modular_ui_package/common_widget/header/header_with_line_widget.dart';
import 'package:modular_ui_package/common_widget/textfield_atom.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';
import 'package:modular_ui_package/theme/app_sizes.dart';
import 'package:modular_ui_package/utils/app_images.dart';
import 'package:modular_ui_package/utils/utils.dart';

import 'CabBooking/driver/home_driver_screen.dart';
import 'a_seller/build_digital_store_screen.dart';
import 'a_seller/home/seller_home_screen.dart';
import 'a_seller/address/start_address_screen.dart';
import 'a_share_wheels/share_wheel_order_history.dart';
import 'delivery_parner/home/delivery_home_screen.dart';
import 'delivery_parner/login/delivery_login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Utils().init(colorCode: 0xFFBF360C,radius: AppSizes.h_10);
  await Utils().initialize();
  AppConst.init();
  AppUtils().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: BotToastInit(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: false,
        progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
        primarySwatch: AppColors.materialColor,
      ),
      // home: BecomeSellerScreen(),
      home: box.read(AppUtils.fullAddress)==null ? AddAddressScreen(initial: true,): DashboardScreen(),
      // home: InventoryScreen(),
      // home: OrderScreen(),
      // home: AiUploadScreen(),
      // home: SellerHomeScreen(),
      // home: SellerHomeScreen(),
      // home: StartAddressScreen(),
      // home: BuildDigitalStoreScreen(),
      // home: DeliveryLoginScreen(),
      // home: ShareWheelOrderHistory(),
      // home: StoreFeatureScreen(),
      // home: DeliveryLoginScreen(),
      // home: DeliveryHomeScreen(),
      // home: DeliveryOnboardingScreen(),
      // home: HomeDriverScreen(),
      // home: ShareWheelHome(),
      // home: PickupWheelScreen(),

    );
  }
}

