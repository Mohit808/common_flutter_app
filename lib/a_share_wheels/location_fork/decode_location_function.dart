import 'package:geocoding/geocoding.dart';

class DecodeLocationFunction{
  decodeLocation(double lat,double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    print("${placemarks.first.name}");
    print("${placemarks.first.locality}");
    print("${placemarks.first.administrativeArea}");
    print("${placemarks.first.street}");
    // print("${placemarks.first.subAdministrativeArea}");
    print("${placemarks.first.subLocality}");
    print("${placemarks.first.postalCode}");
    if(placemarks.first.postalCode!=null){
      // pinCode=placemarks.first.postalCode;
    }

    var address="${placemarks.first.name}, ${placemarks.first.subLocality!.isEmpty?"": "${placemarks.first.subLocality}, "}${placemarks.first.locality}, ${placemarks.first.administrativeArea}, ${placemarks.first.country} ${placemarks.first.postalCode}";
    return address;
  }
}