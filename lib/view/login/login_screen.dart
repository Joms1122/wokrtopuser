import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:worktopuser/api/api.dart';
import 'package:worktopuser/view/home/facilities.dart';
import 'package:worktopuser/res/loaderdialog.dart';
import 'package:worktopuser/view/login/signup_screen.dart';
import 'package:worktopuser/api/secure_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<LoginScreen> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _token = TextEditingController();
  final GlobalKey<State> _LoaderDialog = new GlobalKey<State>();

  Future init() async {
    final token = await UserSecureStorage.gettoken() ?? '';

    setState(() {
      this._token.text = token;
    });
  }

  @override
  Widget build(BuildContext context) {
    return initWidget();
  }

  initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: const BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: Color.fromARGB(255, 49, 52, 90),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/images/icon_a.png",
                      height: 100,
                      width: 100,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: const Text(
                      'DrinkLink - WorkTop',
                      textScaleFactor: 1.2,
                      softWrap: true,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                  // Container(
                  //   margin: const EdgeInsets.only(right: 20, top: 20),
                  //   alignment: Alignment.bottomRight,
                  //   child: const Text(
                  //     "Login",
                  //     style: TextStyle(fontSize: 20, color: Colors.white),
                  //   ),
                  // )
                ],
              )),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 40),
              alignment: Alignment.center,
              child: const Text(
                "Please input your login information.",
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xffF5591F),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 30),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.grey[200],
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Username/Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: _username,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: const EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xffEEEEEE),
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextField(
                obscureText: true,
                cursorColor: const Color(0xffF5591F),
                decoration: const InputDecoration(
                  focusColor: Color(0xffF5591F),
                  icon: Icon(
                    Icons.vpn_key,
                    color: Color(0xffF5591F),
                  ),
                  hintText: "Enter Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                controller: _password,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  // Write Click Listener Code Here
                },
                child: const Text("Forgot Password?"),
              ),
            ),
            GestureDetector(
              onTap: () {
                login();
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 50),
                padding: const EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    (Color.fromARGB(255, 49, 52, 90)),
                    Color.fromARGB(255, 49, 52, 90),
                  ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(color: Color(0xffF5591F)),
                ),
                // child: const Text(
                //   "LOGIN",
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have Any Account?  "),
                  GestureDetector(
                    child: const Text(
                      "Register Now",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      setState(() {});
                      // Write Tap Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    LoaderDialog.showLoadingDialog(context, _LoaderDialog);
    // if (_username.text.isNotEmpty && _password.text.isEmpty) {
    // ScaffoldMessenger.of(context)
    //     .showSnackBar(const SnackBar(content: Text('has text!')));
    var res = await http.post(
      Uri.parse(ApiCon.baseurl + '/auth/worktop/token'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          "username": _username.text,
          "password": _password.text
        },
      ),
    );

    await UserSecureStorage.clearToken();

    if (res.statusCode == 200) {
      var jsondata = json.decode(res.body);
      await UserSecureStorage.setToken(jsondata['token'].toString());
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                facilities(_username.text, jsondata['facilityId'].toString()),
          ));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid Credential!')));
      Navigator.pop(context, _LoaderDialog);
      // Navigator.of(_LoaderDialog.currentContext, rootNavigator: true).pop();
    }
    // } else {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(const SnackBar(content: Text('Access Denied!')));
    // }
  }
}
