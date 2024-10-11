import 'package:app/app/data/models/pedido_produto_model.dart';
import 'package:app/app/data/repositories/pedidos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PedidoItensController extends GetxController {
  var idPedido = ''.obs;
  var nome = ''.obs;
  var endereco = ''.obs;
  var telefone = ''.obs;
  var produtoSelecionado = ''.obs;
  var produtos = <String>[].obs;

  var idProduto = ''.obs;
  var quantidade = 0.obs;

  var selectedItem = ''.obs;

  Stream<QuerySnapshot<Object?>> listarPedidos() {
    PedidosRepository pedidosRepository = PedidosRepository();
    return pedidosRepository.streamGetAll();
  }

  Future<void> adicionarItem() async {
    PedidoProdutoModel pedidoProdutoModel = PedidoProdutoModel(
        idProduto: idProduto.value.toString(), quantidade: quantidade.value.toInt());
    PedidosRepository pedidosRepository = PedidosRepository();
    return pedidosRepository.adicionarItem(pedidoProdutoModel, idPedido);
  }

  void selecionarProduto(String? produto) {
    produtoSelecionado.value = produto!;
  }

  // Função para selecionar um item
  void selectItem(String value) {
    idProduto.value = value;
  }
}
