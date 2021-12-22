//import 'package:accidetector/sensors.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'sensors.dart';
import 'send_sms.dart';
//import 'package:sensors_plus/sensors_plus.dart';

// ignore: must_be_immutable
class DisplayPage extends StatefulWidget {
  String userName;
  String userEmail;
  String userNum;
  String kinName;
  String kinEmail;
  String kinNum;
  DisplayPage(
      {Key key,
      this.userName,
      this.userEmail,
      this.userNum,
      this.kinName,
      this.kinEmail,
      this.kinNum})
      : super(key: key);
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: const Center(
          child: Text(
            'ACCIDENT DETECTOR',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(top: 20, left: 20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Hi " + widget.userName.toString(),
                  style: const TextStyle(
                    fontFamily: 'SourceSanPro',
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                SizedBox(
                  height: 30,
                  width: 70,
                  child: Material(
                    borderRadius: BorderRadius.circular(25),
                    shadowColor: Colors.redAccent,
                    color: Colors.red[800],
                    elevation: 3.0,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (builder) => const LoginPage()));
                      },
                      child: const Center(
                        child: Text(
                          'Log Out',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Email: " + widget.userEmail.toString(),
              style: const TextStyle(
                fontFamily: 'SourceSanPro',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Phone No.: " + widget.userNum.toString(),
              style: const TextStyle(
                fontFamily: 'SourceSanPro',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Next of Kin's Name: " + widget.kinName.toString(),
              style: const TextStyle(
                fontFamily: 'SourceSanPro',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Next of Kin's Email: " + widget.kinEmail.toString(),
              style: const TextStyle(
                fontFamily: 'SourceSanPro',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Next of Kin's No.: " + widget.kinNum.toString(),
              style: const TextStyle(
                fontFamily: 'SourceSanPro',
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 70,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.cyanAccent,
                color: Colors.cyan[800],
                elevation: 3.0,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => const SensorMainHome()));
                  },
                  child: const Center(
                    child: Text(
                      'Start',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              width: 100,
            ),
            SizedBox(
              height: 60,
              width: 200,
              child: Material(
                borderRadius: BorderRadius.circular(25),
                shadowColor: Colors.redAccent,
                color: Colors.red[800],
                elevation: 5.0,
                child: TextButton(
                  onPressed: () {
                    String message =
                        "An accident has occured to ${widget.userName} at ${location}! \nPlease send emergency assistance.";
                    List<String> recipents = ["+23408057362576"];
                    _sendSMS(message, recipents) {}
                  },
                  child: const Center(
                    child: Text(
                      'HELP!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
