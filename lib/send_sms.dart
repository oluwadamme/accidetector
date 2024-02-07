// Sending message
import 'package:telephony/telephony.dart';

class HelpSMS {
  final Telephony telephony = Telephony.instance;
  Future<void> send_sms(String message, String recipents) async {
    final permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    (permissionsGranted ?? false) ? telephony.sendSms(to: recipents, message: message) : null;
    //print(result);
  }
}
