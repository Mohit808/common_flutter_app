
class CategoriesModel {
  CategoriesModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CategoriesModel.fromJson(dynamic json) {
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
CategoriesModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => CategoriesModel(  message: message ?? _message,
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
/// categories : [{"id":1,"name":"Fresh vegetables","image":"https://commonmodule.pythonanywhere.com/product_images/vegi.webp","description":"fresh vegi and fruits","main_category":1},{"id":2,"name":"Fresh fruits","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG.png","description":"Fresh fruits","main_category":1},{"id":3,"name":"Dairy Bread and Eggs","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080653BqTE.png","description":"Eggs","main_category":1},{"id":4,"name":"Cereals and Breakfast","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080653BqTE_p1bLeVs.png","description":"breakfast","main_category":1},{"id":5,"name":"Atta Rice and dal","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080653BqTE_FyNbpMf.png","description":"atta","main_category":1},{"id":6,"name":"Masala and Dry Fruits","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_00QT2cb.png","description":"masal","main_category":1},{"id":7,"name":"Bakery","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_qUlh3Hn.png","description":"Bakery","main_category":1},{"id":8,"name":"Biscuits and Cakes","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_puYOELd.png","description":"buiscuit","main_category":1},{"id":9,"name":"Tea Coffee and More","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_6Wt5kFR.png","description":"tea","main_category":1},{"id":10,"name":"Kitchen and Dining","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_rV0Sc0j.png","description":"kitchen","main_category":1},{"id":11,"name":"Meat and Seafood","image":"https://commonmodule.pythonanywhere.com/product_images/freepik-export-20240910080250MOyG_UuLPLpS.png","description":"meat","main_category":1}]
/// name : "GROCERY & KITCHEN"
/// image : null
/// description : "grocerry"

class Data {
  Data({
      num? id, 
      List<Categories>? categories, 
      String? name, 
      dynamic image, 
      String? description,}){
    _id = id;
    _categories = categories;
    _name = name;
    _image = image;
    _description = description;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    if (json['categories'] != null) {
      _categories = [];
      json['categories'].forEach((v) {
        _categories?.add(Categories.fromJson(v));
      });
    }
    _name = json['name'];
    _image = json['image'];
    _description = json['description'];
  }
  num? _id;
  List<Categories>? _categories;
  String? _name;
  dynamic _image;
  String? _description;
Data copyWith({  num? id,
  List<Categories>? categories,
  String? name,
  dynamic image,
  String? description,
}) => Data(  id: id ?? _id,
  categories: categories ?? _categories,
  name: name ?? _name,
  image: image ?? _image,
  description: description ?? _description,
);
  num? get id => _id;
  List<Categories>? get categories => _categories;
  String? get name => _name;
  dynamic get image => _image;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    if (_categories != null) {
      map['categories'] = _categories?.map((v) => v.toJson()).toList();
    }
    map['name'] = _name;
    map['image'] = _image;
    map['description'] = _description;
    return map;
  }

}

/// id : 1
/// name : "Fresh vegetables"
/// image : "https://commonmodule.pythonanywhere.com/product_images/vegi.webp"
/// description : "fresh vegi and fruits"
/// main_category : 1

class Categories {
  Categories({
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

  Categories.fromJson(dynamic json) {
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
Categories copyWith({  num? id,
  String? name,
  String? image,
  String? description,
  num? mainCategory,
}) => Categories(  id: id ?? _id,
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