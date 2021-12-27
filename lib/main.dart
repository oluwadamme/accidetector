import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup.dart';
import 'display_page.dart';

void main() {
  runApp(const FirstPage());
} 

class FirstPage extends StatelessWidget {
  const FirstPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/signup': (BuildContext context) => const SignupPage(),
        '/display_page': (BuildContext context) => DisplayPage()
      },
      title: 'Accident Detector',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginValue = TextEditingController();

  @override
  void dispose() {
    loginValue.dispose();
    super.dispose();
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
          Container(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 50),
                TextFormField(
                  controller: loginValue,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontFamily: 'SourceSansPro',
                  ),
                  obscureText: false,
                  decoration: const InputDecoration(
                    focusColor: Colors.white,
                    prefixIcon:
                        Icon(Icons.person_outline_rounded, color: Colors.grey),
                    fillColor: Colors.grey,
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan),
                    ),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: "SourceSansPro",
                    ),
                    labelText: 'Enter email',
                    labelStyle: TextStyle(
                      fontFamily: 'SourceSansPro',
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
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
                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        var email = prefs.getString('email');
                        if (email == loginValue.text) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => DisplayPage(
                                        userEmail: email,
                                        userName: prefs.getString('name'),
                                        userNum: prefs.getString('num'),
                                        kinName: prefs.getString('kinName'),
                                        kinEmail: prefs.getString('kinEmail'),
                                        kinNum: prefs.getString('kinNum'),
                                      )));
                        } else {}
                      },
                      child: const Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 200),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'SourceSansPro',
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed('/signup');
                      },
                      child: const Text(
                        'Create one',
                        style: TextStyle(
                          color: Colors.green,
                          decoration: TextDecoration.underline,
                          fontSize: 15,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
