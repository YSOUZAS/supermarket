library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:supermarket/data/models/brand/index.dart';
import 'package:supermarket/data/models/supermarket/index.dart';

part 'serializers.g.dart';

@SerializersFor(const [Brand, DataBrand, Supermarket, DataSupermarket])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
