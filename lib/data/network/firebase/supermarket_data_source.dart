import 'package:cloud_firestore/cloud_firestore.dart';

class SupermarketDataSource {
  final Firestore db;

  SupermarketDataSource(this.db);

  CollectionReference get database => db.collection("supermarkets");

  Future<QuerySnapshot> getSupermarkets() async =>
      await database.getDocuments();

  insertSupermarket(String name, String brandID) async =>
      await database.add({"name": name, "brandID": brandID});

  deleteSupermarket(String documentID) async =>
      await database.document(documentID).delete();

  editSupermarket(String documentID, String name, String brandID) async =>
      await database
          .document(documentID)
          .updateData({"name": name, "brandID": brandID});

  Future<DocumentSnapshot> getSupermarketByID(String documentID) async =>
      await database.document(documentID).get();
}
