import 'dart:convert';

import 'package:app/app/data/models/pedido_model.dart';
import 'package:app/app/data/models/pedido_produto_model.dart';
import 'package:app/app/data/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PedidosRepository {
  CollectionReference collection() {
    return FirebaseFirestore.instance.collection('pedidos');
  }

  Future<QuerySnapshot<Object?>> getAll() {
    return collection().get();
  }

  Stream<QuerySnapshot> streamGetAll() {
    return collection().snapshots(includeMetadataChanges: true);
  }

  Stream<DocumentSnapshot> streamGetFromId(id) {
    return collection().doc(id).snapshots(includeMetadataChanges: true);
  }

  Future<DocumentReference<Object?>> add(PedidoModel pedidoModel) async {
    return collection().add(pedidoModel.toJson());
  }

  Future<void> delete(id) async {
    return collection().doc(id).delete();
  }

  Future<void> update(String id, PedidoModel pedidoModel) async {
    return collection().doc(id).update(pedidoModel.toJson());
  }

  Future<void> adicionarItem(PedidoProdutoModel item, id) async {
    print(item.toJson());
    return collection().doc(id).update({
      'itens': FieldValue.arrayUnion([item.toJson()])
    });
  }

  Future<List<ProdutoModel>> filterCompanies(String suggestion) async {
    List<ProdutoModel> list = [];
    if (suggestion != '') {
      var snapshot = await collection().get();
      list = snapshot.docs.map((e) {
        var a = jsonEncode(e.data());
        return ProdutoModel.fromJson(jsonDecode(a));
      }).toList();
    }

    return list;
  }
}
