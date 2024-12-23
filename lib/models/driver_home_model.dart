/// message : "Fetch data successfully"
/// status : 200
/// data : [{"id":1,"customer":1,"addressFrom":"Unnamed Road, Panchkula, Haryana, India 134109","latitudeFrom":30.693144356240865,"longitudeFrom":76.88045270740986,"addressTo":"519, Budanpur, Panchkula, Haryana, India 134113","latitudeTo":30.687637796695356,"longitudeTo":76.84474814683199,"vehicle":"bike","price":3.0,"distance":2.3,"time":"23-02-2024","driver":1,"status":"booked","polylineRide":"({polylineId: 1, consumeTapEvents: false, color: 4294198070, endCap: [buttCap], geodesic: false, jointType: 0, startCap: [roundCap], visible: true, width: 4, zIndex: 0, points: [[30.6931471, 76.8804516], [30.692760000000003, 76.88025], [30.692770000000003, 76.87966], [30.692970000000003, 76.87967], [30.693220000000004, 76.8797], [30.693580000000004, 76.87978], [30.694020000000005, 76.87984], [30.694150000000004, 76.87985], [30.697060000000004, 76.87981], [30.697320000000005, 76.87983000000001], [30.697560000000006, 76.87988000000001], [30.698010000000007, 76.88004000000001], [30.698380000000007, 76.8802], [30.698770000000007, 76.88044000000001], [30.698900000000005, 76.88037000000001], [30.699090000000005, 76.88017], [30.699170000000006, 76.87999], [30.699190000000005, 76.87957], [30.699410000000004, 76.87621], [30.699470000000005, 76.87574], [30.699590000000004, 76.87375999999999], [30.699640000000006, 76.87246999999999], [30.699690000000007, 76.87171], [30.699700000000007, 76.87152999999999], [30.699800000000007, 76.87092], [30.700060000000008, 76.86955], [30.70021000000001, 76.86857], [30.700520000000008, 76.86694], [30.700620000000008, 76.86627], [30.70069000000001, 76.8655], [30.70074000000001, 76.86355999999999], [30.70074000000001, 76.86328999999999], [30.70071000000001, 76.86313999999999], [30.70061000000001, 76.86293999999998], [30.70054000000001, 76.86288999999998], [30.70047000000001, 76.86279999999998], [30.70042000000001, 76.86269999999998], [30.70040000000001, 76.86263999999997], [30.70023000000001, 76.86243999999996], [30.70009000000001, 76.86227999999997], [30.69989000000001, 76.86215999999997], [30.69899000000001, 76.86165999999997], [30.69820000000001, 76.86118999999997], [30.69774000000001, 76.86087999999997], [30.69698000000001, 76.86037999999996], [30.69648000000001, 76.86001999999996], [30.695430000000012, 76.85923999999996], [30.69527000000001, 76.85910999999996], [30.695250000000012, 76.85910999999996], [30.69519000000001, 76.85906999999996], [30.69517000000001, 76.85903999999996], [30.69517000000001, 76.85901999999996], [30.69418000000001, 76.85813999999996], [30.69346000000001, 76.85735999999996], [30.692850000000007, 76.85661999999996], [30.692830000000008, 76.85660999999996], [30.69281000000001, 76.85658999999995], [30.69279000000001, 76.85652999999995], [30.69252000000001, 76.85613999999995], [30.69175000000001, 76.85511999999996], [30.690670000000008, 76.85374999999996], [30.690420000000007, 76.85353999999997], [30.690300000000008, 76.85357999999997], [30.69018000000001, 76.85356999999996], [30.69006000000001, 76.85351999999996], [30.68996000000001, 76.85342999999996], [30.68991000000001, 76.85335999999997], [30.68987000000001, 76.85327999999997], [30.68985000000001, 76.85315999999997], [30.68985000000001, 76.85303999999998], [30.68988000000001, 76.85291999999998], [30.68993000000001, 76.85281999999998], [30.68885000000001, 76.85152999999998], [30.68799000000001, 76.85050999999999], [30.68878000000001, 76.84961999999999], [30.68930000000001, 76.84904999999999], [30.68951000000001, 76.84881999999999], [30.68991000000001, 76.84846999999999], [30.68912000000001, 76.84747999999999], [30.68874000000001, 76.84703999999999], [30.68833000000001, 76.84656], [30.68817000000001, 76.8463], [30.68745000000001, 76.84497999999999], [30.687680000000007, 76.84482999999999]], pattern: []}, {polylineId: 112, consumeTapEvents: false, color: 4294198070, endCap: [buttCap], geodesic: true, jointType: 2, startCap: [buttCap], visible: true, width: 4, zIndex: 0, points: [[30.687680000000007, 76.84482999999999], [30.687637796695356, 76.84474814683199]], pattern: [[dash, 8.0], [gap, 15.0]]})","polylineDriver":""}]

