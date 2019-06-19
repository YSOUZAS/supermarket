library supermarket;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/models/supermarket/index.dart';
import 'package:supermarket/data/serializers/index.dart';

part 'supermarket.g.dart';

abstract class Supermarket implements Built<Supermarket, SupermarketBuilder> {
  String get documentID;
  DataSupermarket get data;

  @nullable
  Brand get brand;

  Supermarket._();

  factory Supermarket([updates(SupermarketBuilder b)]) = _$Supermarket;

  String toJson() {
    return json.encode(serializers.serializeWith(Supermarket.serializer, this));
  }

  static Supermarket fromJson(String jsonString) {
    return serializers.deserializeWith(
        Supermarket.serializer, json.decode(jsonString));
  }

  static Serializer<Supermarket> get serializer => _$supermarketSerializer;
}
