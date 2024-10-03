class ProdutoModel {
  String nome = '';
  String? idProduto = '';

  ProdutoModel({required this.nome, this.idProduto});

  factory ProdutoModel.fromMap(Map<String, dynamic> data) {
    return ProdutoModel(
        nome: data['nome'] ?? '', idProduto: data['id_produto'] ?? 0);
  }

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(nome: json['nome'], idProduto: json['id_produto']!!);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['id_produto'] = idProduto;
    return data;
  }
}
