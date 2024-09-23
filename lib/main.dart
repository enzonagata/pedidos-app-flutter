import 'package:firebase_core/firebase_core.dart';
import 'package:app/app/ui/pages/pedido.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp();  
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
          title: 'Pedidos',
          theme: ThemeData(
              primarySwatch: defaultTheme,
              secondaryHeaderColor: defaultTheme[900]),
          home: const Pedido(),
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
