
class SellerOrderModel {
  SellerOrderModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  SellerOrderModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  String? _message;
  num? _status;
  List<Data>? _data;
SellerOrderModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => SellerOrderModel(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// store_name : "Kanchan kirana store and general merchant"
/// store_logo : "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext="
/// orderItem : [{"id":188,"product_name":"Shampoo","discounted_price":null,"price":"200.0","product_image":"http://127.0.0.1:8000/product_images/luxury-cosmetic-products-design.png","qty":1,"product":3,"store":1}]
/// deliveryPartner : {"id":25,"name":"Vaibhav","image_url":null,"bike":"","phone_number":"0"}
/// customer : {"id":1,"customer_name":"Amit Yadav","customer_image":"http://127.0.0.1:8000/mind_zsofHXn.png","mobile":"","email":"amityadav15@gmail.com"}
/// otp : "345678"
/// status : 1
/// statusName : "Accepted by delivery partner"
/// tip : 20.0
/// address_type : "Home"
/// address_title : "address"
/// full_address : "full_address"
/// house_no : "house_no"
/// area : "area"
/// landmark : "landmark"
/// instruction : "instruction"
/// latitude : 0.0
/// longitude : 0.0
/// created_at : "2024-12-09T18:36:21.257705Z"
/// updated_at : "2024-12-14T15:47:21.705592Z"
/// store : 25

class Data {
  Data({
      num? id, 
      String? storeName, 
      String? storeLogo, 
      List<OrderItem>? orderItem, 
      DeliveryPartner? deliveryPartner, 
      Customer? customer, 
      String? otp, 
      num? status, 
      String? statusName, 
      num? tip, 
      String? addressType, 
      String? addressTitle, 
      String? fullAddress, 
      String? houseNo, 
      String? area, 
      String? landmark, 
      String? instruction, 
      num? latitude, 
      num? longitude, 
      String? createdAt, 
      String? updatedAt, 
      num? store,}){
    _id = id;
    _storeName = storeName;
    _storeLogo = storeLogo;
    _orderItem = orderItem;
    _deliveryPartner = deliveryPartner;
    _customer = customer;
    _otp = otp;
    _status = status;
    _statusName = statusName;
    _tip = tip;
    _addressType = addressType;
    _addressTitle = addressTitle;
    _fullAddress = fullAddress;
    _houseNo = houseNo;
    _area = area;
    _landmark = landmark;
    _instruction = instruction;
    _latitude = latitude;
    _longitude = longitude;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _store = store;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _storeLogo = json['store_logo'];
    if (json['orderItem'] != null) {
      _orderItem = [];
      json['orderItem'].forEach((v) {
        _orderItem?.add(OrderItem.fromJson(v));
      });
    }
    _deliveryPartner = json['deliveryPartner'] != null ? DeliveryPartner.fromJson(json['deliveryPartner']) : null;
    _customer = json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    _otp = json['otp'];
    _status = json['status'];
    _statusName = json['statusName'];
    _tip = json['tip'];
    _addressType = json['address_type'];
    _addressTitle = json['address_title'];
    _fullAddress = json['full_address'];
    _houseNo = json['house_no'];
    _area = json['area'];
    _landmark = json['landmark'];
    _instruction = json['instruction'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _store = json['store'];
  }
  num? _id;
  String? _storeName;
  String? _storeLogo;
  List<OrderItem>? _orderItem;
  DeliveryPartner? _deliveryPartner;
  Customer? _customer;
  String? _otp;
  num? _status;
  String? _statusName;
  num? _tip;
  String? _addressType;
  String? _addressTitle;
  String? _fullAddress;
  String? _houseNo;
  String? _area;
  String? _landmark;
  String? _instruction;
  num? _latitude;
  num? _longitude;
  String? _createdAt;
  String? _updatedAt;
  num? _store;
Data copyWith({  num? id,
  String? storeName,
  String? storeLogo,
  List<OrderItem>? orderItem,
  DeliveryPartner? deliveryPartner,
  Customer? customer,
  String? otp,
  num? status,
  String? statusName,
  num? tip,
  String? addressType,
  String? addressTitle,
  String? fullAddress,
  String? houseNo,
  String? area,
  String? landmark,
  String? instruction,
  num? latitude,
  num? longitude,
  String? createdAt,
  String? updatedAt,
  num? store,
}) => Data(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  storeLogo: storeLogo ?? _storeLogo,
  orderItem: orderItem ?? _orderItem,
  deliveryPartner: deliveryPartner ?? _deliveryPartner,
  customer: customer ?? _customer,
  otp: otp ?? _otp,
  status: status ?? _status,
  statusName: statusName ?? _statusName,
  tip: tip ?? _tip,
  addressType: addressType ?? _addressType,
  addressTitle: addressTitle ?? _addressTitle,
  fullAddress: fullAddress ?? _fullAddress,
  houseNo: houseNo ?? _houseNo,
  area: area ?? _area,
  landmark: landmark ?? _landmark,
  instruction: instruction ?? _instruction,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  store: store ?? _store,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get storeLogo => _storeLogo;
  List<OrderItem>? get orderItem => _orderItem;
  DeliveryPartner? get deliveryPartner => _deliveryPartner;
  Customer? get customer => _customer;
  String? get otp => _otp;
  num? get status => _status;
  String? get statusName => _statusName;
  num? get tip => _tip;
  String? get addressType => _addressType;
  String? get addressTitle => _addressTitle;
  String? get fullAddress => _fullAddress;
  String? get houseNo => _houseNo;
  String? get area => _area;
  String? get landmark => _landmark;
  String? get instruction => _instruction;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get store => _store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['store_logo'] = _storeLogo;
    if (_orderItem != null) {
      map['orderItem'] = _orderItem?.map((v) => v.toJson()).toList();
    }
    if (_deliveryPartner != null) {
      map['deliveryPartner'] = _deliveryPartner?.toJson();
    }
    if (_customer != null) {
      map['customer'] = _customer?.toJson();
    }
    map['otp'] = _otp;
    map['status'] = _status;
    map['statusName'] = _statusName;
    map['tip'] = _tip;
    map['address_type'] = _addressType;
    map['address_title'] = _addressTitle;
    map['full_address'] = _fullAddress;
    map['house_no'] = _houseNo;
    map['area'] = _area;
    map['landmark'] = _landmark;
    map['instruction'] = _instruction;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['store'] = _store;
    return map;
  }

}

/// id : 1
/// customer_name : "Amit Yadav"
/// customer_image : "http://127.0.0.1:8000/mind_zsofHXn.png"
/// mobile : ""
/// email : "amityadav15@gmail.com"

class Customer {
  Customer({
      num? id, 
      String? customerName, 
      String? customerImage, 
      String? mobile, 
      String? email,}){
    _id = id;
    _customerName = customerName;
    _customerImage = customerImage;
    _mobile = mobile;
    _email = email;
}

  Customer.fromJson(dynamic json) {
    _id = json['id'];
    _customerName = json['customer_name'];
    _customerImage = json['customer_image'];
    _mobile = json['mobile'];
    _email = json['email'];
  }
  num? _id;
  String? _customerName;
  String? _customerImage;
  String? _mobile;
  String? _email;
Customer copyWith({  num? id,
  String? customerName,
  String? customerImage,
  String? mobile,
  String? email,
}) => Customer(  id: id ?? _id,
  customerName: customerName ?? _customerName,
  customerImage: customerImage ?? _customerImage,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
);
  num? get id => _id;
  String? get customerName => _customerName;
  String? get customerImage => _customerImage;
  String? get mobile => _mobile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['customer_name'] = _customerName;
    map['customer_image'] = _customerImage;
    map['mobile'] = _mobile;
    map['email'] = _email;
    return map;
  }

}

/// id : 25
/// name : "Vaibhav"
/// image_url : null
/// bike : ""
/// phone_number : "0"

class DeliveryPartner {
  DeliveryPartner({
      num? id, 
      String? name, 
      dynamic imageUrl, 
      String? bike, 
      String? phoneNumber,}){
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
    _bike = bike;
    _phoneNumber = phoneNumber;
}

  DeliveryPartner.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
    _bike = json['bike'];
    _phoneNumber = json['phone_number'];
  }
  num? _id;
  String? _name;
  dynamic _imageUrl;
  String? _bike;
  String? _phoneNumber;
DeliveryPartner copyWith({  num? id,
  String? name,
  dynamic imageUrl,
  String? bike,
  String? phoneNumber,
}) => DeliveryPartner(  id: id ?? _id,
  name: name ?? _name,
  imageUrl: imageUrl ?? _imageUrl,
  bike: bike ?? _bike,
  phoneNumber: phoneNumber ?? _phoneNumber,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get imageUrl => _imageUrl;
  String? get bike => _bike;
  String? get phoneNumber => _phoneNumber;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_url'] = _imageUrl;
    map['bike'] = _bike;
    map['phone_number'] = _phoneNumber;
    return map;
  }

}

/// id : 188
/// product_name : "Shampoo"
/// discounted_price : null
/// price : "200.0"
/// product_image : "http://127.0.0.1:8000/product_images/luxury-cosmetic-products-design.png"
/// qty : 1
/// product : 3
/// store : 1

class OrderItem {
  OrderItem({
      num? id, 
      String? productName, 
      dynamic discountedPrice, 
      String? price, 
      String? productImage, 
      num? qty, 
      num? product, 
      num? store,}){
    _id = id;
    _productName = productName;
    _discountedPrice = discountedPrice;
    _price = price;
    _productImage = productImage;
    _qty = qty;
    _product = product;
    _store = store;
}

