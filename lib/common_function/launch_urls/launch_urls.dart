import 'package:url_launcher/url_launcher.dart';

class LaunchUrls{
  Future<void> launch(url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> launchCall(mobile) async {
    if (!await launchUrl(Uri.parse("tel: $mobile"))) {
      throw Exception('Could not launch $mobile');
    }
  }

  Future<void> launchSms(sms) async {
    if (!await launchUrl(Uri.parse("sms: $sms"))) {
      throw Exception('Could not launch $sms');
    }
  }

  Future<void> launchMail(url) async {
    if (!await launchUrl(Uri.parse("mailto:<email address>?subject=<subject>&body=<body>"))) {
      throw Exception('Could not launch $url');
    }
  }

}