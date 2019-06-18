import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:supermarket/data/blocs/brand/index.dart';
import 'package:supermarket/data/repository/firebase/index.dart';

class BrandBloc extends Bloc<BrandEvent, BrandState> {
  final BrandRepository _repository;

  BrandBloc(this._repository) : super();

  @override
  BrandState get initialState => BrandState.initial();

  void onBrandInitiated() {
    dispatch(BrandInitiated());
  }

  void onInsertBrand(String name) {
    dispatch(BrandInsert((b) => b..name = name));
  }

  @override
  Stream<BrandState> mapEventToState(BrandEvent event) async* {
    if (event is BrandInitiated) yield* mapBrandInitiated(event);
    if (event is BrandInsert) yield* mapBrandInsert(event);
  }

  Stream<BrandState> mapBrandInitiated(BrandInitiated event) async* {
    yield BrandState.loading();

    try {
      final searchResult = await _repository.getBrands();
      yield BrandState.success(searchResult);
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }

  Stream<BrandState> mapBrandInsert(BrandInsert event) async* {
    yield BrandState.loading();

    try {
      await _repository.insertBrand(event.name);
      onBrandInitiated();
    } on Exception catch (e) {
      yield BrandState.failure(e.toString());
    }
  }
}
