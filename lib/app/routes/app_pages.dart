import 'package:app/app/modules/pedido/pedido_binding.dart';
import 'package:app/app/modules/pedido/pedido_controller.dart';
import 'package:app/app/modules/pedido/pedido_page.dart';
import 'package:app/app/modules/pedido_item/pedido_itens_binding.dart';
import 'package:app/app/modules/pedido_item/pedido_itens_page.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_binding.dart';
import 'package:app/app/modules/pedido_lista/pedido_lista_page.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.PEDIDO,
      page: () => const PedidoPage(),
      binding: PedidoBinding(),
    ),
    GetPage(
        name: AppRoutes.PEDIDO_LISTA,
        page: () => const PedidoListaPage(),
        bindings: [
          PedidoBinding(),
          PedidoListaBinding(),
          PedidoItensBinding()
        ]),
    GetPage(
      name: AppRoutes.PEDIDO_ITENS,
      page: () => const PedidoItensPage(),
      binding: PedidoItensBinding(),
    ),
  ];
}
