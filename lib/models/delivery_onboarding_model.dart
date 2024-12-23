
class DeliveryOnboardingModel {
  DeliveryOnboardingModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  DeliveryOnboardingModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
DeliveryOnboardingModel copyWith({  String? message,
  num? status,
  Data? data,
}) => DeliveryOnboardingModel(  message: message ?? _message,
  status: status ?? _status,
  data: data ?? _data,
);
  String? get message => _message;
  num? get status => _status;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    map['status'] = _status;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 25
/// name : "Vaibhav"
/// image : null
/// phone_number : "0"
/// email : ""
/// aadhaar : 0
/// bike : ""
/// address : ""
/// latitude : 0.0
/// longitude : 0.0

class Data {
  Data({
      num? id, 
      String? name, 
      dynamic image, 
      String? phoneNumber, 
      String? email, 
      num? aadhaar, 
      String? bike, 
      String? address, 
      num? latitude, 
      num? longitude,}){
    _id = id;
    _name = name;
    _image = image;
    _phoneNumber = phoneNumber;
    _email = email;
    _aadhaar = aadhaar;
    _bike = bike;
    _address = address;
    _latitude = latitude;
    _longitude = longitude;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _phoneNumber = json['phone_number'];
    _email = json['email'];
    _aadhaar = json['aadhaar'];
    _bike = json['bike'];
    _address = json['address'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _phoneNumber;
  String? _email;
  num? _aadhaar;
  String? _bike;
  String? _address;
  num? _latitude;
  num? _longitude;
Data copyWith({  num? id,
  String? name,
  dynamic image,
  String? phoneNumber,
  String? email,
  num? aadhaar,
  String? bike,
  String? address,
  num? latitude,
  num? longitude,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  phoneNumber: phoneNumber ?? _phoneNumber,
  email: email ?? _email,
  aadhaar: aadhaar ?? _aadhaar,
  bike: bike ?? _bike,
  address: address ?? _address,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get phoneNumber => _phoneNumber;
  String? get email => _email;
  num? get aadhaar => _aadhaar;
  String? get bike => _bike;
  String? get address => _address;
  num? get latitude => _latitude;
  num? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['phone_number'] = _phoneNumber;
    map['email'] = _email;
    map['aadhaar'] = _aadhaar;
    map['bike'] = _bike;
    map['address'] = _address;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}