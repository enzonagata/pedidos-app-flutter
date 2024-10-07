import 'package:firebase_core/firebase_core.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'app/routes/app_routes.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyC3rjdyNLFPS7NjxrXz90el-Q3RpPPZrls",
        appId: "1:170853061240:web:7d611497d1ee31ddbbd38d",
        messagingSenderId: "170853061240",
        projectId: "pedidos-c01ef",
        authDomain: "pedidos-c01ef.firebaseapp.com",
        storageBucket: "pedidos-c01ef.appspot.com",
        measurementId: "G-9RBCX3FE1V"),
  );
  runApp(const Pedidos());
}

// ignore: must_be_immutable
class Pedidos extends StatelessWidget {
  //late Widget initializeScreen;

  const Pedidos({super.key});
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
          title: 'Pedidos',
          theme: ThemeData(
              primarySwatch: defaultTheme,
              secondaryHeaderColor: defaultTheme[900]),
          initialRoute: AppRoutes.PEDIDO_LISTA,
          getPages: AppPages.pages,
        );
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
