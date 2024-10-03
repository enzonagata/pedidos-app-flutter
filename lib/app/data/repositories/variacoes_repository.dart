import 'dart:convert';

import 'package:app/app/data/models/produto_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VariacoesRepository {
  CollectionReference collection() {
    return FirebaseFirestore.instance.collection('variacoes');
  }

  Future<QuerySnapshot<Object?>> getAll() {
    return collection().get();
  }

  Stream<QuerySnapshot> getAllProducts() {
    return collection().snapshots(includeMetadataChanges: true);
  }

  Stream<QuerySnapshot> getPhysicalCompanies() {
    return collection()
        .where('isOnline', isEqualTo: false)
        .snapshots(includeMetadataChanges: true);
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
