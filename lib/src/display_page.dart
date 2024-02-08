import 'dart:convert' as convert;
import 'dart:developer';
import 'package:accidetector/src/auth/login_page.dart';
import 'package:accidetector/src/utils/send_sms.dart';
import 'package:accidetector/src/user_info.dart';
import 'package:flutter/material.dart';
import 'sensor/sensors.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';

class DisplayPage extends StatefulWidget {
  final String? userName;
  final String? userEmail;
  final String? userNum;
  final String? kinName;
  final String? kinEmail;
  final String? kinNum;
  const DisplayPage({
    super.key,
    this.userName,
    this.userEmail,
    this.userNum,
    this.kinName,
    this.kinEmail,
    this.kinNum,
  });
  @override
  _DisplayPageState createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  GoogleMapController? mapController;
  late Future<Position> position;
  @override
  void initState() {
    super.initState();
    setState(() {
      position = _determinePosition();
    });
  }

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
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    final position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true);
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    if (mapController != null) {
      await mapController!
          .animateCamera(CameraUpdate.newLatLngZoom(LatLng(position.latitude, position.longitude), 19.4));
    }

    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: const Text(
          'ACCIDENT DETECTOR',
          style: TextStyle(fontSize: 25, color: Colors.white),
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
                    "Hi ${widget.userName}",
                    style: const TextStyle(
                      fontFamily: 'SourceSanPro',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        position = _determinePosition();
                      });
                    },
                    icon: const Icon(Icons.refresh),
                  ),
                  SizedBox(
                    height: 40,
                    child: Material(
                      borderRadius: BorderRadius.circular(25),
                      shadowColor: Colors.redAccent,
                      color: Colors.red[800],
                      elevation: 3.0,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context, MaterialPageRoute(builder: (builder) => const LoginPage()));
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
            FutureBuilder(
              future: position,
              builder: (context, AsyncSnapshot<Position?> snapshot) {
                if (snapshot.hasData && snapshot.data != null) {
                  final pos = snapshot.data;

                  return Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 2 / 3,
                      child: GoogleMap(
                        mapType: MapType.hybrid,
                        initialCameraPosition: CameraPosition(
                          target: LatLng(pos!.latitude, pos.longitude),
                          zoom: 19.4,
                        ),
                        onTap: (argument) {
                          log(argument.toString());
                        },
                        myLocationButtonEnabled: true,
                        myLocationEnabled: true,
                        onMapCreated: (GoogleMapController controller) async {
                          mapController = controller;
                        },
                      ),
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Center(
                    child: SizedBox(
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
                              var jsonResponse = convert.jsonDecode(location.body) as Map<String, dynamic>;

                              String address = jsonResponse['features'][0]['place_name'];
                              String message =
                                  "An accident has occured to ${widget.userName} at $address! \nPlease send emergency assistance.";
                              String recipents = widget.kinNum ?? "";

                              await HelpSMS().send_sms(message, recipents).whenComplete(() => print('done'));
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
                                    context, MaterialPageRoute(builder: (builder) => const SensorMainHome()));
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
                                  builder: (builder) => InfoPage(
                                    userEmail: widget.userEmail ?? "",
                                    userName: widget.userName ?? "",
                                    userNum: widget.userNum ?? "",
                                    kinEmail: widget.kinEmail ?? "",
                                    kinName: widget.kinName ?? "",
                                    kinNum: widget.kinNum ?? "",
                                  ),
                                ),
                              );
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
