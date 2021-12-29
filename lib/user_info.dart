import 'package:flutter/material.dart';
import 'package:accidetector/landing_page.dart';

class InfoPage extends StatefulWidget {
  String userName;
  String userEmail;
  String userNum;
  String kinName;
  String kinEmail;
  String kinNum;
  InfoPage(
      {Key key,
      this.userName,
      this.userEmail,
      this.userNum,
      this.kinName,
      this.kinEmail,
      this.kinNum})
      : super(key: key);
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
              "Name: " + widget.userName.toString(),
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
                height: 40,
                width: 150,
                child: Material(
                  borderRadius: BorderRadius.circular(25),
                  shadowColor: Colors.cyanAccent,
                  color: Colors.cyan[800],
                  elevation: 3.0,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => DisplayPage()));
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
