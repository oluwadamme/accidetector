// Sending message


import 'package:flutter_sms/flutter_sms.dart';

void _sendSMS(String message, List<String> recipents) async {
 String _result = await sendSMS(message: message, recipients: recipents)
        .catchError((onError) {
      print(onError);
    });
print(_result);
}

String message = "This is a test message!";
List<String> recipents = ["1234567890", "5556787676"];

_sendSMS(message, recipents);