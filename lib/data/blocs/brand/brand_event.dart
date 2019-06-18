library brand_event;

import 'package:built_value/built_value.dart';

part 'brand_event.g.dart';

abstract class BrandEvent {}

abstract class BrandInitiated extends BrandEvent
    implements Built<BrandInitiated, BrandInitiatedBuilder> {
  BrandInitiated._();

  factory BrandInitiated([updates(BrandInitiatedBuilder b)]) = _$BrandInitiated;
}

abstract class BrandInsert extends BrandEvent
    implements Built<BrandInsert, BrandInsertBuilder> {
  @nullable
  String get name;

  BrandInsert._();

  factory BrandInsert([updates(BrandInsertBuilder b)]) = _$BrandInsert;
}
