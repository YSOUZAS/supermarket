library supermarket_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/models/supermarket/index.dart';

part 'supermarket_state.g.dart';

abstract class SupermarketState
    implements Built<SupermarketState, SupermarketStateBuilder> {
  bool get isLoading;
  BuiltList<Supermarket> get supermarkets;
  String get error;
  BuiltList<Brand> get brands;

  bool get isInitial =>
      !isLoading && supermarkets.isEmpty && brands.isEmpty && error == '';
  bool get isSuccessful =>
      !isLoading && supermarkets.isNotEmpty && brands.isNotEmpty && error == '';

  SupermarketState._();

  factory SupermarketState([updates(SupermarketStateBuilder b)]) =
      _$SupermarketState;

  factory SupermarketState.initial() {
    return SupermarketState((b) => b
      ..isLoading = true
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }
  factory SupermarketState.loading() {
    return SupermarketState((b) => b
      ..isLoading = true
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }

  factory SupermarketState.failure(String error) {
    return SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..brands.replace(BuiltList<Brand>())
      ..error = '');
  }

  factory SupermarketState.success(
      BuiltList<Supermarket> resultList, BuiltList<Brand> resultBrands) {
    var asd = SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(resultList)
      ..brands.replace(resultBrands)
      ..error = '');

    return asd;
  }
  factory SupermarketState.inserted(
      BuiltList<Supermarket> resultList, BuiltList<Brand> resultBrands) {
    return SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(resultList)
      ..brands.replace(resultBrands)
      ..error = '');
  }
}
