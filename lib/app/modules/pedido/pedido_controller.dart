import 'package:get/get.dart';

class PedidoController extends GetxController {
  // Campos do formulário
  var nomeCliente = ''.obs;
  var produtoSelecionado = ''.obs;
  var quantidade = 0.obs;
  var enderecoEntrega = ''.obs;

  // Lista de produtos
  final List<String> produtos = ['Produto A', 'Produto B', 'Produto C'];

  // Método para validar e salvar o formulário
  void salvarPedido() {
    if (nomeCliente.isNotEmpty &&
        produtoSelecionado.isNotEmpty &&
        quantidade.value > 0 &&
        enderecoEntrega.isNotEmpty) {
      Get.snackbar(
        'Sucesso',
        'Pedido cadastrado com sucesso!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        'Erro',
        'Preencha todos os campos corretamente!',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void selecionarProduto(String? produto) {
    produtoSelecionado.value = produto!;
  }
}
