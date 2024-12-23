
class SellerModel {
  SellerModel({
      String? message, 
      num? status, 
      Data? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  SellerModel.fromJson(dynamic json) {
    _message = json['message'];
    _status = json['status'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  num? _status;
  Data? _data;
SellerModel copyWith({  String? message,
  num? status,
  Data? data,
}) => SellerModel(  message: message ?? _message,
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
/// username : ""
/// password : ""
/// email : "amit@gmail.com"
/// phone_number : ""
/// first_name : ""
/// last_name : ""
/// whatsapp_number : ""
/// profile_image : ""
/// role_id : ""
/// social_login_type : ""
/// social_login_id : ""
/// is_phone_number_verified : false
/// is_email_verified : false
/// aadhaar_number : ""
/// is_aadhar_verified : false
/// status : false
/// fcm_token : ""
/// is_deleted : false
/// deleted_at : ""
/// created_at : "2024-12-10T18:37:28.819115Z"
/// updated_at : "2024-12-10T18:42:41.393396Z"

class Data {
  Data({
      num? id, 
      String? username, 
      String? password, 
      String? email, 
      String? phoneNumber, 
      String? firstName, 
      String? lastName, 
      String? whatsappNumber, 
      String? profileImage, 
      String? roleId, 
      String? socialLoginType, 
      String? socialLoginId, 
      bool? isPhoneNumberVerified, 
      bool? isEmailVerified, 
      String? aadhaarNumber, 
      bool? isAadharVerified, 
      bool? status, 
      String? fcmToken, 
      bool? isDeleted, 
      String? deletedAt, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _username = username;
    _password = password;
    _email = email;
    _phoneNumber = phoneNumber;
    _firstName = firstName;
    _lastName = lastName;
    _whatsappNumber = whatsappNumber;
    _profileImage = profileImage;
    _roleId = roleId;
    _socialLoginType = socialLoginType;
    _socialLoginId = socialLoginId;
    _isPhoneNumberVerified = isPhoneNumberVerified;
    _isEmailVerified = isEmailVerified;
    _aadhaarNumber = aadhaarNumber;
    _isAadharVerified = isAadharVerified;
    _status = status;
    _fcmToken = fcmToken;
    _isDeleted = isDeleted;
    _deletedAt = deletedAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _username = json['username'];
    _password = json['password'];
    _email = json['email'];
    _phoneNumber = json['phone_number'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _whatsappNumber = json['whatsapp_number'];
    _profileImage = json['profile_image'];
    _roleId = json['role_id'];
    _socialLoginType = json['social_login_type'];
    _socialLoginId = json['social_login_id'];
    _isPhoneNumberVerified = json['is_phone_number_verified'];
    _isEmailVerified = json['is_email_verified'];
    _aadhaarNumber = json['aadhaar_number'];
    _isAadharVerified = json['is_aadhar_verified'];
    _status = json['status'];
    _fcmToken = json['fcm_token'];
    _isDeleted = json['is_deleted'];
    _deletedAt = json['deleted_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _username;
  String? _password;
  String? _email;
  String? _phoneNumber;
  String? _firstName;
  String? _lastName;
  String? _whatsappNumber;
  String? _profileImage;
  String? _roleId;
  String? _socialLoginType;
  String? _socialLoginId;
  bool? _isPhoneNumberVerified;
  bool? _isEmailVerified;
  String? _aadhaarNumber;
  bool? _isAadharVerified;
  bool? _status;
  String? _fcmToken;
  bool? _isDeleted;
  String? _deletedAt;
  String? _createdAt;
  String? _updatedAt;
Data copyWith({  num? id,
  String? username,
  String? password,
  String? email,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  String? whatsappNumber,
  String? profileImage,
  String? roleId,
  String? socialLoginType,
  String? socialLoginId,
  bool? isPhoneNumberVerified,
  bool? isEmailVerified,
  String? aadhaarNumber,
  bool? isAadharVerified,
  bool? status,
  String? fcmToken,
  bool? isDeleted,
  String? deletedAt,
  String? createdAt,
  String? updatedAt,
}) => Data(  id: id ?? _id,
  username: username ?? _username,
  password: password ?? _password,
  email: email ?? _email,
  phoneNumber: phoneNumber ?? _phoneNumber,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  whatsappNumber: whatsappNumber ?? _whatsappNumber,
  profileImage: profileImage ?? _profileImage,
  roleId: roleId ?? _roleId,
  socialLoginType: socialLoginType ?? _socialLoginType,
  socialLoginId: socialLoginId ?? _socialLoginId,
  isPhoneNumberVerified: isPhoneNumberVerified ?? _isPhoneNumberVerified,
  isEmailVerified: isEmailVerified ?? _isEmailVerified,
  aadhaarNumber: aadhaarNumber ?? _aadhaarNumber,
  isAadharVerified: isAadharVerified ?? _isAadharVerified,
  status: status ?? _status,
  fcmToken: fcmToken ?? _fcmToken,
  isDeleted: isDeleted ?? _isDeleted,
  deletedAt: deletedAt ?? _deletedAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get username => _username;
  String? get password => _password;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get whatsappNumber => _whatsappNumber;
  String? get profileImage => _profileImage;
  String? get roleId => _roleId;
  String? get socialLoginType => _socialLoginType;
  String? get socialLoginId => _socialLoginId;
  bool? get isPhoneNumberVerified => _isPhoneNumberVerified;
  bool? get isEmailVerified => _isEmailVerified;
  String? get aadhaarNumber => _aadhaarNumber;
  bool? get isAadharVerified => _isAadharVerified;
  bool? get status => _status;
  String? get fcmToken => _fcmToken;
  bool? get isDeleted => _isDeleted;
  String? get deletedAt => _deletedAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['username'] = _username;
    map['password'] = _password;
    map['email'] = _email;
    map['phone_number'] = _phoneNumber;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['whatsapp_number'] = _whatsappNumber;
    map['profile_image'] = _profileImage;
    map['role_id'] = _roleId;
    map['social_login_type'] = _socialLoginType;
    map['social_login_id'] = _socialLoginId;
    map['is_phone_number_verified'] = _isPhoneNumberVerified;
    map['is_email_verified'] = _isEmailVerified;
    map['aadhaar_number'] = _aadhaarNumber;
    map['is_aadhar_verified'] = _isAadharVerified;
    map['status'] = _status;
    map['fcm_token'] = _fcmToken;
    map['is_deleted'] = _isDeleted;
    map['deleted_at'] = _deletedAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}