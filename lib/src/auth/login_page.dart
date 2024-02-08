import 'package:accidetector/src/display_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginValue = TextEditingController();
  late SharedPreferences prefs;
  @override
  void dispose() {
    loginValue.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      loginValue.text = email ?? "";
    });
  }

  final formKey = GlobalKey<FormState>();

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
          child: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
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
                      prefixIcon: Icon(Icons.person_outline_rounded, color: Colors.grey),
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
                    onChanged: (value) => setState(() {}),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "field must not be empty";
                      }
                      if (!value.contains("@")) {
                        return "email is invalid";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      shadowColor: Colors.cyanAccent,
                      backgroundColor: Colors.cyan[800],
                      elevation: 3.0,
                    ),
                    onPressed: () async {
                      FocusScope.of(context).unfocus();
                      if (formKey.currentState!.validate()) {
                        if (loginValue.text.trim() == prefs.getString('email')) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (builder) => DisplayPage(
                                userEmail: loginValue.text.trim(),
                                userName: prefs.getString('name'),
                                userNum: prefs.getString('num'),
                                kinName: prefs.getString('kinName'),
                                kinEmail: prefs.getString('kinEmail'),
                                kinNum: prefs.getString('kinNum'),
                              ),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => AlertDialog.adaptive(
                              title: const Text("Notice!!!"),
                              content: const Text("No account found!!!"),
                              actions: [
                                TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))
                              ],
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
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
        ),
      )),
    );
  }
}
