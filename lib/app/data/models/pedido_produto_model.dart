class PedidoProdutoModel {
  String idProduto;
  num? quantidade;

  PedidoProdutoModel({required this.idProduto, this.quantidade});

  factory PedidoProdutoModel.fromMap(Map<String, dynamic> data) {
    return PedidoProdutoModel(
        idProduto: data['id_produto'] ?? '',
        quantidade: data['quantidade'] ?? 0);
  }

  factory PedidoProdutoModel.fromJson(Map<String, dynamic> json) {
    return PedidoProdutoModel(
        idProduto: json['id_produto'], quantidade: json['quantidade']!!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id_produto'] = idProduto;
    data['quantidade'] = quantidade;
    return data;
  }
}
