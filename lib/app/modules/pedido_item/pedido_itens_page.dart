import 'package:app/app/modules/pedido_item/pedido_itens_controller.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PedidoItensPage extends StatelessWidget {
  const PedidoItensPage({super.key});

  get produtoRepository => null;

  @override
  Widget build(BuildContext context) {
    final PedidoItensController pedidoItensController =
        Get.put(PedidoItensController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Itens do Pedido'),
        backgroundColor: defaultTheme,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 24),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('id: ${pedidoItensController.idPedido.value}'),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Cliente'),
                      initialValue: pedidoItensController.nome.value,
                      enabled: true,
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(labelText: 'Endereço'),
                      initialValue: pedidoItensController.endereco.value,
                      enabled: true,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              // TextFormField(
              //   decoration:
              //       const InputDecoration(labelText: 'Endereço de Entrega'),
              //   onChanged: (value) {
              //     controller.enderecoEntrega.value = value;
              //   },
              // ),
              // const SizedBox(height: 32),
              // Center(
              //   child: ElevatedButton(
              //     onPressed: () {
              //       controller.salvarPedido();
              //     },
              //     child: const Text('Cadastrar Pedido'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
