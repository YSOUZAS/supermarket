import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/models/supermarket/index.dart';
import 'package:supermarket/data/network/firebase/index.dart';

import 'package:supermarket/data/repository/firebase/helpers/index.dart';

class SupermarketRepository {
  final SupermarketDataSource _supermarketDataSource;

  SupermarketRepository(this._supermarketDataSource);

  Future<BuiltList<Supermarket>> getSupermarkets() async {
    final result = await _supermarketDataSource.getSupermarkets();
    BuiltList<Supermarket> brands = new BuiltList<Supermarket>();
    if (result.documents.isNotEmpty) {
      for (DocumentSnapshot document in result.documents) {
        var mapSupermarket = SupermarketConverter.toMap(document);
        var brand = Supermarket.fromJson(mapSupermarket);
        brands = (brands.toBuilder()..add(brand)).build();
      }
    }
    return brands;
  }

  Future<Supermarket> getSupermarketByID(String documentID) async {
    final document =
        await _supermarketDataSource.getSupermarketByID(documentID);
    var mapSupermarket = SupermarketConverter.toMap(document);
    var supermarket = Supermarket.fromJson(mapSupermarket);
    return supermarket;
  }

  Future<void> insertSupermarket({String name, String brandId}) async =>
      await _supermarketDataSource.insertSupermarket(name, brandId);

  Future<void> deleteSupermarket({String documentID}) async =>
      await _supermarketDataSource.deleteSupermarket(documentID);

  Future<void> editSupermarket(
          {String documentID, String name, String brandId}) async =>
      await _supermarketDataSource.editSupermarket(documentID, name, brandId);
}
