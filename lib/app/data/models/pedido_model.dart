import 'package:app/app/data/models/pedido_produto_model.dart';

class PedidoModel {
  String nome = '';
  String endereco = '';
  String? telefone = '';
  List<PedidoProdutoModel>? pedidoProdutoModel = [];

  PedidoModel(
      {required this.nome,
      required this.endereco,
      this.telefone,
      this.pedidoProdutoModel});

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    List<dynamic> jsonArray = json['itens'] ?? [];
    List<PedidoProdutoModel> jsonPedidoModel =
        jsonArray.map((json) => PedidoProdutoModel.fromJson(json)).toList();
    return PedidoModel(
        nome: json['nome'],
        endereco: json['endereco'],
        telefone: json['telefone'] ?? "",
        pedidoProdutoModel: jsonPedidoModel);
  }

  List<PedidoProdutoModel> parseDadosModelList(List<dynamic> jsonArray) {
    return jsonArray.map((json) => PedidoProdutoModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    return data;
  }
}
