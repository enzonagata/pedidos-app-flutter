import 'package:app/app/modules/pedido_item/pedido_itens_controller.dart';
import 'package:app/app/modules/produtos/produto_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItensPedidoBottomSheet {
  BuildContext context;
  ItensPedidoBottomSheet({required this.context});

  final ProdutoController produtoController = Get.put(ProdutoController());
  final PedidoItensController pedidoItensController =
      Get.put(PedidoItensController());

  void show() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.65,
          padding: const EdgeInsets.all(15),
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Obx(() {
                      return DropdownButton<String>(
                        value: pedidoItensController.idProduto.value.isEmpty
                            ? null
                            : pedidoItensController.idProduto.value,
                        hint: const Text('Selecione uma opção'),
                        items: produtoController.produtos.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.idProduto,
                            child: Text(item.nome),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          pedidoItensController.selectItem(value!);
                        },
                      );
                    }),
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          pedidoItensController.adicionarItem();
                        },
                        child: const Icon(Icons.save_alt),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
