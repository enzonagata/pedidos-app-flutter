import 'dart:async';
import 'package:app/app/data/models/pedido_model.dart';
import 'package:app/app/data/repositories/pedidos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PedidoController extends GetxController {
  // Campos do formulário
  var nome = ''.obs;
  var endereco = ''.obs;

  // Método para validar e salvar o formulário
  Future<DocumentReference<Object?>> salvarPedido() {
    if (nome.isNotEmpty && endereco.isNotEmpty) {
      PedidoModel pedidoModel =
          PedidoModel(nome: nome.value, endereco: endereco.value);
      PedidosRepository pedidosRepository = PedidosRepository();
      return pedidosRepository.create(pedidoModel);
    } else {
      return Future.error('Não foi possível fazer o cadastro do pedido');
    }
  }
}
