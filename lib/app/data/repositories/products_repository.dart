import 'dart:convert';

import 'package:app/app/data/models/products_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsRepository {
  late CollectionReference products;

  ProductsRepository() {
    products = FirebaseFirestore.instance.collection('products');
  }

  Stream<QuerySnapshot> getAllProducts() {
    return products.snapshots(includeMetadataChanges: true);
  }

  Stream<QuerySnapshot> getPhysicalCompanies() {
    return products
        .where('isOnline', isEqualTo: false)
        .snapshots(includeMetadataChanges: true);
  }

  Future<void> createProduct() async {
    var a = [
      {
        "nome": "Celular",
        "descricao": "Galaxy Z Flip 6",
      },
    ];

    for (var item in a) {
      products.add(item);
    }
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

  Future<List<ProductsModel>> filterCompanies(String suggestion) async {
    List<ProductsModel> list = [];
    if (suggestion != '') {
      var snapshot = await products.get();
      list = snapshot.docs.map((e) {
        var a = jsonEncode(e.data());
        return ProductsModel.fromJson(jsonDecode(a));
      }).toList();
    }

    return list;
  }

  // TODO: Criar função que traga todos os estabelecimentos filtrados na pesquisa
  // TODO: Criar função que traga todos os estabelecimentos filtrados na pesquisa com limite de distancia
}
