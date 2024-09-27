import 'package:app/app/data/repositories/pedidos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PedidoListaController extends GetxController {
  var pedidos = <String>[].obs;
  var idPedido = ''.obs;

  @override
  void onInit() {
    super.onInit();
    listarPedidos(); // Buscar os produtos ao inicializar o controller
  }

  Stream<QuerySnapshot<Object?>> listarPedidos() {
    PedidosRepository pedidosRepository = PedidosRepository();
    return pedidosRepository.streamGetAll();
  }

  Future<void> delete(idPedido) async{
    PedidosRepository pedidosRepository = PedidosRepository();
    return await pedidosRepository.delete(idPedido);
  }
}
