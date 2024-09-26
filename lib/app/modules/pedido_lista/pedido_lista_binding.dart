import 'package:get/get.dart';
import 'pedido_lista_controller.dart';

class PedidoListaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PedidoListaController>(
        () => PedidoListaController()); // Injeta o HomeController
  }
}
