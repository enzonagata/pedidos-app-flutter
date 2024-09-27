import 'package:app/app/modules/pedido/pedido_controller.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:get/get.dart';

class PedidoPage extends StatelessWidget {
  const PedidoPage({super.key});

  get produtoRepository => null;

  @override
  Widget build(BuildContext context) {
    
    final PedidoController pedidoController = Get.put(PedidoController());
    final TextEditingController textEditingController = MaskedTextController(
        mask: '(00) 00000-0000',
        text: (pedidoController.telefone.value.isNotEmpty)
            ? pedidoController.telefone.value
            : '');
    print(pedidoController.telefone.value);
    return Scaffold(
      appBar: AppBar(
        title: (pedidoController.idPedido.isNotEmpty)
            ? const Text('Atualizar Pedido')
            : const Text('Novo Pedido'),
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
                initialValue: pedidoController.nome.value,
                onChanged: (value) {
                  pedidoController.nome.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Endereço de Entrega'),
                initialValue: pedidoController.endereco.value,
                onChanged: (value) {
                  pedidoController.endereco.value = value;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(labelText: 'Telefone'),
                onChanged: (value) {
                  pedidoController.telefone.value = value;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    await pedidoController.salvarPedido().then((v) {
                      Get.back(closeOverlays: true);
                      if (v) {
                        Get.snackbar('Sucesso', 'Pedido cadastrado offiline');
                      } else {
                        if (pedidoController.idPedido.isNotEmpty) {
                          Get.snackbar('Sucesso', 'Pedido atualizado!');
                        } else {
                          Get.snackbar('Sucesso', 'Pedido cadastrado!');
                        }
                      }
                    });
                  },
                  child: (pedidoController.idPedido.isNotEmpty)
                      ? const Text('Atualizar Pedido')
                      : const Text('Cadastrar Pedido'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
