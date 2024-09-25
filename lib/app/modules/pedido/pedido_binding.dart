import 'package:get/get.dart';
import 'pedido_controller.dart';

class PedidoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PedidoController>(
        () => PedidoController()); // Injeta o HomeController
  }
}
