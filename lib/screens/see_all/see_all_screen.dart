import 'package:common_flutter_app/common_widgets/item_widget_vertical.dart';
import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/common_widget/container_decorated.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

import '../../common_widgets/cart_snack_common.dart';

class SeeAllScreen extends StatelessWidget {
  const SeeAllScreen({super.key, required this.title, this.categoryId, this.variantId, this.brandId});
  final String title;
  final dynamic variantId;
  final dynamic categoryId;
  final dynamic brandId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(title: title,titleColor: Colors.black,color: AppColors.scaffoldBackgroundColor,elevation: 0,),
      body: SingleChildScrollView(
        child: ContainerDecorated(
          child: ItemWidgetVertical(variantId: variantId, categoryId: categoryId,brandId: brandId,),
        ),
      ),
      persistentFooterButtons: CartSnackCommon().showCart(),
    );
  }
}
