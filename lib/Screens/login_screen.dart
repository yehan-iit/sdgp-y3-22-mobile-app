import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:warehouse_app/Components/constants.dart';
import 'package:warehouse_app/Components/reusable_button.dart';
import 'package:adaptive_dialog/adaptive_dialog.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //     statusBarColor: Color(0xFFF2F4F5),
    //     systemNavigationBarColor: Color(0xFFF2F4F5)));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Color(0xFFF2F4F5),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 100,
                child: Image.asset('images/logo.png'),
              ),
              const SizedBox(
                height: 48.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                style: GoogleFonts.poppins(
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
                  style: GoogleFonts.poppins(
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

                  if (email == 'test' && password == '123') {
                    // Navigator.pushNamed(context, AdminPanel.id);
                    showOkAlertDialog(
                        context: context,
                        title: 'Success',
                        message: 'login success');
                  } else {
                    // Navigator.pushNamed(context, UserDashboard.id);
                    showOkAlertDialog(
                        context: context,
                        title: 'user not found',
                        message: 'The user does not exsist');
                  }

                  // var connectivityResult =
                  // await (Connectivity().checkConnectivity());
                  // if (connectivityResult == ConnectivityResult.mobile ||
                  //     connectivityResult == ConnectivityResult.wifi) {
                  //   // I am connected to a network.
                  //   print('Connected');

                    // setState(() {
                    //   showSpinner = true;
                    // });

                    // try {
                    //   final exsistUser = await _auth.signInWithEmailAndPassword(
                    //       email: email!, password: password!);
                    //   exsistuser = exsistUser;
                    // } on FirebaseAuthException catch (e) {
                    //   print('Failed with error code: ${e.code}');
                    //   print(e.message);
                    //   if (e.code == 'user-not-found') {
                    //     showOkAlertDialog(
                    //         context: context,
                    //         title: 'user not found',
                    //         message: 'The user does not exsist');
                    //   } else if (e.code == 'wrong-password') {
                    //     showOkAlertDialog(
                    //         context: context,
                    //         title: 'invalid password',
                    //         message: 'The entered password is incorrect');
                    //   } else {
                    //     showOkAlertDialog(
                    //         context: context,
                    //         title: e.code,
                    //         message: e.message);
                    //   }
                    // }
                    // try {
                    //   if (exsistuser != null) {
                    //     // final User user = await _auth.currentUser!;
                    //     // final userid = user.uid;
                    //     if (userid == 'j5RgKh5zXEXIi2wawMtl1V2iuI52') {
                    //       Navigator.pushNamed(context, AdminPanel.id);
                    //     } else {
                    //       Navigator.pushNamed(context, UserDashboard.id);
                    //     }
                    //   } else {
                    //     print('Something Went Down');
                    //   }
                    // } catch (e) {
                    //   print('Something Went Wrong');
                    // }
                    // setState(() {});
                  // } else {
                  //   // not connected to a network.
                  //   showOkAlertDialog(
                  //       context: context,
                  //       title: 'No Connection',
                  //       message:
                  //       'Please connect to an internet connection and try again');
                  // }
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

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }