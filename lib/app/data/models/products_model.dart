class ProductsModel {
  String nome = '';
  String descricao = '';

  ProductsModel({
    required this.nome,
    required this.descricao,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      nome: json['nome'],
      descricao: json['descricao'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['descricao'] = descricao;

    return data;
  }
}
