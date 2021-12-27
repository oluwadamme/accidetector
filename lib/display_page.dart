//import 'package:accidetector/sensors.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'sensors.dart';
import 'send_sms.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

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
  dynamic location;

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

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
            Center(
              child: SizedBox(
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
                    child: const Text(
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
            Center(
              child: SizedBox(
                height: 60,
                width: 200,
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  shadowColor: Colors.redAccent,
                  color: Colors.red[800],
                  elevation: 5.0,
                  child: TextButton(
                    onPressed: () async {
                      Position position = await _determinePosition();
                      location = get(Uri.parse(
                          "https://api.mapbox.com/geocoding/v5/mapbox.places/${position.longitude},${position.latitude}.json?access_token=pk.eyJ1IjoibXU1dGVlIiwiYSI6ImNreGxyYWVjMjFpd28yeHViaTMxd2NtYWUifQ.MRM4cIK7PhfnnDqyoJnZgg"));
                      if (location != '') {
                        print(location["context"]);
                      } else {
                        print('No location found');
                      }
                      String message =
                          "An accident has occured to ${widget.userName} at ${location.data}! \nPlease send emergency assistance.";
                      String recipents = "+2348057362576";
                      // await HelpSMS()
                      //     .send_sms(message, recipents)
                      //     .whenComplete(() => print('done'));
                    },
                    child: const Text(
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
