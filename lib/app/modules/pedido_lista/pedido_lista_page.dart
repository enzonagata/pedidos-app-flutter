import 'dart:convert';

import 'package:app/app/data/models/produto_model.dart';
import 'package:app/app/data/repositories/produtos_repository.dart';
import 'package:app/app/routes/app_routes.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:app/app/ui/widgets/drawer_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PedidoListaPage extends StatelessWidget {
  const PedidoListaPage({super.key});

  @override
  Widget build(BuildContext context) {
    var productsRepository = ProdutosRepository();
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Expanded(
        flex: 8,
        child: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
            stream: productsRepository.getAllProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (snapshot.hasData) {
                  var documents = snapshot.data!.docs;
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        DocumentSnapshot item = documents[index];
                        String json = jsonEncode(item.data());
                        Map<String, dynamic> docMap = jsonDecode(json);
                        var model = ProdutoModel.fromJson(docMap);
                        return Card(
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(15),
                            title: Text(model.nome),
                            onTap: () => {print('Produto ${model.nome}')},
                          ),
                        );
                      },
                      itemCount: documents.length);
                } else {
                  return const Text('Nada encontrado!');
                }
              }
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.toNamed(AppRoutes.PEDIDO)},
        child: const Icon(Icons.add),
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
