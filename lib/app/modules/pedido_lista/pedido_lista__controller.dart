import 'package:get/get.dart';

class PedidoListaController extends GetxController {
  // Exemplo de uma variável reativa
  var count = 0.obs;

  // Método para incrementar o contador
  void increment() {
    count++;
  }
}
