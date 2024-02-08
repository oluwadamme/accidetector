import 'package:flutter/material.dart';
import '../../main.dart';
import '../display_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

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
  late SharedPreferences prefs;
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
  void initState() {
    super.initState();
    Future.microtask(() async => prefs = await SharedPreferences.getInstance());
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.cyan[800],
        title: const Text(
          'ACCIDENT DETECTOR',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      body: SafeArea(
          child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Column(
            children: <Widget>[
              const Text(
                "Create an Account ",
                style: TextStyle(
                  fontFamily: 'SourceSanPro',
                  fontSize: 25,
                  color: Colors.cyan,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: signUpName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.name,
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
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "field must not be empty";
                      }
                      Future.microtask(() async => await prefs.setString('name', signUpName.text.trim().toString()));
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signUpEmail,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
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
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "field must not be empty";
                      }
                      if (!value.contains("@")) {
                        return "email is invalid";
                      }
                      Future.microtask(() async => await prefs.setString('email', signUpEmail.text.trim().toString()));
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signUpNum,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "field must not be empty";
                      }
                      if (value.trim().length < 11) {
                        return "phone field must be 11 digits";
                      }
                      Future.microtask(() async => await prefs.setString('num', signUpNum.text.trim().toString()));
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
                    keyboardType: TextInputType.phone,
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signUpKinName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "field must not be empty";
                      }
                      Future.microtask(
                          () async => await prefs.setString('kinName', signUpKinName.text.trim().toString()));
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signUpKinEmail,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "field must not be empty";
                      }
                      if (!value.trim().contains("@")) {
                        return "email is invalid";
                      }
                      if (value.trim() == signUpEmail.text.trim()) {
                        return "kin's email cannot be same as email";
                      }
                      Future.microtask(
                          () async => await prefs.setString('kinEmail', signUpKinEmail.text.trim().toString()));
                      return null;
                    },
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
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: signUpKinNum,
                    style: const TextStyle(
                      color: Colors.black,
                      fontFamily: 'SourceSansPro',
                    ),
                    obscureText: false,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field must not be empty";
                      }
                      if (value.trim().length < 11) {
                        return "phone field must be 11 digits";
                      }
                      // if (value.trim() == signUpKinNum.text.trim()) {
                      //   return "kin's phone number cannot be same as yours";
                      // }
                      Future.microtask(
                          () async => await prefs.setString('kinNum', signUpKinNum.text.trim().toString()));
                      return null;
                    },
                    onChanged: (value) => setState(() {}),
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
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        shadowColor: Colors.cyanAccent,
                        backgroundColor: Colors.cyan[800],
                        elevation: 3.0,
                      ),
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => DisplayPage(
                                userName: signUpName.text.trim(),
                                userEmail: signUpEmail.text.trim(),
                                userNum: signUpNum.text.trim(),
                                kinName: signUpKinName.text.trim(),
                                kinEmail: signUpKinEmail.text.trim(),
                                kinNum: signUpKinNum.text.trim(),
                              ),
                            ),
                          );
                        }
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
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
                            MaterialPageRoute(builder: (context) => const FirstPage()),
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
            ],
          ),
        ),
      )),
    );
  }
}
