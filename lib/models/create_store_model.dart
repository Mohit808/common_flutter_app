
class CreateStoreModel {
  CreateStoreModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  CreateStoreModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
CreateStoreModel copyWith({  String? message,
  num? status,
  Data? data,
}) => CreateStoreModel(  message: message ?? _message,
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

/// id : 5
/// store_name : "Big basket"
/// store_slug : "BigBasket"
/// business_owner_name : "Amit Yadav"
/// store_mobile : "store_mobile"
/// store_email : "bigbasket@gmail.com"
/// store_logo : ""
/// store_banner : ""
/// store_story : ""
/// store_type : ""
/// gst_number : ""
/// pan_number : ""
/// store_description : ""
/// service_type : ""
/// categories : ""
/// store_code : ""
/// store_code_text : ""
/// loyalty_points : ""
/// store_address : ""
/// store_building : ""
/// store_floor : ""
/// store_tower : ""
/// store_landmark : ""
/// pincode : ""
/// store_how_to_reach : ""
/// store_country : ""
/// store_state : ""
/// store_city : ""
/// lat : ""
/// lng : ""
/// subscription_plan_id : ""
/// store_visibility : ""
/// store_status : ""
/// store_privacy_policy : ""
/// store_tnc : ""
/// store_refund_policy : ""
/// is_pickup : false
/// is_deleted : false
/// seller_id : 25

class Data {
  Data({
      num? id, 
      String? storeName, 
      String? storeSlug, 
      String? businessOwnerName, 
      String? storeMobile, 
      String? storeEmail, 
      String? storeLogo, 
      String? storeBanner, 
      String? storeStory, 
      String? storeType, 
      String? gstNumber, 
      String? panNumber, 
      String? storeDescription, 
      String? serviceType, 
      String? categories, 
      String? storeCode, 
      String? storeCodeText, 
      String? loyaltyPoints, 
      String? storeAddress, 
      String? storeBuilding, 
      String? storeFloor, 
      String? storeTower, 
      String? storeLandmark, 
      String? pincode, 
      String? storeHowToReach, 
      String? storeCountry, 
      String? storeState, 
      String? storeCity, 
      String? lat, 
      String? lng, 
      String? subscriptionPlanId, 
      String? storeVisibility, 
      String? storeStatus, 
      String? storePrivacyPolicy, 
      String? storeTnc, 
      String? storeRefundPolicy, 
      bool? isPickup, 
      bool? isDeleted, 
      num? sellerId,}){
    _id = id;
    _storeName = storeName;
    _storeSlug = storeSlug;
    _businessOwnerName = businessOwnerName;
    _storeMobile = storeMobile;
    _storeEmail = storeEmail;
    _storeLogo = storeLogo;
    _storeBanner = storeBanner;
    _storeStory = storeStory;
    _storeType = storeType;
    _gstNumber = gstNumber;
    _panNumber = panNumber;
    _storeDescription = storeDescription;
    _serviceType = serviceType;
    _categories = categories;
    _storeCode = storeCode;
    _storeCodeText = storeCodeText;
    _loyaltyPoints = loyaltyPoints;
    _storeAddress = storeAddress;
    _storeBuilding = storeBuilding;
    _storeFloor = storeFloor;
    _storeTower = storeTower;
    _storeLandmark = storeLandmark;
    _pincode = pincode;
    _storeHowToReach = storeHowToReach;
    _storeCountry = storeCountry;
    _storeState = storeState;
    _storeCity = storeCity;
    _lat = lat;
    _lng = lng;
    _subscriptionPlanId = subscriptionPlanId;
    _storeVisibility = storeVisibility;
    _storeStatus = storeStatus;
    _storePrivacyPolicy = storePrivacyPolicy;
    _storeTnc = storeTnc;
    _storeRefundPolicy = storeRefundPolicy;
    _isPickup = isPickup;
    _isDeleted = isDeleted;
    _sellerId = sellerId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _storeName = json['store_name'];
    _storeSlug = json['store_slug'];
    _businessOwnerName = json['business_owner_name'];
    _storeMobile = json['store_mobile'];
    _storeEmail = json['store_email'];
    _storeLogo = json['store_logo'];
    _storeBanner = json['store_banner'];
    _storeStory = json['store_story'];
    _storeType = json['store_type'];
    _gstNumber = json['gst_number'];
    _panNumber = json['pan_number'];
    _storeDescription = json['store_description'];
    _serviceType = json['service_type'];
    _categories = json['categories'];
    _storeCode = json['store_code'];
    _storeCodeText = json['store_code_text'];
    _loyaltyPoints = json['loyalty_points'];
    _storeAddress = json['store_address'];
    _storeBuilding = json['store_building'];
    _storeFloor = json['store_floor'];
    _storeTower = json['store_tower'];
    _storeLandmark = json['store_landmark'];
    _pincode = json['pincode'];
    _storeHowToReach = json['store_how_to_reach'];
    _storeCountry = json['store_country'];
    _storeState = json['store_state'];
    _storeCity = json['store_city'];
    _lat = json['lat'];
    _lng = json['lng'];
    _subscriptionPlanId = json['subscription_plan_id'];
    _storeVisibility = json['store_visibility'];
    _storeStatus = json['store_status'];
    _storePrivacyPolicy = json['store_privacy_policy'];
    _storeTnc = json['store_tnc'];
    _storeRefundPolicy = json['store_refund_policy'];
    _isPickup = json['is_pickup'];
    _isDeleted = json['is_deleted'];
    _sellerId = json['seller_id'];
  }
  num? _id;
  String? _storeName;
  String? _storeSlug;
  String? _businessOwnerName;
  String? _storeMobile;
  String? _storeEmail;
  String? _storeLogo;
  String? _storeBanner;
  String? _storeStory;
  String? _storeType;
  String? _gstNumber;
  String? _panNumber;
  String? _storeDescription;
  String? _serviceType;
  String? _categories;
  String? _storeCode;
  String? _storeCodeText;
  String? _loyaltyPoints;
  String? _storeAddress;
  String? _storeBuilding;
  String? _storeFloor;
  String? _storeTower;
  String? _storeLandmark;
  String? _pincode;
  String? _storeHowToReach;
  String? _storeCountry;
  String? _storeState;
  String? _storeCity;
  String? _lat;
  String? _lng;
  String? _subscriptionPlanId;
  String? _storeVisibility;
  String? _storeStatus;
  String? _storePrivacyPolicy;
  String? _storeTnc;
  String? _storeRefundPolicy;
  bool? _isPickup;
  bool? _isDeleted;
  num? _sellerId;
Data copyWith({  num? id,
  String? storeName,
  String? storeSlug,
  String? businessOwnerName,
  String? storeMobile,
  String? storeEmail,
  String? storeLogo,
  String? storeBanner,
  String? storeStory,
  String? storeType,
  String? gstNumber,
  String? panNumber,
  String? storeDescription,
  String? serviceType,
  String? categories,
  String? storeCode,
  String? storeCodeText,
  String? loyaltyPoints,
  String? storeAddress,
  String? storeBuilding,
  String? storeFloor,
  String? storeTower,
  String? storeLandmark,
  String? pincode,
  String? storeHowToReach,
  String? storeCountry,
  String? storeState,
  String? storeCity,
  String? lat,
  String? lng,
  String? subscriptionPlanId,
  String? storeVisibility,
  String? storeStatus,
  String? storePrivacyPolicy,
  String? storeTnc,
  String? storeRefundPolicy,
  bool? isPickup,
  bool? isDeleted,
  num? sellerId,
}) => Data(  id: id ?? _id,
  storeName: storeName ?? _storeName,
  storeSlug: storeSlug ?? _storeSlug,
  businessOwnerName: businessOwnerName ?? _businessOwnerName,
  storeMobile: storeMobile ?? _storeMobile,
  storeEmail: storeEmail ?? _storeEmail,
  storeLogo: storeLogo ?? _storeLogo,
  storeBanner: storeBanner ?? _storeBanner,
  storeStory: storeStory ?? _storeStory,
  storeType: storeType ?? _storeType,
  gstNumber: gstNumber ?? _gstNumber,
  panNumber: panNumber ?? _panNumber,
  storeDescription: storeDescription ?? _storeDescription,
  serviceType: serviceType ?? _serviceType,
  categories: categories ?? _categories,
  storeCode: storeCode ?? _storeCode,
  storeCodeText: storeCodeText ?? _storeCodeText,
  loyaltyPoints: loyaltyPoints ?? _loyaltyPoints,
  storeAddress: storeAddress ?? _storeAddress,
  storeBuilding: storeBuilding ?? _storeBuilding,
  storeFloor: storeFloor ?? _storeFloor,
  storeTower: storeTower ?? _storeTower,
  storeLandmark: storeLandmark ?? _storeLandmark,
  pincode: pincode ?? _pincode,
  storeHowToReach: storeHowToReach ?? _storeHowToReach,
  storeCountry: storeCountry ?? _storeCountry,
  storeState: storeState ?? _storeState,
  storeCity: storeCity ?? _storeCity,
  lat: lat ?? _lat,
  lng: lng ?? _lng,
  subscriptionPlanId: subscriptionPlanId ?? _subscriptionPlanId,
  storeVisibility: storeVisibility ?? _storeVisibility,
  storeStatus: storeStatus ?? _storeStatus,
  storePrivacyPolicy: storePrivacyPolicy ?? _storePrivacyPolicy,
  storeTnc: storeTnc ?? _storeTnc,
  storeRefundPolicy: storeRefundPolicy ?? _storeRefundPolicy,
  isPickup: isPickup ?? _isPickup,
  isDeleted: isDeleted ?? _isDeleted,
  sellerId: sellerId ?? _sellerId,
);
  num? get id => _id;
  String? get storeName => _storeName;
  String? get storeSlug => _storeSlug;
  String? get businessOwnerName => _businessOwnerName;
  String? get storeMobile => _storeMobile;
  String? get storeEmail => _storeEmail;
  String? get storeLogo => _storeLogo;
  String? get storeBanner => _storeBanner;
  String? get storeStory => _storeStory;
  String? get storeType => _storeType;
  String? get gstNumber => _gstNumber;
  String? get panNumber => _panNumber;
  String? get storeDescription => _storeDescription;
  String? get serviceType => _serviceType;
  String? get categories => _categories;
  String? get storeCode => _storeCode;
  String? get storeCodeText => _storeCodeText;
  String? get loyaltyPoints => _loyaltyPoints;
  String? get storeAddress => _storeAddress;
  String? get storeBuilding => _storeBuilding;
  String? get storeFloor => _storeFloor;
  String? get storeTower => _storeTower;
  String? get storeLandmark => _storeLandmark;
  String? get pincode => _pincode;
  String? get storeHowToReach => _storeHowToReach;
  String? get storeCountry => _storeCountry;
  String? get storeState => _storeState;
  String? get storeCity => _storeCity;
  String? get lat => _lat;
  String? get lng => _lng;
  String? get subscriptionPlanId => _subscriptionPlanId;
  String? get storeVisibility => _storeVisibility;
  String? get storeStatus => _storeStatus;
  String? get storePrivacyPolicy => _storePrivacyPolicy;
  String? get storeTnc => _storeTnc;
  String? get storeRefundPolicy => _storeRefundPolicy;
  bool? get isPickup => _isPickup;
  bool? get isDeleted => _isDeleted;
  num? get sellerId => _sellerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['store_name'] = _storeName;
    map['store_slug'] = _storeSlug;
    map['business_owner_name'] = _businessOwnerName;
    map['store_mobile'] = _storeMobile;
    map['store_email'] = _storeEmail;
    map['store_logo'] = _storeLogo;
    map['store_banner'] = _storeBanner;
    map['store_story'] = _storeStory;
    map['store_type'] = _storeType;
    map['gst_number'] = _gstNumber;
    map['pan_number'] = _panNumber;
    map['store_description'] = _storeDescription;
    map['service_type'] = _serviceType;
    map['categories'] = _categories;
    map['store_code'] = _storeCode;
    map['store_code_text'] = _storeCodeText;
    map['loyalty_points'] = _loyaltyPoints;
    map['store_address'] = _storeAddress;
    map['store_building'] = _storeBuilding;
    map['store_floor'] = _storeFloor;
    map['store_tower'] = _storeTower;
    map['store_landmark'] = _storeLandmark;
    map['pincode'] = _pincode;
    map['store_how_to_reach'] = _storeHowToReach;
    map['store_country'] = _storeCountry;
    map['store_state'] = _storeState;
    map['store_city'] = _storeCity;
    map['lat'] = _lat;
    map['lng'] = _lng;
    map['subscription_plan_id'] = _subscriptionPlanId;
    map['store_visibility'] = _storeVisibility;
    map['store_status'] = _storeStatus;
    map['store_privacy_policy'] = _storePrivacyPolicy;
    map['store_tnc'] = _storeTnc;
    map['store_refund_policy'] = _storeRefundPolicy;
    map['is_pickup'] = _isPickup;
    map['is_deleted'] = _isDeleted;
    map['seller_id'] = _sellerId;
    return map;
  }

}