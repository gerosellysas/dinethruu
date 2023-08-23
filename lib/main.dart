import 'package:dinethruu/pages/login/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'controllers/loginController.dart';
import 'pages/home/home.dart';
import 'pages/splashScreen/splashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(onBackgroundFMListener);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final LoginController loginController = Get.put(LoginController());
  @override
  void initState() {
    super.initState();
    loginController.getInitailMessage();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      defaultTransition: Transition.downToUp,
      transitionDuration: Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
      title: 'DineThruu Shop',
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Poppins',
      ),
      home: SplashScreen(), //Login(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
//     return GetMaterialApp(
//       defaultTransition: Transition.downToUp,
//       transitionDuration: Duration(milliseconds: 500),
//       debugShowCheckedModeBanner: false,
//       title: 'DineThruu Shop',
//       theme: ThemeData(
//         primarySwatch: Colors.green,
//         fontFamily: 'Poppins',
//       ),
//       home: SplashScreen(), //Login(),
//     );
//   }
// }

Future<void> onBackgroundFMListener(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('message on backgorund');
  print(message.notification.title);
  print(message.notification.body);
}
