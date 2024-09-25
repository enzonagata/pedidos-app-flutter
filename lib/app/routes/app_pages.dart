import 'package:app/app/modules/pedido/pedido_binding.dart';
import 'package:app/app/modules/pedido/pedido_page.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_binding.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.PEDIDO,
      page: () => const PedidoPage(), // Página inicial
      binding: PedidoBinding(), // Injetando o binding
    ),
    GetPage(
      name: AppRoutes.LISTA_PEDIDO,
      page: () => const PedidoListaPage(), // Página inicial
      binding: PedidoListaBinding(), // Injetando o binding
    ),
  ];
}
