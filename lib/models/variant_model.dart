
class VariantModel {
  VariantModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  VariantModel.fromJson(dynamic json) {
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
VariantModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => VariantModel(  message: message ?? _message,
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
      String? name, 
      String? image, 
      String? description, 
      num? category,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _category = json['category'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _description;
  num? _category;
Data copyWith({  num? id,
  String? name,
  String? image,
  String? description,
  num? category,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  category: category ?? _category,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  num? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['category'] = _category;
    return map;
  }

}