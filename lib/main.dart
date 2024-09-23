// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:app/app/ui/pages/Login.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:get/get.dart';
// import 'package:guiaclube/utils/Authentication.dart';
// import 'package:guiaclube/utils/colors.dart';
// import 'package:guiaclube/widgets/EstablishmentsTabs.dart';
// import 'package:guiaclube/widgets/Login.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  // WidgetsFlutterBinding.ensureInitialized();
  // await Authentication.initializeFirebase();
  // await Firebase.initializeApp();

  // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await FirebaseMessaging.instance.getToken().then((value){
  //   print('token------->>>>>>>>>>> ${value.toString()}');
  // });
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );

  // if (USE_FIRESTORE_EMULATOR) {
  //   FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
  // }
  runApp(const GuiaClube());
}

// ignore: must_be_immutable
class GuiaClube extends StatelessWidget {
  //late Widget initializeScreen;

  const GuiaClube({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, AsyncSnapshot snapshot) {
        // Show splash screen while waiting for app resources to load:
        // if (snapshot.connectionState == ConnectionState.waiting) {
        //   return GetMaterialApp(home: Splash());
        // } else {
        //   //Verifica se a pessoa ja efetou o login
        //   if (Authentication.verifyUserLogged()) {
        //     initializeScreen = EstablishmentsTabs();
        //   } else {
        //     initializeScreen = Login();
        //   }
        return GetMaterialApp(
          title: 'Guia Clube',
          theme: ThemeData(
              primarySwatch: defaultTheme,
              secondaryHeaderColor: defaultTheme[900]),
          home: const Login(),
        );
        //}
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultTheme,
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Image.asset('lib/assets/logo-white.png'),
        ),
      ),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();
  Future initialize() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}
