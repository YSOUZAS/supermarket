import 'package:cloud_firestore/cloud_firestore.dart';

class BrandDataSource {
  final Firestore db;

  BrandDataSource(this.db);

  CollectionReference get database => db.collection("brands");

  Future<QuerySnapshot> getBrands() async {
    return await database.getDocuments();
  }

  insertBrand(String name) async {
    await database.add({"name": name});
  }
}
