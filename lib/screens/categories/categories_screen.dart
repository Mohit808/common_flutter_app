import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_widget/appbar_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/theme/app_paddings.dart';

import '../../common_widgets/categories_page.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCommon(elevation: 0,titleColor: Colors.black,color: AppColors.scaffoldBackgroundColor,centerTitle: false,title: "Categories",actions: [
        Icon(Icons.search),
        SizedBox(width: 16,)
      ],),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPaddings.paddingAll16,
          child: Column(children: [
            CategoriesPage()
          ],),
        ),
      ),
    );
  }
}
