import 'dart:convert';

import 'package:app/app/data/models/pedido_model.dart';
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

  Future<DocumentReference<Object?>> create(PedidoModel pedidoModel) async {
    return collection().add(pedidoModel.toJson());
  }

  // TODO: Criar função que traga todos os estabelecimentos
  // Future<List<Map<String, dynamic>>> filterCompanies(String suggestion) => this
  //         .companies
  //         .where('nomeFantasia', isGreaterThanOrEqualTo: suggestion)
  //         .where('nomeFantasia', isLessThan: suggestion + 'z')
  //         .('nomeFantasia')
  //         .get()
  //         .then((e)=>e.docs.map((DocumentSnapshot a) => a.data() as CompanyModel).toList());
  //     });

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

  // TODO: Criar função que traga todos os estabelecimentos filtrados na pesquisa
  // TODO: Criar função que traga todos os estabelecimentos filtrados na pesquisa com limite de distancia
}
