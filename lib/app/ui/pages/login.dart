import 'package:app/app/ui/theme/colors.dart';
import 'package:app/app/ui/widgets/drawer_custom.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Container(),
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
    );
  }
}

// class _LoginState extends State<Login> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(50),
//                   child: Image.asset('lib/assets/logo.png'),
//                 ),
//                 // SizedBox(
//                 //   height: 30,
//                 // ),
//                 // HeadlineText(text: 'entrar com', size: 14),
//                 // SizedBox(
//                 //   height: 12,
//                 // ),
//                 // FacebookButton(onPressed: () => {print('facebook')}),
//                 // SizedBox(
//                 //   height: 10,
//                 // ),
//                 // GoogleButton(
//                 //     onPressed: () async =>
//                 //         await Authentication.signInWithGoogle().then((value) {
//                 //           Get.to(main());
//                 //         })),
//                 // SizedBox(
//                 //   height: 100,
//                 // ),
//                 // // LogoutButton(onPressed: () async => await Authentication.signOut(context: context)),
//                 // // SizedBox(
//                 // //   height: 100,
//                 // // ),
//               ],
//             ),
//           ),
//           Positioned(
//             width: MediaQuery.of(context).size.width,
//             bottom: MediaQuery.of(context).size.height * 0.25,
//             child: const Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Expanded(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Ao entrar, estará de acordo com nosso termo de uso e privacidade.',
//                       textAlign: TextAlign.center,
//                     )
//                   ],
//                 ))
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
