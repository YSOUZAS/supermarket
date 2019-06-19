library data_supermarket;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:supermarket/data/serializers/index.dart';

part 'data_supermarket.g.dart';

abstract class DataSupermarket
    implements Built<DataSupermarket, DataSupermarketBuilder> {
  String get name;
  String get brandID;

  DataSupermarket._();

  factory DataSupermarket([updates(DataSupermarketBuilder b)]) =
      _$DataSupermarket;

  String toJson() {
    return json
        .encode(serializers.serializeWith(DataSupermarket.serializer, this));
  }

  static DataSupermarket fromJson(String jsonString) {
    return serializers.deserializeWith(
        DataSupermarket.serializer, json.decode(jsonString));
  }

  static Serializer<DataSupermarket> get serializer =>
      _$dataSupermarketSerializer;
}
