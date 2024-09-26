class PedidoModel {
  String nome = '';
  String endereco = '';

  PedidoModel({required this.nome, required this.endereco});

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(nome: json['nome'], endereco: json['endereco']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['endereco'] = endereco;
    return data;
  }
}
