import 'package:flutter/material.dart';
import 'package:accidetector/landing_page.dart';

class InfoPage extends StatefulWidget {
  final String userName;
  final String userEmail;
  final String userNum;
  final String kinName;
  final String kinEmail;
  final String kinNum;
  const InfoPage({
    super.key,
    required this.userName,
    required this.userEmail,
    required this.userNum,
    required this.kinName,
    required this.kinEmail,
    required this.kinNum,
  });
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
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
            const Center(
              child: Text(
                "Your contact information",
                style: TextStyle(
                  fontFamily: 'SourceSanPro',
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Name: ${widget.userName}",
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
              "Email: ${widget.userEmail}",
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
              "Phone No.: ${widget.userNum}",
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
              "Next of Kin's Name: ${widget.kinName}",
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
              "Next of Kin's Email: ${widget.kinEmail}",
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
              "Next of Kin's No.: ${widget.kinNum}",
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
                height: 40,
                width: 150,
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  shadowColor: Colors.cyanAccent,
                  color: Colors.cyan[800],
                  elevation: 3.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, MaterialPageRoute(builder: (builder) => const DisplayPage()));
                    },
                    child: const Text(
                      'Back to Main Page',
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
          ],
        ),
      ),
    );
  }
}
