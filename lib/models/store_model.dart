
class StoreModel {
  StoreModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  StoreModel.fromJson(dynamic json) {
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
StoreModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => StoreModel(  message: message ?? _message,
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
/// store_story : "story of store"
/// store_logo : "https://img.freepik.com/free-vector/bird-colorful-logo-gradient-vector_343694-1365.jpg?size=338&ext="

class Data {
  Data({
      num? id, 
      String? storeName, 
      String? storeStory, 
      String? storeLogo,}){
    _id = id;
    _storeName = storeName;
    _storeStory = storeStory;
    _storeLogo = storeLogo;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _storeStory = json['store_story'];
    _storeLogo = json['store_logo'];
  }
  num? _id;
  String? _storeName;
  String? _storeStory;
  String? _storeLogo;
Data copyWith({  num? id,
  String? storeName,
  String? storeStory,
  String? storeLogo,
}) => Data(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  storeStory: storeStory ?? _storeStory,
  storeLogo: storeLogo ?? _storeLogo,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get storeStory => _storeStory;
  String? get storeLogo => _storeLogo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['store_story'] = _storeStory;
    map['store_logo'] = _storeLogo;
    return map;
  }

}