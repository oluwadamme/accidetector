import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'sensor_info_holder.dart';

class SensorMainHome extends StatefulWidget {
  const SensorMainHome({super.key});

  @override
  _SensorMainState createState() => _SensorMainState();
}

SensorInfoHolder getMeAnInstanceOfSensorInfoHolder(Map<String, String> data) {
  return SensorInfoHolder(
    name: data['name'].toString(),
    type: data['type'].toString(),
    vendorName: data['vendorName'].toString(),
  );
}

class _SensorMainState extends State<SensorMainHome> {
  static const String _methodChannelName = 'com.example.accidetector.androidMethodChannel'; // keep it unique
  static const String _eventChannelName = 'com.example.accidetector.androidEventChannel'; // keep it unique too
  static MethodChannel _methodChannel = const MethodChannel(_methodChannelName);
  static EventChannel _eventChannel = const EventChannel(_eventChannelName);
  bool _isFirstUIBuildDone = false;
  final List<Accelerometer> _listAccelerometer = [];
  final List<Gravity> _listGravity = [];
  final List<MagneticField> _listMagneticField = [];
  final List<OrientationSensor> _listOrientationSensor = [];
  final List<Gyroscope> _listGyroscope = [];
  final List<AmbientLight> _listAmbientLight = [];
  final List<RelativeHumidity> _listRelativeHumidity = [];
  final List<AmbientRoomTemperature> _listAmbientRoomTemperature = [];

  Future<void> getSensorsList() async {
    Map<String, List<dynamic>> sensorCount;
    try {
      Map<dynamic, dynamic> tmp = await _methodChannel.invokeMethod('getSensorsList');
      sensorCount = Map<String, List<dynamic>>.from(tmp);
      sensorCount.forEach((String key, List<dynamic> value) {
        switch (key) {
          case '1':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listAccelerometer.add(Accelerometer(
                    getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA', 'NA', 'NA'));
              }
            }
            break;
          case '9':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listGravity.add(
                    Gravity(getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA', 'NA', 'NA'));
              }
            }
            break;
          case '2':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listMagneticField.add(MagneticField(
                    getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA', 'NA', 'NA'));
              }
            }
            break;
          case '3':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listOrientationSensor.add(OrientationSensor(
                    getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA', 'NA', 'NA'));
              }
            }
            break;
          case '4':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listGyroscope.add(
                    Gyroscope(getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA', 'NA', 'NA'));
              }
            }
            break;
          case '5':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listAmbientLight
                    .add(AmbientLight(getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA'));
              }
            }
            break;
          case '12':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listRelativeHumidity
                    .add(RelativeHumidity(getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA'));
              }
            }
            break;
          case '13':
            if (value.isNotEmpty) {
              for (var element in value) {
                _listAmbientRoomTemperature.add(
                    AmbientRoomTemperature(getMeAnInstanceOfSensorInfoHolder(Map<String, String>.from(element)), 'NA'));
              }
            }
            break;
          default:
          //not supported yet
        }
      });
      // ignore: empty_catches
    } on PlatformException {}
    setState(() {
      // UI rebuilding is done here
      _isFirstUIBuildDone = true;
    });
  }

  @override
  void initState() {
    // stateful widget initialization done here
    super.initState();
    _methodChannel = const MethodChannel(_methodChannelName);
    _eventChannel = const EventChannel(_eventChannelName);
    getSensorsList();
    _eventChannel.receiveBroadcastStream().listen(_onData, onError: _onError);
  }

  @override
  void dispose() {
    getSensorsList();
    super.dispose();
  }

  bool isAMatch(SensorInfoHolder data, Map<String, String> receivedData) {
    // Finds whether it is an instance of target class so that we can use it to update UI.
    return (data.name == receivedData['name'] && data.vendorName == receivedData['vendorName']);
  }

  void _onData(dynamic event) {
    // on sensor data reception, update data holders of different supported sensor types
    if (!_isFirstUIBuildDone) return;
    Map<String, String> receivedData = Map<String, String>.from(event);

    switch (receivedData['type']) {
      case '1':
        for (var item in _listAccelerometer) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');

            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        }
        break;
      case '9':
        for (var item in _listGravity) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        }
        break;
      case '2':
        for (var item in _listMagneticField) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.x = sensorFeed[0];
              item.y = sensorFeed[1];
              item.z = sensorFeed[2];
            });
          }
        }
        break;
      case '3':
        for (var item in _listOrientationSensor) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.azimuth = sensorFeed[0];
              item.pitch = sensorFeed[1];
              item.roll = sensorFeed[2];
            });
          }
        }
        break;
      case '4':
        for (var item in _listGyroscope) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.angularSpeedAroundX = sensorFeed[0];
              item.angularSpeedAroundY = sensorFeed[1];
              item.angularSpeedAroundZ = sensorFeed[2];
            });
          }
        }
        break;
      case '5':
        for (var item in _listAmbientLight) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.level = sensorFeed[0];
            });
          }
        }
        break;
      case '12':
        for (var item in _listRelativeHumidity) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.humidity = sensorFeed[0];
            });
          }
        }
        break;
      case '13':
        for (var item in _listAmbientRoomTemperature) {
          if (isAMatch(item.sensor, receivedData)) {
            List<String> sensorFeed = receivedData['values']!.split(';');
            setState(() {
              item.temperature = sensorFeed[0];
            });
          }
        }
        break;
      default:
      //not supported yet
    }
  }

  void _onError(dynamic error) {} // not handling errors yet :)

  List<Widget> buildUI(BuildContext context) {
    // main UI rendering operation is performed here, be careful
    List<Widget> tmpUI = [];
    for (var elem in <List<dynamic>>[
      _listAccelerometer,
      _listGravity,
      _listMagneticField,
      _listOrientationSensor,
      _listGyroscope,
      _listAmbientLight,
      _listRelativeHumidity,
      _listAmbientRoomTemperature,
    ]) {
      for (var item in elem) {
        tmpUI.add(item.getCard());
        // SaveFile().saveFile(item);
      }
    }
    return tmpUI;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text(
          'SENSORS',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.cyan[800],
      ),
      body: ListView(padding: const EdgeInsets.all(6.0), children: buildUI(context)),
    );
  }
}
