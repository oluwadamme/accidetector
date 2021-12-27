// Sending message
import 'package:telephony/telephony.dart';

class HelpSMS {
  final Telephony telephony = Telephony.instance;
  Future<void> send_sms(String message, String recipents) async {
    bool permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    permissionsGranted
        ? telephony.sendSms(to: recipents, message: message)
        : null;
    //print(result);
  }
}
