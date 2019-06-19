import 'package:kiwi/kiwi.dart' as kiwi;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supermarket/data/blocs/brand/index.dart';
import 'package:supermarket/data/blocs/supermarket/index.dart';
import 'package:supermarket/data/network/firebase/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';
import 'package:supermarket/data/services/index.dart';

void initiKiwi() {
  kiwi.Container()
    ..registerInstance(Firestore.instance)
    ..registerFactory((c) => BrandDataSource(c.resolve()))
    ..registerFactory((c) => SupermarketDataSource(c.resolve()))
    ..registerFactory((c) => BrandRepository(c.resolve()))
    ..registerFactory((c) => SupermarketRepository(c.resolve()))
    ..registerFactory((c) => SupermarketService(c.resolve(), c.resolve()))
    ..registerFactory((c) => SupermarketBloc(c.resolve(), c.resolve()))
    ..registerFactory((c) => BrandBloc(c.resolve()));

  kiwi.Container().silent = true;
}
