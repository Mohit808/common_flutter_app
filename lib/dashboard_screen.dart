import 'package:common_flutter_app/screens/cart/cart_screen.dart';
import 'package:common_flutter_app/screens/categories/categories_screen.dart';
import 'package:common_flutter_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:modular_ui_package/theme/app_colors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

RxInt selectedIndexDashboard=0.obs;

class _DashboardScreenState extends State<DashboardScreen> {

  List list=[
    HomeScreen(),
    CategoriesScreen(),
    CartScreen()
  ];

  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Colors.red
    // ));
  }

  @override
  Widget build(BuildContext context) {

    return Obx(()=>Scaffold(
      body: list[selectedIndexDashboard.value],
      bottomNavigationBar: BottomNavigationBar(currentIndex: selectedIndexDashboard.value,onTap: (value){
        selectedIndexDashboard.value=value;
      },items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category),label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Cart"),
      ]),
    ));
  }
}
