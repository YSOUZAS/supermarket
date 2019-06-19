import 'package:supermarket/data/models/supermarket/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';

class SupermarketServices {
  final SupermarketRepository _supermarketRepository;
  final BrandRepository _brandRepository;

  SupermarketServices(this._supermarketRepository, this._brandRepository);

  Future<Supermarket> getFullSupermarket(String documentID) async {
    var supermarket =
        await _supermarketRepository.getSupermarketByID(documentID);
    supermarket.brand =
        await _brandRepository.getBrandByID(supermarket.data.brandID);

    return supermarket;
  }
}