class DriverHomeModel {
  DriverHomeModel({
      String? message, 
      num? status, 
      List<Data>? data,}){
    _message = message;
    _status = status;
    _data = data;
}

  DriverHomeModel.fromJson(dynamic json) {
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
DriverHomeModel copyWith({  String? message,
  num? status,
  List<Data>? data,
}) => DriverHomeModel(  message: message ?? _message,
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
/// customer : 1
/// addressFrom : "Unnamed Road, Panchkula, Haryana, India 134109"
/// latitudeFrom : 30.693144356240865
/// longitudeFrom : 76.88045270740986
/// addressTo : "519, Budanpur, Panchkula, Haryana, India 134113"
/// latitudeTo : 30.687637796695356
/// longitudeTo : 76.84474814683199
/// vehicle : "bike"
/// price : 3.0
/// distance : 2.3
/// time : "23-02-2024"
/// driver : 1
/// status : "booked"
/// polylineRide : "({polylineId: 1, consumeTapEvents: false, color: 4294198070, endCap: [buttCap], geodesic: false, jointType: 0, startCap: [roundCap], visible: true, width: 4, zIndex: 0, points: [[30.6931471, 76.8804516], [30.692760000000003, 76.88025], [30.692770000000003, 76.87966], [30.692970000000003, 76.87967], [30.693220000000004, 76.8797], [30.693580000000004, 76.87978], [30.694020000000005, 76.87984], [30.694150000000004, 76.87985], [30.697060000000004, 76.87981], [30.697320000000005, 76.87983000000001], [30.697560000000006, 76.87988000000001], [30.698010000000007, 76.88004000000001], [30.698380000000007, 76.8802], [30.698770000000007, 76.88044000000001], [30.698900000000005, 76.88037000000001], [30.699090000000005, 76.88017], [30.699170000000006, 76.87999], [30.699190000000005, 76.87957], [30.699410000000004, 76.87621], [30.699470000000005, 76.87574], [30.699590000000004, 76.87375999999999], [30.699640000000006, 76.87246999999999], [30.699690000000007, 76.87171], [30.699700000000007, 76.87152999999999], [30.699800000000007, 76.87092], [30.700060000000008, 76.86955], [30.70021000000001, 76.86857], [30.700520000000008, 76.86694], [30.700620000000008, 76.86627], [30.70069000000001, 76.8655], [30.70074000000001, 76.86355999999999], [30.70074000000001, 76.86328999999999], [30.70071000000001, 76.86313999999999], [30.70061000000001, 76.86293999999998], [30.70054000000001, 76.86288999999998], [30.70047000000001, 76.86279999999998], [30.70042000000001, 76.86269999999998], [30.70040000000001, 76.86263999999997], [30.70023000000001, 76.86243999999996], [30.70009000000001, 76.86227999999997], [30.69989000000001, 76.86215999999997], [30.69899000000001, 76.86165999999997], [30.69820000000001, 76.86118999999997], [30.69774000000001, 76.86087999999997], [30.69698000000001, 76.86037999999996], [30.69648000000001, 76.86001999999996], [30.695430000000012, 76.85923999999996], [30.69527000000001, 76.85910999999996], [30.695250000000012, 76.85910999999996], [30.69519000000001, 76.85906999999996], [30.69517000000001, 76.85903999999996], [30.69517000000001, 76.85901999999996], [30.69418000000001, 76.85813999999996], [30.69346000000001, 76.85735999999996], [30.692850000000007, 76.85661999999996], [30.692830000000008, 76.85660999999996], [30.69281000000001, 76.85658999999995], [30.69279000000001, 76.85652999999995], [30.69252000000001, 76.85613999999995], [30.69175000000001, 76.85511999999996], [30.690670000000008, 76.85374999999996], [30.690420000000007, 76.85353999999997], [30.690300000000008, 76.85357999999997], [30.69018000000001, 76.85356999999996], [30.69006000000001, 76.85351999999996], [30.68996000000001, 76.85342999999996], [30.68991000000001, 76.85335999999997], [30.68987000000001, 76.85327999999997], [30.68985000000001, 76.85315999999997], [30.68985000000001, 76.85303999999998], [30.68988000000001, 76.85291999999998], [30.68993000000001, 76.85281999999998], [30.68885000000001, 76.85152999999998], [30.68799000000001, 76.85050999999999], [30.68878000000001, 76.84961999999999], [30.68930000000001, 76.84904999999999], [30.68951000000001, 76.84881999999999], [30.68991000000001, 76.84846999999999], [30.68912000000001, 76.84747999999999], [30.68874000000001, 76.84703999999999], [30.68833000000001, 76.84656], [30.68817000000001, 76.8463], [30.68745000000001, 76.84497999999999], [30.687680000000007, 76.84482999999999]], pattern: []}, {polylineId: 112, consumeTapEvents: false, color: 4294198070, endCap: [buttCap], geodesic: true, jointType: 2, startCap: [buttCap], visible: true, width: 4, zIndex: 0, points: [[30.687680000000007, 76.84482999999999], [30.687637796695356, 76.84474814683199]], pattern: [[dash, 8.0], [gap, 15.0]]})"
/// polylineDriver : ""

class Data {
  Data({
      num? id, 
      num? customer, 
      String? addressFrom, 
      num? latitudeFrom, 
      num? longitudeFrom, 
      String? addressTo, 
      num? latitudeTo, 
      num? longitudeTo, 
      String? vehicle, 
      num? price, 
      num? distance, 
      String? time, 
      num? driver, 
      String? status, 
      String? polylineRide, 
      String? polylineDriver,}){
    _id = id;
    _customer = customer;
    _addressFrom = addressFrom;
    _latitudeFrom = latitudeFrom;
    _longitudeFrom = longitudeFrom;
    _addressTo = addressTo;
    _latitudeTo = latitudeTo;
    _longitudeTo = longitudeTo;
    _vehicle = vehicle;
    _price = price;
    _distance = distance;
    _time = time;
    _driver = driver;
    _status = status;
    _polylineRide = polylineRide;
    _polylineDriver = polylineDriver;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _customer = json['customer'];
    _addressFrom = json['addressFrom'];
    _latitudeFrom = json['latitudeFrom'];
    _longitudeFrom = json['longitudeFrom'];
    _addressTo = json['addressTo'];
    _latitudeTo = json['latitudeTo'];
    _longitudeTo = json['longitudeTo'];
    _vehicle = json['vehicle'];
    _price = json['price'];
    _distance = json['distance'];
    _time = json['time'];
    _driver = json['driver'];
    _status = json['status'];
    _polylineRide = json['polylineRide'];
    _polylineDriver = json['polylineDriver'];
  }
  num? _id;
  num? _customer;
  String? _addressFrom;
  num? _latitudeFrom;
  num? _longitudeFrom;
  String? _addressTo;
  num? _latitudeTo;
  num? _longitudeTo;
  String? _vehicle;
  num? _price;
  num? _distance;
  String? _time;
  num? _driver;
  String? _status;
  String? _polylineRide;
  String? _polylineDriver;
Data copyWith({  num? id,
  num? customer,
  String? addressFrom,
  num? latitudeFrom,
  num? longitudeFrom,
  String? addressTo,
  num? latitudeTo,
  num? longitudeTo,
  String? vehicle,
  num? price,
  num? distance,
  String? time,
  num? driver,
  String? status,
  String? polylineRide,
  String? polylineDriver,
}) => Data(  id: id ?? _id,
  customer: customer ?? _customer,
  addressFrom: addressFrom ?? _addressFrom,
  latitudeFrom: latitudeFrom ?? _latitudeFrom,
  longitudeFrom: longitudeFrom ?? _longitudeFrom,
  addressTo: addressTo ?? _addressTo,
  latitudeTo: latitudeTo ?? _latitudeTo,
  longitudeTo: longitudeTo ?? _longitudeTo,
  vehicle: vehicle ?? _vehicle,
  price: price ?? _price,
  distance: distance ?? _distance,
  time: time ?? _time,
  driver: driver ?? _driver,
  status: status ?? _status,
  polylineRide: polylineRide ?? _polylineRide,
  polylineDriver: polylineDriver ?? _polylineDriver,
);
  num? get id => _id;
  num? get customer => _customer;
  String? get addressFrom => _addressFrom;
  num? get latitudeFrom => _latitudeFrom;
  num? get longitudeFrom => _longitudeFrom;
  String? get addressTo => _addressTo;
  num? get latitudeTo => _latitudeTo;
  num? get longitudeTo => _longitudeTo;
  String? get vehicle => _vehicle;
  num? get price => _price;
  num? get distance => _distance;
  String? get time => _time;
  num? get driver => _driver;
  String? get status => _status;
  String? get polylineRide => _polylineRide;
  String? get polylineDriver => _polylineDriver;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['customer'] = _customer;
    map['addressFrom'] = _addressFrom;
    map['latitudeFrom'] = _latitudeFrom;
    map['longitudeFrom'] = _longitudeFrom;
    map['addressTo'] = _addressTo;
    map['latitudeTo'] = _latitudeTo;
    map['longitudeTo'] = _longitudeTo;
    map['vehicle'] = _vehicle;
    map['price'] = _price;
    map['distance'] = _distance;
    map['time'] = _time;
    map['driver'] = _driver;
    map['status'] = _status;
    map['polylineRide'] = _polylineRide;
    map['polylineDriver'] = _polylineDriver;
    return map;
  }

}