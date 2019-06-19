// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_supermarket;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DataSupermarket> _$dataSupermarketSerializer =
    new _$DataSupermarketSerializer();

class _$DataSupermarketSerializer
    implements StructuredSerializer<DataSupermarket> {
  @override
  final Iterable<Type> types = const [DataSupermarket, _$DataSupermarket];
  @override
  final String wireName = 'DataSupermarket';

  @override
  Iterable serialize(Serializers serializers, DataSupermarket object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  DataSupermarket deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DataSupermarketBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$DataSupermarket extends DataSupermarket {
  @override
  final String name;

  factory _$DataSupermarket([void Function(DataSupermarketBuilder) updates]) =>
      (new DataSupermarketBuilder()..update(updates)).build();

  _$DataSupermarket._({this.name}) : super._() {
    if (name == null) {
      throw new BuiltValueNullFieldError('DataSupermarket', 'name');
    }
  }

  @override
  DataSupermarket rebuild(void Function(DataSupermarketBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DataSupermarketBuilder toBuilder() =>
      new DataSupermarketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DataSupermarket && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DataSupermarket')..add('name', name))
        .toString();
  }
}

class DataSupermarketBuilder
    implements Builder<DataSupermarket, DataSupermarketBuilder> {
  _$DataSupermarket _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  DataSupermarketBuilder();

  DataSupermarketBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DataSupermarket other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$DataSupermarket;
  }

  @override
  void update(void Function(DataSupermarketBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DataSupermarket build() {
    final _$result = _$v ?? new _$DataSupermarket._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
