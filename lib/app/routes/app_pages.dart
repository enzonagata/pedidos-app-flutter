import 'package:app/app/modules/pedido/pedido_binding.dart';
import 'package:app/app/modules/pedido/pedido_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.PEDIDO,
      page: () => PedidoPage(), // Página inicial
      binding: PedidoBinding(), // Injetando o binding
    ),
  ];
}
