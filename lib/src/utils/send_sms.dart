// Sending message
import 'dart:developer';

import 'package:telephony/telephony.dart';

class HelpSMS {
  final Telephony telephony = Telephony.instance;
  Future<void> send_sms(String message, String recipents) async {
    final permissionsGranted = await telephony.requestPhoneAndSmsPermissions;
    if (permissionsGranted ?? false) {
      telephony.sendSms(
        to: recipents,
        message: message,
        statusListener: (status) {
          log(status.name);
          return status;
        },
      );
    }
    //print(result);
  }
}
