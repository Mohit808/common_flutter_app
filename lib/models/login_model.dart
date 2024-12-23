/// message : "Signin successfully"
/// status : 200
/// data : {"token":"415c89bef31718b6adb476e007628d8ae3646563","user":{"id":2,"name":"Amit Yadav","image":null,"mobile":"","email":"a@b.com"}}

class LoginModel {
  LoginModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  LoginModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
LoginModel copyWith({  String? message,
  num? status,
  Data? data,
}) => LoginModel(  message: message ?? _message,
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

/// token : "415c89bef31718b6adb476e007628d8ae3646563"
/// user : {"id":2,"name":"Amit Yadav","image":null,"mobile":"","email":"a@b.com"}

class Data {
  Data({
      String? token, 
      User? user,}){
    _token = token;
    _user = user;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? _token;
  User? _user;
Data copyWith({  String? token,
  User? user,
}) => Data(  token: token ?? _token,
  user: user ?? _user,
);
  String? get token => _token;
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 2
/// name : "Amit Yadav"
/// image : null
/// mobile : ""
/// email : "a@b.com"

class User {
  User({
      num? id, 
      String? name, 
      dynamic image, 
      String? mobile, 
      String? email,}){
    _id = id;
    _name = name;
    _image = image;
    _mobile = mobile;
    _email = email;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _mobile = json['mobile'];
    _email = json['email'];
  }
  num? _id;
  String? _name;
  dynamic _image;
  String? _mobile;
  String? _email;
User copyWith({  num? id,
  String? name,
  dynamic image,
  String? mobile,
  String? email,
}) => User(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
);
  num? get id => _id;
  String? get name => _name;
  dynamic get image => _image;
  String? get mobile => _mobile;
  String? get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['mobile'] = _mobile;
    map['email'] = _email;
    return map;
  }

}