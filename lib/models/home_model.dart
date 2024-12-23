/// message : "Fetch data successfully"
/// status : 200
/// data : [{"id":1,"brand":null,"discount_percentage":20.0,"store_name":"Kanchan kirana store","name":"WaterMelon","description":"Full of water","highlight":"Healthy treat of summer","image":"http://127.0.0.1:8000/product_images/freepik-export-20240912070940Rpm9.png","price":200.0,"discountedPrice":160.0,"origin":"India","tips":"Store in any place","additional_info":"","created_at":"2024-09-10T10:37:48.446973Z","updated_at":"2024-09-25T07:26:28.996108Z","store":1,"main_category":1,"category":1,"variant":1,"tag":[]},{"id":2,"brand":null,"discount_percentage":0,"store_name":"Kanchan kirana store","name":"Toned Milk","description":"schemed toned milk","highlight":"","image":"http://127.0.0.1:8000/product_images/drink-ad-milk-company.png","price":28.0,"discountedPrice":null,"origin":"","tips":"","additional_info":"","created_at":"2024-09-10T10:40:35.075242Z","updated_at":"2024-09-25T07:26:20.158158Z","store":1,"main_category":null,"category":3,"variant":12,"tag":[]},{"id":3,"brand":null,"discount_percentage":0,"store_name":"Kanchan kirana store","name":"Shampoo","description":"A long description of shampoo","highlight":"Gold leaf for your beautiful hair","image":"http://127.0.0.1:8000/product_images/luxury-cosmetic-products-design.png","price":200.0,"discountedPrice":null,"origin":"","tips":"","additional_info":"","created_at":"2024-09-12T07:14:06.879497Z","updated_at":"2024-09-25T07:26:15.248905Z","store":1,"main_category":3,"category":20,"variant":null,"tag":[]},{"id":4,"brand":null,"discount_percentage":4.918032786885246,"store_name":"Kanchan kirana store","name":"Strawberry","description":"Red strawberry","highlight":"Red lava hot strawberry","image":"http://127.0.0.1:8000/product_images/freepik-export-20240912072009IKRT.png","price":305.0,"discountedPrice":290.0,"origin":"From Spain","tips":"","additional_info":"","created_at":"2024-09-12T07:21:59.991625Z","updated_at":"2024-09-25T07:26:09.211148Z","store":1,"main_category":3,"category":2,"variant":null,"tag":[]},{"id":5,"brand":null,"discount_percentage":20.0,"store_name":"Kanchan kirana store","name":"Durex condom","description":"For Adult Need","highlight":"This as air","image":"http://127.0.0.1:8000/product_images/freepik-export-20240912072528fjdS_ru0OQbc.png","price":100.0,"discountedPrice":80.0,"origin":"","tips":"","additional_info":"","created_at":"2024-09-12T07:28:25.659136Z","updated_at":"2024-09-25T07:26:03.125625Z","store":1,"main_category":3,"category":21,"variant":14,"tag":[]},{"id":6,"brand":null,"discount_percentage":0.2,"store_name":"Kanchan kirana store","name":"Durex Lubricant","description":"lub","highlight":"Fell wet","image":"http://127.0.0.1:8000/product_images/pngwing_RpuxRqW.com.png","price":500.0,"discountedPrice":499.0,"origin":"","tips":"","additional_info":"","created_at":"2024-09-12T07:50:19.620438Z","updated_at":"2024-09-25T07:25:53.340498Z","store":1,"main_category":3,"category":21,"variant":15,"tag":[]},{"id":7,"brand":{"id":2,"name":"Dettol","image":"http://127.0.0.1:8000/product_images/pngwing_MGp1FQY.com_1.png","description":"Be 100% sure"},"discount_percentage":0,"store_name":"Kanchan kirana store","name":"Dettol","description":"For open wound","highlight":"","image":"http://127.0.0.1:8000/product_images/pngwing_R1yDoj0.com_1.png","price":199.0,"discountedPrice":null,"origin":"","tips":"","additional_info":"","created_at":"2024-09-12T07:51:32.290338Z","updated_at":"2024-09-25T07:25:47.863044Z","store":1,"main_category":3,"category":21,"variant":16,"tag":[]},{"id":9,"brand":null,"discount_percentage":11.0,"store_name":"Kanchan kirana store","name":"Vanilla Ice Cream","description":"vanilla","highlight":"","image":"http://127.0.0.1:8000/product_images/pngwing.com_2.png","price":100.0,"discountedPrice":89.0,"origin":"","tips":"","additional_info":"","created_at":"2024-09-13T11:16:49.349848Z","updated_at":"2024-09-25T07:25:37.186389Z","store":1,"main_category":2,"category":13,"variant":null,"tag":[]},{"id":10,"brand":null,"discount_percentage":0,"store_name":"Kanchan kirana store","name":"Tomato","description":"red tomato","highlight":"","image":"http://127.0.0.1:8000/product_images/pngwing.com_3.png","price":150.0,"discountedPrice":null,"origin":"","tips":"","additional_info":"","created_at":"2024-09-13T11:19:59.418602Z","updated_at":"2024-09-25T07:25:29.940325Z","store":1,"main_category":null,"category":1,"variant":1,"tag":[]},{"id":11,"brand":null,"discount_percentage":0,"store_name":"Kanchan kirana store","name":"Huggies","description":"huggies","highlight":"","image":"http://127.0.0.1:8000/product_images/pngwing.com_5.png","price":499.0,"discountedPrice":null,"origin":"","tips":"","additional_info":"","created_at":"2024-09-13T11:23:24.078060Z","updated_at":"2024-09-25T07:23:10.354110Z","store":1,"main_category":3,"category":22,"variant":null,"tag":[]}]

