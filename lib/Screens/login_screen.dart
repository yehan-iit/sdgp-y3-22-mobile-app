import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:warehouse_app/Components/constants.dart';
import 'package:warehouse_app/Components/reusable_button.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:warehouse_app/Screens/dashboard.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Color(0xFFF2F4F5),
    //     systemNavigationBarColor: Color(0xFFF2F4F5)));
  }

  Future<bool> loginUser(email,password) async {
    setState(() {
      _isLoading = true;
    });

    var reqBody = {
      "email": email,
      "password": password
    };

    var response = await http.post(Uri.parse('https://smartallocbe.azurewebsites.net/user/login'),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(reqBody));

    var jsonResponse = jsonDecode(response.body);

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('access_token', jsonResponse['access_token']);

    setState(() {
      _isLoading = false;
    });

    if (jsonResponse['access_token'] == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF2F4F5),
        body: _isLoading ? Center(child: CircularProgressIndicator()) : Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 200,
                child: Image.asset('images/logo.png'),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    )),
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kInputDecoration.copyWith(
                    hintText: 'Enter Your email',
                    prefixIcon: const Icon(
                      Ionicons.person_outline,
                      size: 20.0,
                    )),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                  obscureText: true,
                  style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      )),
                  onChanged: (value) {
                    //Do something with the user input.
                    password = value;
                  },
                  decoration: kInputDecoration.copyWith(
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(
                      Ionicons.lock_open_outline,
                      size: 20.0,
                    ),
                  )),
              const SizedBox(
                height: 24.0,
              ),
              ReusableButton(
                color: const Color(0xFF0097B2),
                onPressed: () async {

                  if (email != null && password != null) {
                    var connectivityResult = await (Connectivity().checkConnectivity());
                    if (connectivityResult == ConnectivityResult.mobile ||
                            connectivityResult == ConnectivityResult.wifi) {
                      bool loggedIn = await loginUser(email, password);
                      if (loggedIn) {
                        Navigator.pushNamed(context, UserDashboard.id);
                      } else {
                        showOkAlertDialog(
                            context: context,
                            title: 'Invalid Credentials',
                            message: 'Email or Password entered is incorrect');
                      }
                    } else {
                      showOkAlertDialog(
                                context: context,
                                title: 'No Connection',
                                message:
                                'Please connect to an internet connection and try again');
                    }
                  }
                },
                showText: 'Log In',
                minWidth: 200.0,
                height: 42.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

