import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:supermarket/data/blocs/supermarket/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';
import 'package:supermarket/data/services/index.dart';

class SupermarketBloc extends Bloc<SupermarketEvent, SupermarketState> {
  final SupermarketRepository _repository;
  final BrandRepository _brandRepository;

  final SupermarketService _service;

  SupermarketBloc(this._repository, this._service, this._brandRepository)
      : super();

  @override
  SupermarketState get initialState => SupermarketState.initial();

  void onSupermarketInitiated() => dispatch(SupermarketInitiated());

  void onInsertSupermarket(String name, String brandID) =>
      dispatch(SupermarketInsert((b) => b
        ..name = name
        ..brandID = brandID));

  void onDeleteSupermarket(String documentID) =>
      dispatch(SupermarketDelete((b) => b..documentID = documentID));

  void onEditSupermarket(String documentID, String name) =>
      dispatch(SupermarketEdit((b) => b
        ..documentID = documentID
        ..name = name));

  @override
  Stream<SupermarketState> mapEventToState(SupermarketEvent event) async* {
    if (event is SupermarketInitiated) yield* mapSupermarketInitiated(event);
    if (event is SupermarketInsert) yield* mapSupermarketInsert(event);
    if (event is SupermarketDelete)
      yield* mapSupermarketSupermarketDelete(event);
    if (event is SupermarketEdit) yield* mapSupermarketSupermarketEdit(event);
  }

  Stream<SupermarketState> mapSupermarketInitiated(
      SupermarketInitiated event) async* {
    yield SupermarketState.loading();

    try {
      final supermarkets = await _service.getAllFullSupermarkets();
      final brands = await _brandRepository.getBrands();
      yield SupermarketState.success(supermarkets, brands);
    } on Exception catch (e) {
      yield SupermarketState.failure(e.toString());
    }
  }

  Stream<SupermarketState> mapSupermarketInsert(
      SupermarketInsert event) async* {}

  Stream<SupermarketState> mapSupermarketSupermarketEdit(
      SupermarketEdit event) async* {}

  Stream<SupermarketState> mapSupermarketSupermarketDelete(
      SupermarketDelete event) async* {}
}
