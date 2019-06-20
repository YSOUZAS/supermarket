import 'package:built_collection/built_collection.dart';
import 'package:supermarket/data/models/brand/brand.dart';
import 'package:supermarket/data/models/supermarket/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';

class SupermarketService {
  final SupermarketRepository _supermarketRepository;
  final BrandRepository _brandRepository;

  SupermarketService(this._supermarketRepository, this._brandRepository);

  Future<Supermarket> getFullSupermarket(String documentID) async {
    var supermarket =
        await _supermarketRepository.getSupermarketByID(documentID);
    var brand = await getBrandByID(supermarket.data.brandID);

    supermarket = supermarket.rebuild((b) => b.brand = brand.toBuilder());

    return supermarket;
  }

  Future<Brand> getBrandByID(brandID) async =>
      await _brandRepository.getBrandByID(brandID);

  Future<BuiltList<Supermarket>> getAllFullSupermarkets() async {
    var supermarketsToRefactor = await _supermarketRepository.getSupermarkets();
    var supermarkets = new BuiltList<Supermarket>();

    for (Supermarket supermarket in supermarketsToRefactor) {
      var brand = await getBrandByID(supermarket.data.brandID);
      supermarket = supermarket.rebuild((b) => b.brand = brand.toBuilder());
      supermarkets = (supermarkets.toBuilder()..add(supermarket)).build();
    }

    return supermarkets;
  }
}
