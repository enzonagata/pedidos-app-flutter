import 'package:app/app/modules/pedido/pedido_controller.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PedidoPage extends StatelessWidget {
  const PedidoPage({super.key});

  get produtoRepository => null;

  @override
  Widget build(BuildContext context) {
    final PedidoController controller = Get.put(PedidoController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Pedido'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome do Cliente'),
                onChanged: (value) {
                  controller.nome.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Endereço de Entrega'),
                onChanged: (value) {
                  controller.endereco.value = value;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    print('aaaaaaaa');
                    await controller.salvarPedido().then((v) {
                      print(v);
                      Get.back(closeOverlays: true);
                      if (v) {
                        Get.snackbar('Sucesso', 'Pedido cadastrado offiline');
                      } else {
                        Get.snackbar('Sucesso', 'Pedido cadastrado!');
                      }
                    });
                  },
                  child: const Text('Cadastrar Pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
