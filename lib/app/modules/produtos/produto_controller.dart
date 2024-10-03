import 'package:app/app/data/models/produto_model.dart';
import 'package:app/app/data/repositories/produtos_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProdutoController extends GetxController {
  var produtos = <ProdutoModel>[].obs; // Lista de produtos observável
  var produtoSelecionado = ''.obs; // Produto selecionado no dropdown

  @override
  void onInit() {
    super.onInit();
    buscarProdutos(); // Buscar os produtos ao inicializar o controller
  }

  // Método para buscar os produtos do Firebase Firestore
  void buscarProdutos() async {
    var produtosRepository = ProdutosRepository();
    try {
      QuerySnapshot snapshot = await produtosRepository.getAll();
      produtos.value = snapshot.docs.map((doc) {
        ProdutoModel produtoModel =
            ProdutoModel(nome: doc['nome'], idProduto: doc.id);
        return produtoModel;
      }) // Assume que o campo do produto é 'nome'
          .toList();
    } catch (e) {
      Get.snackbar('Erro', 'Falha ao carregar produtos: $e',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Método para definir o produto selecionado
}
