class ProdutoVariacoesModel {
  String idProduto = '';
  String variacao = '';

  ProdutoVariacoesModel({required this.idProduto, required this.variacao});

  factory ProdutoVariacoesModel.fromJson(Map<String, dynamic> json) {
    return ProdutoVariacoesModel(
      idProduto: json['idProduto'],
      variacao: json['nome'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idPRoduto'] = idProduto;
    data['nome'] = variacao;
    return data;
  }
}
