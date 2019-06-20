library supermarket_event;

import 'package:built_value/built_value.dart';

part 'supermarket_event.g.dart';

abstract class SupermarketEvent {}

abstract class SupermarketInitiated extends SupermarketEvent
    implements Built<SupermarketInitiated, SupermarketInitiatedBuilder> {
  // fields go here

  SupermarketInitiated._();

  factory SupermarketInitiated([updates(SupermarketInitiatedBuilder b)]) =
      _$SupermarketInitiated;
}

abstract class SupermarketInsert extends SupermarketEvent
    implements Built<SupermarketInsert, SupermarketInsertBuilder> {
  @nullable
  String get name;
  @nullable
  String get brandID;

  SupermarketInsert._();

  factory SupermarketInsert([updates(SupermarketInsertBuilder b)]) =
      _$SupermarketInsert;
}

abstract class SupermarketDelete extends SupermarketEvent
    implements Built<SupermarketDelete, SupermarketDeleteBuilder> {
  String get documentID;
  SupermarketDelete._();

  factory SupermarketDelete([updates(SupermarketDeleteBuilder b)]) =
      _$SupermarketDelete;
}

abstract class SupermarketEdit extends SupermarketEvent
    implements Built<SupermarketEdit, SupermarketEditBuilder> {
  @nullable
  String get documentID;
  @nullable
  String get name;
  @nullable
  String get brandID;
  SupermarketEdit._();

  factory SupermarketEdit([updates(SupermarketEditBuilder b)]) =
      _$SupermarketEdit;
}
