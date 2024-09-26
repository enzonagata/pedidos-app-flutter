import 'package:get/get.dart';
import 'pedido_itens_controller.dart';

class PedidoItensBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PedidoItensController>(() => PedidoItensController());
  }
}
