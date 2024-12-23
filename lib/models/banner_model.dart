/// message : "Banner Fetched sucessfully"
/// status : 200
/// data : [{"id":1,"name":"Monsoon's Exotic Harvest!","description":"Up to 30% OFF on fruits that are too good to last forever","image":"http://127.0.0.1:8000/pngwing.com_6.png","priority":0,"startColor":"0xFFf9c58d","endColor":"0xFFf492f0","category":1,"store":2}]

class BannerModel {
  BannerModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  BannerModel.fromJson(dynamic json) {
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
BannerModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => BannerModel(  message: message ?? _message,
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
/// name : "Monsoon's Exotic Harvest!"
/// description : "Up to 30% OFF on fruits that are too good to last forever"
/// image : "http://127.0.0.1:8000/pngwing.com_6.png"
/// priority : 0
/// startColor : "0xFFf9c58d"
/// endColor : "0xFFf492f0"
/// category : 1
/// store : 2

class Data {
  Data({
      num? id, 
      String? name, 
      String? description, 
      String? image, 
      num? priority, 
      String? startColor, 
      String? endColor, 
      num? category, 
      num? store,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _priority = priority;
    _startColor = startColor;
    _endColor = endColor;
    _category = category;
    _store = store;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _priority = json['priority'];
    _startColor = json['startColor'];
    _endColor = json['endColor'];
    _category = json['category'];
    _store = json['store'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _image;
  num? _priority;
  String? _startColor;
  String? _endColor;
  num? _category;
  num? _store;
Data copyWith({  num? id,
  String? name,
  String? description,
  String? image,
  num? priority,
  String? startColor,
  String? endColor,
  num? category,
  num? store,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  priority: priority ?? _priority,
  startColor: startColor ?? _startColor,
  endColor: endColor ?? _endColor,
  category: category ?? _category,
  store: store ?? _store,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  num? get priority => _priority;
  String? get startColor => _startColor;
  String? get endColor => _endColor;
  num? get category => _category;
  num? get store => _store;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['priority'] = _priority;
    map['startColor'] = _startColor;
    map['endColor'] = _endColor;
    map['category'] = _category;
    map['store'] = _store;
    return map;
  }

}