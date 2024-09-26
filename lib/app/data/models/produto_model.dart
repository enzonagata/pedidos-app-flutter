class ProdutoModel {
  String nome = '';

  ProdutoModel({
    required this.nome
  });

  factory ProdutoModel.fromJson(Map<String, dynamic> json) {
    return ProdutoModel(
      nome: json['nome'],
      
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    return data;
  }
}
