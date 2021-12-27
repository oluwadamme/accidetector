import 'package:flutter/material.dart';
import 'main.dart';
import 'display_page.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController signUpName = TextEditingController();
  TextEditingController signUpEmail = TextEditingController();
  TextEditingController signUpNum = TextEditingController();
  TextEditingController signUpKinName = TextEditingController();
  TextEditingController signUpKinEmail = TextEditingController();
  TextEditingController signUpKinNum = TextEditingController();

  @override
  void dispose() {
    signUpName.dispose();
    signUpEmail.dispose();
    signUpNum.dispose();
    signUpKinName.dispose();
    signUpKinEmail.dispose();
    signUpKinNum.dispose();
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
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
              child: const Text(
                "Create an Account ",
                style: TextStyle(
                  fontFamily: 'SourceSanPro',
                  fontSize: 25,
                  color: Colors.cyan,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: signUpName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: signUpEmail,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: signUpNum,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: 'Phone no.',
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: signUpKinName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: "Kin's name",
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: signUpKinEmail,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: "Kin's email",
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: signUpKinNum,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    decoration: const InputDecoration(
                      labelText: "Kin's phone no.",
                      labelStyle: TextStyle(
                        fontFamily: 'SourceSansPro',
                        fontSize: 20,
                        color: Colors.black,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            await prefs.setString(
                                'name', signUpName.text.toString());
                            await prefs.setString(
                                'email', signUpEmail.text.toString());
                            await prefs.setString(
                                'num', signUpNum.text.toString());
                            await prefs.setString(
                                'kinName', signUpKinName.text.toString());
                            await prefs.setString(
                                'kinEmail', signUpKinEmail.text.toString());
                            await prefs.setString(
                                'kinNum', signUpKinNum.text.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (builder) => DisplayPage(
                                          userName: signUpName.text,
                                          userEmail: signUpEmail.text,
                                          userNum: signUpNum.text,
                                          kinName: signUpKinName.text,
                                          kinEmail: signUpKinEmail.text,
                                          kinNum: signUpKinNum.text,
                                        )));
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Already have an account",
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FirstPage()),
                          );
                        },
                        child: const Text(
                          'login',
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
        ),
      )),
    );
  }

  // save() async {
  //   await SecondPage.init();
  //   //prefs.setString('name', signUpName.text.toString());
  //   //prefs.setString('email', signUpEmail.text.toString());
  //   //prefs.setString('num', signUpNum.text.toString());
  //   //prefs.setString('kinName', signUpKinName.text.toString());
  //   //prefs.setString('kinEmail', signUpKinEmail.text.toString());
  //   //prefs.setString('kinNum', signUpKinNum.text.toString());
  // }
}
