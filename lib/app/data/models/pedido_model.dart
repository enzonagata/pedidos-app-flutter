class PedidoModel {
  String nome = '';
  String endereco = '';
  String? telefone = '';

  PedidoModel({required this.nome, required this.endereco, this.telefone});

  factory PedidoModel.fromJson(Map<String, dynamic> json) {
    return PedidoModel(
        nome: json['nome'],
        endereco: json['endereco'],
        telefone: json['telefone'] ?? "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['endereco'] = endereco;
    data['telefone'] = telefone;
    return data;
  }
}
