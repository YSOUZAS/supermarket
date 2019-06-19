// GENERATED CODE - DO NOT MODIFY BY HAND

part of supermarket;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Supermarket> _$supermarketSerializer = new _$SupermarketSerializer();

class _$SupermarketSerializer implements StructuredSerializer<Supermarket> {
  @override
  final Iterable<Type> types = const [Supermarket, _$Supermarket];
  @override
  final String wireName = 'Supermarket';

  @override
  Iterable serialize(Serializers serializers, Supermarket object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[
      'documentID',
      serializers.serialize(object.documentID,
          specifiedType: const FullType(String)),
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
    ];
    if (object.brand != null) {
      result
        ..add('brand')
        ..add(serializers.serialize(object.brand,
            specifiedType: const FullType(Brand)));
    }
    return result;
  }

  @override
  Supermarket deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SupermarketBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'documentID':
          result.documentID = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'brand':
          result.brand.replace(serializers.deserialize(value,
              specifiedType: const FullType(Brand)) as Brand);
          break;
      }
    }

    return result.build();
  }
}

class _$Supermarket extends Supermarket {
  @override
  final String documentID;
  @override
  final String name;
  @override
  final Brand brand;

  factory _$Supermarket([void Function(SupermarketBuilder) updates]) =>
      (new SupermarketBuilder()..update(updates)).build();

  _$Supermarket._({this.documentID, this.name, this.brand}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('Supermarket', 'documentID');
    }
    if (name == null) {
      throw new BuiltValueNullFieldError('Supermarket', 'name');
    }
  }

  @override
  Supermarket rebuild(void Function(SupermarketBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketBuilder toBuilder() => new SupermarketBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Supermarket &&
        documentID == other.documentID &&
        name == other.name &&
        brand == other.brand;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, documentID.hashCode), name.hashCode), brand.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Supermarket')
          ..add('documentID', documentID)
          ..add('name', name)
          ..add('brand', brand))
        .toString();
  }
}

class SupermarketBuilder implements Builder<Supermarket, SupermarketBuilder> {
  _$Supermarket _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  BrandBuilder _brand;
  BrandBuilder get brand => _$this._brand ??= new BrandBuilder();
  set brand(BrandBuilder brand) => _$this._brand = brand;

  SupermarketBuilder();

  SupermarketBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _name = _$v.name;
      _brand = _$v.brand?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Supermarket other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Supermarket;
  }

  @override
  void update(void Function(SupermarketBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Supermarket build() {
    _$Supermarket _$result;
    try {
      _$result = _$v ??
          new _$Supermarket._(
              documentID: documentID, name: name, brand: _brand?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'brand';
        _brand?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Supermarket', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
