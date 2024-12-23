/// message : "Categories fetched successfully"
/// status : 200
/// data : [{"id":1,"name":"Fresh vegetables","image":"http://127.0.0.1:8000/product_images/vegi.webp","description":"fresh vegi and fruits","main_category":1}]

class CategoryModel {
  CategoryModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CategoryModel.fromJson(dynamic json) {
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
CategoryModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => CategoryModel(  message: message ?? _message,
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
/// name : "Fresh vegetables"
/// image : "http://127.0.0.1:8000/product_images/vegi.webp"
/// description : "fresh vegi and fruits"
/// main_category : 1

class Data {
  Data({
      num? id, 
      String? name, 
      String? image, 
      String? description, 
      num? mainCategory,}){
    _id = id;
    _name = name;
    _image = image;
    _description = description;
    _mainCategory = mainCategory;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
    _mainCategory = json['main_category'];
  }
  num? _id;
  String? _name;
  String? _image;
  String? _description;
  num? _mainCategory;
Data copyWith({  num? id,
  String? name,
  String? image,
  String? description,
  num? mainCategory,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
  mainCategory: mainCategory ?? _mainCategory,
);
  num? get id => _id;
  String? get name => _name;
  String? get image => _image;
  String? get description => _description;
  num? get mainCategory => _mainCategory;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    map['main_category'] = _mainCategory;
    return map;
  }

}