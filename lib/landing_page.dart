import 'dart:convert' as convert;
import 'package:accidetector/send_sms.dart';
import 'package:accidetector/user_info.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'sensors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

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

  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kUserLocation = CameraPosition(
      bearing: 0.0,
      target: LatLng(position.longitude, position.latitude),
      tilt: 60.0,
      zoom: 10.0);

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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
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
                  SizedBox(
                    height: 40,
                    width: 70,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      shadowColor: Colors.redAccent,
                      color: Colors.red[800],
                      elevation: 3.0,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(
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
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2 / 3,
              child: GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: _kUserLocation,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: SizedBox(
                      height: 45,
                      width: 120,
                      child: Material(
                        borderRadius: BorderRadius.circular(25),
                        shadowColor: Colors.redAccent,
                        color: Colors.red[800],
                        elevation: 5.0,
                        child: TextButton(
                          onPressed: () async {
                            Position position = await _determinePosition();
                            var location = await http.get(Uri.parse(
                                "https://api.mapbox.com/geocoding/v5/mapbox.places/${position.longitude},${position.latitude}.json?access_token=pk.eyJ1IjoibXU1dGVlIiwiYSI6ImNreGxyYWVjMjFpd28yeHViaTMxd2NtYWUifQ.MRM4cIK7PhfnnDqyoJnZgg"));
                            if (location.statusCode == 200) {
                              var jsonResponse =
                                  convert.jsonDecode(location.body)
                                      as Map<String, dynamic>;

                              String address =
                                  jsonResponse['features'][0]['place_name'];
                              String message =
                                  "An accident has occured to ${widget.userName} at $address! \nPlease send emergency assistance.";
                              String recipents = widget.kinNum;

                              await HelpSMS()
                                  .send_sms(message, recipents)
                                  .whenComplete(() => print('done'));
                            } else {
                              print('No location found');
                            }
                          },
                          child: const Text(
                            'HELP!',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: SizedBox(
                          height: 40,
                          width: 70,
                          child: Material(
                            borderRadius: BorderRadius.circular(25),
                            shadowColor: Colors.cyanAccent,
                            color: Colors.green,
                            elevation: 3.0,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const SensorMainHome()));
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
                      const SizedBox(height: 10.0),
                      Center(
                        child: SizedBox(
                          height: 30,
                          width: 120,
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
                                        builder: (builder) => InfoPage()));
                              },
                              child: const Text(
                                'My information',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
