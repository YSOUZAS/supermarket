import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/network/firebase/index.dart';
import 'dart:convert';

class BrandRepository {
  final BrandDataSource _brandDataSource;

  BrandRepository(this._brandDataSource);

  Future<BuiltList<Brand>> getBrands() async {
    final result = await _brandDataSource.getBrands();
    BuiltList<Brand> brands = new BuiltList<Brand>();
    if (result.documents.isNotEmpty) {
      for (DocumentSnapshot document in result.documents) {
        Map<String, dynamic> brandMap = {
          "documentID": document.documentID,
          "data": document.data
        };
        var dataJson = json.encode(brandMap);
        var brand = Brand.fromJson(dataJson);
        brands = (brands.toBuilder()..add(brand)).build();
      }
      return brands;
    } else {
      return brands;
    }
  }

  Future<void> insertBrand(String name) async {
    await _brandDataSource.insertBrand(name);
  }

  Future<void> deleteBrand(String documentID) async {
    await _brandDataSource.deleteBrand(documentID);
  }

  Future<void> editBrand(String documentID, String name) async {
    await _brandDataSource.editBrand(documentID, name);
  }
}
