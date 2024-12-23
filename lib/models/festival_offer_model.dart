class FestivalOfferModel {
  FestivalOfferModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}


  FestivalOfferModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
FestivalOfferModel copyWith({  String? message,
  num? status,
  Data? data,
}) => FestivalOfferModel(  message: message ?? _message,
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

/// id : 1
/// name : "The Softest & Creamiest Paneer"
/// description : "Freshly hand churned,\\njust for you!"
/// image : "http://127.0.0.1:8000/Pngtreetofu_5618431.png"
/// priority : 10
/// category : [12]

class Data {
  Data({
      num? id, 
      String? name, 
      String? description, 
      String? image, 
      num? priority, 
      List<num>? category,}){
    _id = id;
    _name = name;
    _description = description;
    _image = image;
    _priority = priority;
    _category = category;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _image = json['image'];
    _priority = json['priority'];
    _category = json['category'] != null ? json['category'].cast<num>() : [];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _image;
  num? _priority;
  List<num>? _category;
Data copyWith({  num? id,
  String? name,
  String? description,
  String? image,
  num? priority,
  List<num>? category,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  description: description ?? _description,
  image: image ?? _image,
  priority: priority ?? _priority,
  category: category ?? _category,
);
  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get image => _image;
  num? get priority => _priority;
  List<num>? get category => _category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['image'] = _image;
    map['priority'] = _priority;
    map['category'] = _category;
    return map;
  }

}