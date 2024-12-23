import '../common_widgets/item_widget.dart';
import '../models/home_model.dart';

class CalculateCartAmount{
  static var totalAmount=0.0;
  static var totalMrp=0.0;

  static calculate(){
    totalAmount=0.0;
    mapCart.forEach((key,value){
      Data data=Data.fromJson(value['item']);
      var qty=mapCart[key]['qty'];
      var exactPrice=data.discountedPrice??data.price;
      var totalSingle=exactPrice! * qty;
      totalAmount=totalAmount+totalSingle;
    });
    return totalAmount;
  }
  static calculateMrp(){
    totalMrp=0.0;
    mapCart.forEach((key,value){
      Data data=Data.fromJson(value['item']);
      var qty=mapCart[key]['qty'];
      var exactPrice=data.price;
      var totalSingle=exactPrice! * qty;
      totalMrp=totalMrp+totalSingle;
    });
    return totalMrp;
  }
}