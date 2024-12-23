
class DeliveryOrderModel {
  DeliveryOrderModel({
      String? message,
      num? status,
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  DeliveryOrderModel.fromJson(dynamic json) {
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
DeliveryOrderModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => DeliveryOrderModel(  message: message ?? _message,
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

class Data {
  Data({
      num? id,
      String? storeName,
      String? storeLogo,
      String? storeAddress,
      String? storeLat,
      String? storeLng,
      String? customerName,
      String? customerImage,
      String? customerMobile,
      int? status,
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
      num? customer,
      num? deliveryPartner,
      List<num>? orderItem,}){
    _id = id;
    _storeName = storeName;
    _storeLogo = storeLogo;
    _storeAddress = storeAddress;
    _storeLat = storeLat;
    _storeLng = storeLng;
    _customerName = customerName;
    _customerImage = customerImage;
    _customerMobile = customerMobile;
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
    _customer = customer;
    _deliveryPartner = deliveryPartner;
    _orderItem = orderItem;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _storeLogo = json['store_logo'];
    _storeAddress = json['store_address'];
    _storeLat = json['store_lat'];
    _storeLng = json['store_lng'];
    _customerName = json['customerName'];
    _customerImage = json['customerImage'];
    _customerMobile = json['customerMobile'];
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
    _customer = json['customer'];
    _deliveryPartner = json['deliveryPartner'];
    _orderItem = json['orderItem'] != null ? json['orderItem'].cast<num>() : [];
  }
  num? _id;
  String? _storeName;
  String? _storeLogo;
  String? _storeAddress;
  String? _storeLat;
  String? _storeLng;
  String? _customerName;
  String? _customerImage;
  String? _customerMobile;
  int? _status;
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
  num? _customer;
  num? _deliveryPartner;
  List<num>? _orderItem;
Data copyWith({  num? id,
  String? storeName,
  String? storeLogo,
  String? storeAddress,
  String? storeLat,
  String? storeLng,
  String? customerName,
  String? customerImage,
  String? customerMobile,
  int? status,
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
  num? customer,
  num? deliveryPartner,
  List<num>? orderItem,
}) => Data(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  storeLogo: storeLogo ?? _storeLogo,
  storeAddress: storeAddress ?? _storeAddress,
  storeLat: storeLat ?? _storeLat,
  storeLng: storeLng ?? _storeLng,
  customerName: customerName ?? _customerName,
  customerImage: customerImage ?? _customerImage,
  customerMobile: customerMobile ?? _customerMobile,
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
  customer: customer ?? _customer,
  deliveryPartner: deliveryPartner ?? _deliveryPartner,
  orderItem: orderItem ?? _orderItem,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get storeLogo => _storeLogo;
  String? get storeAddress => _storeAddress;
  String? get storeLat => _storeLat;
  String? get storeLng => _storeLng;
  String? get customerName => _customerName;
  String? get customerImage => _customerImage;
  String? get customerMobile => _customerMobile;
  int? get status => _status;
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
  num? get customer => _customer;
  num? get deliveryPartner => _deliveryPartner;
  List<num>? get orderItem => _orderItem;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['store_logo'] = _storeLogo;
    map['store_address'] = _storeAddress;
    map['store_lat'] = _storeLat;
    map['store_lng'] = _storeLng;
    map['customerName'] = _customerName;
    map['customerImage'] = _customerImage;
    map['customerMobile'] = _customerMobile;
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
    map['customer'] = _customer;
    map['deliveryPartner'] = _deliveryPartner;
    map['orderItem'] = _orderItem;
    return map;
  }

}