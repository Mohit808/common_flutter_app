/// message : "Address Fetched sucessfully"
/// status : 200
/// data : [{"id":1,"address_type":"Home","full_address":"Sector 80, panchkula, India","house_no":"","area":"","landmark":"","instruction":"","latitude":28.0,"longitude":78.0,"customer":1},{"id":2,"address_type":"Home","full_address":"full_address","house_no":"","area":"","landmark":"","instruction":"","latitude":23.0,"longitude":78.0,"customer":1},{"id":3,"address_type":"Home","full_address":"full_address","house_no":"","area":"","landmark":"","instruction":"","latitude":23.0,"longitude":78.0,"customer":1}]

class AddressModel {
  AddressModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  AddressModel.fromJson(dynamic json) {
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
AddressModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => AddressModel(  message: message ?? _message,
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
/// address_type : "Home"
/// full_address : "Sector 80, panchkula, India"
/// house_no : ""
/// area : ""
/// landmark : ""
/// instruction : ""
/// latitude : 28.0
/// longitude : 78.0
/// customer : 1

class Data {
  Data({
      num? id, 
      String? addressType, 
      String? fullAddress, 
      String? houseNo, 
      String? area, 
      String? landmark, 
      String? instruction, 
      num? latitude, 
      num? longitude, 
      num? customer,}){
    _id = id;
    _addressType = addressType;
    _fullAddress = fullAddress;
    _houseNo = houseNo;
    _area = area;
    _landmark = landmark;
    _instruction = instruction;
    _latitude = latitude;
    _longitude = longitude;
    _customer = customer;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _addressType = json['address_type'];
    _fullAddress = json['full_address'];
    _houseNo = json['house_no'];
    _area = json['area'];
    _landmark = json['landmark'];
    _instruction = json['instruction'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _customer = json['customer'];
  }
  num? _id;
  String? _addressType;
  String? _fullAddress;
  String? _houseNo;
  String? _area;
  String? _landmark;
  String? _instruction;
  num? _latitude;
  num? _longitude;
  num? _customer;
Data copyWith({  num? id,
  String? addressType,
  String? fullAddress,
  String? houseNo,
  String? area,
  String? landmark,
  String? instruction,
  num? latitude,
  num? longitude,
  num? customer,
}) => Data(  id: id ?? _id,
  addressType: addressType ?? _addressType,
  fullAddress: fullAddress ?? _fullAddress,
  houseNo: houseNo ?? _houseNo,
  area: area ?? _area,
  landmark: landmark ?? _landmark,
  instruction: instruction ?? _instruction,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  customer: customer ?? _customer,
);
  num? get id => _id;
  String? get addressType => _addressType;
  String? get fullAddress => _fullAddress;
  String? get houseNo => _houseNo;
  String? get area => _area;
  String? get landmark => _landmark;
  String? get instruction => _instruction;
  num? get latitude => _latitude;
  num? get longitude => _longitude;
  num? get customer => _customer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['address_type'] = _addressType;
    map['full_address'] = _fullAddress;
    map['house_no'] = _houseNo;
    map['area'] = _area;
    map['landmark'] = _landmark;
    map['instruction'] = _instruction;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['customer'] = _customer;
    return map;
  }

}