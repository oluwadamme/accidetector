import 'package:flutter/material.dart';

class SensorInfoHolder {
  SensorInfoHolder({
    Key key,
    @required this.name,
    @required this.type,
    @required this.vendorName,
  }) {
    type = '${_getTypeToName(type)} ($type)';
  }
  String name;
  String type;
  String vendorName;

  String _getTypeToName(String type) {
    return <String, String>{
      '1': 'Accelerometer',
      '9': 'Gravity',
      '2': 'Magnetic Field',
      '3': 'Orientation',
      '4': 'Gyroscope',
      '5': 'Ambient Light',
      '12': 'Relative Humidity',
      '13': 'Ambient Room Temperature',
    }[type];
  }

  List<Widget> displaySensorData() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(name,
              style: const TextStyle(
                  color: Colors.cyanAccent, fontWeight: FontWeight.bold)),
          Text(vendorName,
              style: const TextStyle(
                  color: Colors.cyanAccent, fontWeight: FontWeight.bold))
        ],
      ),
      const Divider(
        height: 10.0,
        color: Colors.black54,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Text('Type', style: TextStyle(color: Colors.black)),
          Text(type, style: const TextStyle(color: Colors.black)),
        ],
      ),
    ];
  }

  List<Widget> appendThem(List<Widget> myList) {
    List<Widget> target = displaySensorData();
    for (var element in myList) {
      target.add(element);
    }
    return target;
  }

  String capitalize(String str) {
    return str.replaceFirst(str[0], str[0].toUpperCase());
  }
}

class Accelerometer {
  // type 1
  Accelerometer(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Accelerometer
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along X-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$x m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Y-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$y m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Z-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$z m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            )
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class Gravity {
  // type 9
  Gravity(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Gravity
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along X-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$x m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Y-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$y m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Z-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$z m/s^2', style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class MagneticField {
  // type 2
  MagneticField(this.sensor, this.x, this.y, this.z);
  SensorInfoHolder sensor;
  String x;
  String y;
  String z;
  Card getCard() {
    return Card(
      // Magnetic Field
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along X-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$x uT', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Y-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$y uT', style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Along Z-axis',
                    style: TextStyle(color: Colors.black)),
                Text('$z uT', style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class OrientationSensor {
  // type 3
  OrientationSensor(this.sensor, this.azimuth, this.pitch, this.roll);
  SensorInfoHolder sensor;
  String azimuth;
  String pitch;
  String roll;
  Card getCard() {
    return Card(
      // Orientation Sensor
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Azimuth', style: TextStyle(color: Colors.black)),
                Text(azimuth, style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Pitch', style: TextStyle(color: Colors.black)),
                Text(pitch, style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Roll', style: TextStyle(color: Colors.black)),
                Text(roll, style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class Gyroscope {
  // type 4
  Gyroscope(this.sensor, this.angularSpeedAroundX, this.angularSpeedAroundY,
      this.angularSpeedAroundZ);
  SensorInfoHolder sensor;
  String angularSpeedAroundX;
  String angularSpeedAroundY;
  String angularSpeedAroundZ;
  Card getCard() {
    return Card(
      // Gyroscope
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Angular Speed around X',
                    style: TextStyle(color: Colors.black)),
                Text('$angularSpeedAroundX rad/s',
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Angular Speed around Y',
                    style: TextStyle(color: Colors.black)),
                Text('$angularSpeedAroundY rad/s',
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Angular Speed around Z',
                    style: TextStyle(color: Colors.black)),
                Text('$angularSpeedAroundZ rad/s',
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class AmbientLight {
  // type 5
  AmbientLight(this.sensor, this.level);
  SensorInfoHolder sensor;
  String level;
  Card getCard() {
    return Card(
      // Ambient Light Sensor
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Ambient Light Level',
                    style: TextStyle(color: Colors.black)),
                Text('$level lux', style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class RelativeHumidity {
  // type 12
  RelativeHumidity(this.sensor, this.humidity);
  SensorInfoHolder sensor;
  String humidity;
  Card getCard() {
    return Card(
      // Relative Humidity
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Relative Air Humidity',
                    style: TextStyle(color: Colors.black)),
                Text('$humidity %',
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}

class AmbientRoomTemperature {
  // type 13
  AmbientRoomTemperature(this.sensor, this.temperature);
  SensorInfoHolder sensor;
  String temperature;
  Card getCard() {
    return Card(
      // Gravity
      color: Colors.grey[300],
      margin:
          const EdgeInsets.only(top: 6.0, bottom: 6.0, left: 4.0, right: 4.0),
      elevation: 8.0,
      child: Container(
        child: Column(
          children: sensor.appendThem([
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text('Temperature',
                    style: TextStyle(color: Colors.black)),
                Text('$temperature C',
                    style: const TextStyle(color: Colors.black)),
              ],
            ),
          ]),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: Colors.cyan,
            width: 0.7,
            style: BorderStyle.solid,
          ),
        ),
        padding: const EdgeInsets.only(
            left: 10.0, right: 10.0, top: 12.0, bottom: 12.0),
      ),
    );
  }
}
