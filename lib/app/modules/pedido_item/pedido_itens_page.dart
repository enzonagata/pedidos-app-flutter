import 'dart:convert';

import 'package:app/app/data/models/pedido_model.dart';
import 'package:app/app/modules/pedido_item/pedido_itens_controller.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_controller.dart';
import 'package:app/app/routes/app_routes.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:app/app/ui/widgets/itens_pedido_bottom_sheet.dart';
import 'package:app/app/ui/widgets/title_with_values.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PedidoItensPage extends StatelessWidget {
  const PedidoItensPage({super.key});

  get produtoRepository => null;

  @override
  Widget build(BuildContext context) {
    final PedidoItensController pedidoItensController =
        Get.put(PedidoItensController());

    final PedidoListaController pedidoListaController = PedidoListaController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.toNamed(AppRoutes.PEDIDO_LISTA),
        ),
        title: const Text('Itens do Pedido'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TitleWithValue(
                        title: "Cliente",
                        value: pedidoItensController.nome.value),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TitleWithValue(
                        title: "Telefone",
                        value: pedidoItensController.telefone.value),
                  ),
                ],
              ),
              const Divider(
                color: Colors.grey, // Cor da linha
                thickness: 1, // Espessura da linha
              ),
              SingleChildScrollView(
                child: StreamBuilder<QuerySnapshot>(
                  stream: pedidoListaController.listarPedidos(),
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
                        if (documents.isNotEmpty) {
                          return ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                DocumentSnapshot item = documents[index];
                                String json = jsonEncode(item.data());
                                Map<String, dynamic> docMap = jsonDecode(json);
                                var model = PedidoModel.fromJson(docMap);
                                return Card(
                                  child: ListTile(
                                      contentPadding: const EdgeInsets.all(15),
                                      title: Text(model.nome),
                                      subtitle: Text(model.endereco),
                                      trailing: OutlinedButton(
                                        onPressed: () {},
                                        child: const Icon(Icons.delete_forever),
                                      ),
                                      leading: OutlinedButton(
                                        onPressed: () {
                                          Get.toNamed(AppRoutes.PEDIDO);
                                        },
                                        child: const Icon(Icons.edit),
                                      ),
                                      onTap: () {
                                        pedidoItensController.idPedido.value =
                                            item.id;
                                        pedidoItensController.nome.value =
                                            model.nome;
                                        pedidoItensController.endereco.value =
                                            model.endereco;
                                        pedidoItensController.telefone.value =
                                            model.telefone!;
                                        Get.toNamed(AppRoutes.PEDIDO_ITENS);
                                      }),
                                );
                              },
                              itemCount: documents.length);
                        } else {
                          return const Text('Nenhum pedido cadastrado');
                        }
                      } else {
                        return const Text('Nada encontrado!');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ItensPedidoBottomSheet(context: context).show();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