  OrderItem.fromJson(dynamic json) {
    _id = json['id'];
    _productName = json['product_name'];
    _discountedPrice = json['discounted_price'];
    _price = json['price'];
    _productImage = json['product_image'];
    _qty = json['qty'];
    _product = json['product'];
    _store = json['store'];
  }
  num? _id;
  String? _productName;
  dynamic _discountedPrice;
  String? _price;
  String? _productImage;
  num? _qty;
  num? _product;
  num? _store;
OrderItem copyWith({  num? id,
  String? productName,
  dynamic discountedPrice,
  String? price,
  String? productImage,
  num? qty,
  num? product,
  num? store,
}) => OrderItem(  id: id ?? _id,
  productName: productName ?? _productName,
  discountedPrice: discountedPrice ?? _discountedPrice,
  price: price ?? _price,
  productImage: productImage ?? _productImage,
  qty: qty ?? _qty,
  product: product ?? _product,
  store: store ?? _store,
);
  num? get id => _id;
  String? get productName => _productName;
  dynamic get discountedPrice => _discountedPrice;
  String? get price => _price;
  String? get productImage => _productImage;
  num? get qty => _qty;
  num? get product => _product;
  num? get store => _store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_name'] = _productName;
    map['discounted_price'] = _discountedPrice;
    map['price'] = _price;
    map['product_image'] = _productImage;
    map['qty'] = _qty;
    map['product'] = _product;
    map['store'] = _store;
    return map;
  }

}