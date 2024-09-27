import 'dart:async';
import 'package:app/app/data/models/pedido_model.dart';
import 'package:app/app/data/repositories/pedidos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PedidoController extends GetxController {
  // Campos do formulário
  var idPedido = ''.obs;
  var nome = ''.obs;
  var endereco = ''.obs;
  var telefone = ''.obs;
  var isLocalSave = false.obs;

  // Método para validar e salvar o formulário
  Future<bool> salvarPedido() async {
    if (nome.isNotEmpty && endereco.isNotEmpty) {
      PedidoModel pedidoModel =
          PedidoModel(nome: nome.value, endereco: endereco.value,telefone: telefone.value);
      PedidosRepository pedidosRepository = PedidosRepository();

      if (idPedido.isNotEmpty) {
        await pedidosRepository.update(idPedido.value, pedidoModel);
      } else {
        var documentRef = await pedidosRepository.add(pedidoModel);
        documentRef.snapshots().listen((DocumentSnapshot snapshot) {
          if (snapshot.metadata.hasPendingWrites) {
            isLocalSave.value = true;
          } else {
            isLocalSave.value = false;
          }
        });
      }
    }
    idPedido.value = '';
    nome.value = '';
    endereco.value = '';
    telefone.value = '';
    return isLocalSave.value;
  }

  teste() {
    print(idPedido.value);
  }
}
