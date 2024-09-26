import 'dart:async';
import 'package:app/app/data/models/pedido_model.dart';
import 'package:app/app/data/repositories/pedidos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PedidoController extends GetxController {
  // Campos do formulário
  var nome = ''.obs;
  var endereco = ''.obs;
  var isLocalSave = false.obs;

  // Método para validar e salvar o formulário
  Future<bool> salvarPedido() async {
    if (nome.isNotEmpty && endereco.isNotEmpty) {
      PedidoModel pedidoModel =
          PedidoModel(nome: nome.value, endereco: endereco.value);
      PedidosRepository pedidosRepository = PedidosRepository();
      var documentRef = await pedidosRepository.add(pedidoModel);
      documentRef.snapshots().listen((DocumentSnapshot snapshot) {
        if (snapshot.metadata.hasPendingWrites) {
          isLocalSave.value = true;
        } else {
          isLocalSave.value = false;
        }
      });
    }
    return isLocalSave.value;
  }
}
