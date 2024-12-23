import 'package:modular_ui_package/utils/app_const.dart' as module_const;
class AppConst{
  static init(){
    module_const.AppConstModule.baseUrl = baseUrl;
  }
  AppConst(){
    init();
  }

  static String baseUrl="https://commonmodule.pythonanywhere.com/";
  static String sendOtp="send-otp";
  static String verifyOtp = "verify-otp";
  static String socialLogin = "social-login";
  // static String updateUserWater = "updateUserWater";
  // static String createProductWater = "createProductWater";
  // static String getMyProduct = "getMyProductWater";
  // static String getOrderSellerWater = "getOrderSellerWater";
  // static String getOrderCustomer = "getOrderCustomer";
  // static String getAllProduct = "getAllProduct";
  // static String orderNowWater = "orderNowWater";
  // static String updateOrderWater = "updateOrderWater";

  static String getMainCategories = "getMainCategories";
  static String getCategory = "getCategory";
  static String getDashboard = "getDashboard";
  static String getProducts = "getProducts";
  static String getVariants = "getVariants";
  static String getHotDeals = "getHotDeals";
  static String createOrders = "createOrders";
  static String getOrders = "getOrders";
  static String myAddress = "myAddress";
  static String getBanner = "getBanner";
  static String getStore = "getStore";
  static String getUniqueCategoryByStore = "getUniqueCategoryByStore";
  static String getBrands = "getBrands";
  static String getFestivalOffer = "getFestivalOffer";
  static String getVariantByFestival = "getVariantByFestival";
  static String getDeliveryOrders = "getDeliveryOrders";
  static String getMyDeliveryOrders = "getMyDeliveryOrders";
  static String createProduct = "createProduct";
  static String onboardDeliveryPartner = "onboardDeliveryPartner";
  static String acceptOrders = "acceptOrders";
  static String createSeller = "createSeller";
  static String createStore = "createStore";
  static String getSellerOrders = "getSellerOrders";

  static String updateLatLong = "update-lat-long";
  static String banner = "banner";
  static String signUp = "signUp";
  static String login = "login";


  static String wheelBookings = "wheelBookings";

}