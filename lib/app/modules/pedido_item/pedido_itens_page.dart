import 'package:app/app/modules/pedido_item/pedido_itens_controller.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_controller.dart';
import 'package:app/app/routes/app_routes.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:app/app/ui/widgets/itens_pedido_bottom_sheet.dart';
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
    if (pedidoItensController.idPedido.value.isEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Get.toNamed(AppRoutes.PEDIDO_LISTA);
      });
    }
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: StreamBuilder<DocumentSnapshot>(
            stream: pedidoListaController
                .listarItensPedidos(pedidoItensController.idPedido.value),
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
                  var documents = snapshot.data!;
                  if (snapshot.data!.exists) {
                    final dados = documents.data() as Map<String, dynamic>;
                    final List<dynamic> itens = dados['itens'] ?? [];
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          final item = itens[index];
                          return Card(
                            child: ListTile(
                                contentPadding: const EdgeInsets.all(15),
                                title: Text(item['id_produto'].toString()),
                                subtitle: Text(item['quantidade'].toString()),
                                trailing: OutlinedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.delete_forever),
                                ),
                                leading: OutlinedButton(
                                  onPressed: () {},
                                  child: const Icon(Icons.edit),
                                ),
                                onTap: () {}),
                          );
                        },
                        itemCount: itens.length);
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
      ),
      appBar: AppBar(
        title: const Text('Lista de Pedidos'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
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
