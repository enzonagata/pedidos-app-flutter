import 'dart:convert';
import 'package:app/app/data/models/produto_model.dart';
import 'package:app/app/data/repositories/produtos_repository.dart';
import 'package:app/app/modules/pedido/pedido_controller.dart';
import 'package:app/app/ui/theme/colors.dart';
import 'package:app/app/ui/widgets/drawer_custom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PedidoPage extends StatelessWidget {
  const PedidoPage({super.key});

  get produtoRepository => null;

  @override
  Widget build(BuildContext context) {
    final produtoRepository = ProdutosRepository();
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
                  controller.nomeCliente.value = value;
                },
              ),
              const SizedBox(height: 16),
              Obx(() {
                // Usar Obx para reatividade
                return DropdownButtonFormField<String>(
                  value: controller.produtoSelecionado.value.isEmpty
                      ? null
                      : controller.produtoSelecionado.value,
                  decoration:
                      InputDecoration(labelText: 'Selecione um Produto'),
                  items: controller.produtos.map((String produto) {
                    return DropdownMenuItem<String>(
                      value: produto,
                      child: Text(produto),
                    );
                  }).toList(),
                  onChanged: (String? novoProduto) {
                    controller.selecionarProduto(
                        novoProduto); // Atualizar o valor selecionado
                  },
                );
              }),
              const SizedBox(height: 16),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Quantidade'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  controller.quantidade.value = int.tryParse(value) ?? 0;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration:
                    const InputDecoration(labelText: 'Endereço de Entrega'),
                onChanged: (value) {
                  controller.enderecoEntrega.value = value;
                },
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    controller.salvarPedido();
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
