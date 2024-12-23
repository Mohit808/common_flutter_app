import 'package:common_flutter_app/models/order_model_common.dart';

class CalculateItemPrice{
  calculate(List<OrderItem> orderItem){
    List<double> list=orderItem.map((toElement)=>toElement.qty!.toInt()* (double.parse(toElement.discountedPrice??toElement.price!))).toList();
    num sum = list.reduce((a, b) => a + b);
    return sum;
  }
}