class HomeModel {
  HomeModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  HomeModel.fromJson(dynamic json) {
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
HomeModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => HomeModel(  message: message ?? _message,
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
/// brand : null
/// discount_percentage : 20.0
/// store_name : "Kanchan kirana store"
/// name : "WaterMelon"
/// description : "Full of water"
/// highlight : "Healthy treat of summer"
/// image : "http://127.0.0.1:8000/product_images/freepik-export-20240912070940Rpm9.png"
/// price : 200.0
/// discountedPrice : 160.0
/// origin : "India"
/// tips : "Store in any place"
/// additional_info : ""
/// created_at : "2024-09-10T10:37:48.446973Z"
/// updated_at : "2024-09-25T07:26:28.996108Z"
/// store : 1
/// main_category : 1
/// category : 1
/// variant : 1
/// tag : []

class Data {
  Data({
      num? id, 
      dynamic brand, 
      num? discountPercentage, 
      String? storeName, 
      String? name, 
      String? description, 
      String? highlight, 
      String? image, 
      num? price, 
      num? discountedPrice, 
      String? origin, 
      String? tips, 
      String? additionalInfo, 
      String? createdAt, 
      String? updatedAt, 
      num? store, 
      num? mainCategory, 
      num? category, 
      num? variant, 
      List<dynamic>? tag,}){
    _id = id;
    _brand = brand;
    _discountPercentage = discountPercentage;
    _storeName = storeName;
    _name = name;
    _description = description;
    _highlight = highlight;
    _image = image;
    _price = price;
    _discountedPrice = discountedPrice;
    _origin = origin;
    _tips = tips;
    _additionalInfo = additionalInfo;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _store = store;
    _mainCategory = mainCategory;
    _category = category;
    _variant = variant;
    _tag = tag;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _brand = json['brand'];
    _discountPercentage = json['discount_percentage'];
    _storeName = json['store_name'];
    _name = json['name'];
    _description = json['description'];
    _highlight = json['highlight'];
    _image = json['image'];
    _price = json['price'];
    _discountedPrice = json['discountedPrice'];
    _origin = json['origin'];
    _tips = json['tips'];
    _additionalInfo = json['additional_info'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _store = json['store'];
    _mainCategory = json['main_category'];
    _category = json['category'];
    _variant = json['variant'];
    if (json['tag'] != null) {
      _tag = [];
      json['tag'].forEach((v) {
        // _tag?.add(Dynamic.fromJson(v));
      });
    }
  }
  num? _id;
  dynamic _brand;
  num? _discountPercentage;
  String? _storeName;
  String? _name;
  String? _description;
  String? _highlight;
  String? _image;
  num? _price;
  num? _discountedPrice;
  String? _origin;
  String? _tips;
  String? _additionalInfo;
  String? _createdAt;
  String? _updatedAt;
  num? _store;
  num? _mainCategory;
  num? _category;
  num? _variant;
  List<dynamic>? _tag;
Data copyWith({  num? id,
  dynamic brand,
  num? discountPercentage,
  String? storeName,
  String? name,
  String? description,
  String? highlight,
  String? image,
  num? price,
  num? discountedPrice,
  String? origin,
  String? tips,
  String? additionalInfo,
  String? createdAt,
  String? updatedAt,
  num? store,
  num? mainCategory,
  num? category,
  num? variant,
  List<dynamic>? tag,
}) => Data(  id: id ?? _id,
  brand: brand ?? _brand,
  discountPercentage: discountPercentage ?? _discountPercentage,
  storeName: storeName ?? _storeName,
  name: name ?? _name,
  description: description ?? _description,
  highlight: highlight ?? _highlight,
  image: image ?? _image,
  price: price ?? _price,
  discountedPrice: discountedPrice ?? _discountedPrice,
  origin: origin ?? _origin,
  tips: tips ?? _tips,
  additionalInfo: additionalInfo ?? _additionalInfo,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  store: store ?? _store,
  mainCategory: mainCategory ?? _mainCategory,
  category: category ?? _category,
  variant: variant ?? _variant,
  tag: tag ?? _tag,
);
  num? get id => _id;
  dynamic get brand => _brand;
  num? get discountPercentage => _discountPercentage;
  String? get storeName => _storeName;
  String? get name => _name;
  String? get description => _description;
  String? get highlight => _highlight;
  String? get image => _image;
  num? get price => _price;
  num? get discountedPrice => _discountedPrice;
  String? get origin => _origin;
  String? get tips => _tips;
  String? get additionalInfo => _additionalInfo;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  num? get store => _store;
  num? get mainCategory => _mainCategory;
  num? get category => _category;
  num? get variant => _variant;
  List<dynamic>? get tag => _tag;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['brand'] = _brand;
    map['discount_percentage'] = _discountPercentage;
    map['store_name'] = _storeName;
    map['name'] = _name;
    map['description'] = _description;
    map['highlight'] = _highlight;
    map['image'] = _image;
    map['price'] = _price;
    map['discountedPrice'] = _discountedPrice;
    map['origin'] = _origin;
    map['tips'] = _tips;
    map['additional_info'] = _additionalInfo;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['store'] = _store;
    map['main_category'] = _mainCategory;
    map['category'] = _category;
    map['variant'] = _variant;
    if (_tag != null) {
      map['tag'] = _tag?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}