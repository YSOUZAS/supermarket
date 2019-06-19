library supermarket_state;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:supermarket/data/models/supermarket/index.dart';

part 'supermarket_state.g.dart';

abstract class SupermarketState
    implements Built<SupermarketState, SupermarketStateBuilder> {
  bool get isLoading;
  BuiltList<Supermarket> get supermarkets;
  String get error;

  bool get isInitial => !isLoading && supermarkets.isEmpty && error == '';
  bool get isSuccessful => !isLoading && supermarkets.isNotEmpty && error == '';

  SupermarketState._();

  factory SupermarketState([updates(SupermarketStateBuilder b)]) =
      _$SupermarketState;

  factory SupermarketState.initial() {
    return SupermarketState((b) => b
      ..isLoading = true
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..error = '');
  }
  factory SupermarketState.loading() {
    return SupermarketState((b) => b
      ..isLoading = true
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..error = '');
  }

  factory SupermarketState.failure(String error) {
    return SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(BuiltList<Supermarket>())
      ..error = '');
  }

  factory SupermarketState.success(BuiltList<Supermarket> resultList) {
    return SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(resultList)
      ..error = '');
  }
  factory SupermarketState.inserted(BuiltList<Supermarket> resultList) {
    return SupermarketState((b) => b
      ..isLoading = false
      ..supermarkets.replace(resultList)
      ..error = '');
  }
}
