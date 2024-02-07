import 'package:accidetector/src/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'src/auth/signup.dart';
import 'src/display_page.dart';

void main() {
  runApp(const FirstPage());
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => const SignupPage(),
        '/login': (BuildContext context) => const LoginPage(),
        '/display_page': (BuildContext context) => const DisplayPage()
      },
      title: 'Accident Detector',
      theme: ThemeData(brightness: Brightness.dark, primaryColor: Colors.grey, useMaterial3: true),
      home: const LoginPage(),
    );
  }
}
