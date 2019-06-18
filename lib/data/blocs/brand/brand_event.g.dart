// GENERATED CODE - DO NOT MODIFY BY HAND

part of brand_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$BrandInitiated extends BrandInitiated {
  factory _$BrandInitiated([void Function(BrandInitiatedBuilder) updates]) =>
      (new BrandInitiatedBuilder()..update(updates)).build();

  _$BrandInitiated._() : super._();

  @override
  BrandInitiated rebuild(void Function(BrandInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandInitiatedBuilder toBuilder() =>
      new BrandInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandInitiated;
  }

  @override
  int get hashCode {
    return 856928594;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('BrandInitiated').toString();
  }
}

class BrandInitiatedBuilder
    implements Builder<BrandInitiated, BrandInitiatedBuilder> {
  _$BrandInitiated _$v;

  BrandInitiatedBuilder();

  @override
  void replace(BrandInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandInitiated;
  }

  @override
  void update(void Function(BrandInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandInitiated build() {
    final _$result = _$v ?? new _$BrandInitiated._();
    replace(_$result);
    return _$result;
  }
}

class _$BrandInsert extends BrandInsert {
  @override
  final String name;

  factory _$BrandInsert([void Function(BrandInsertBuilder) updates]) =>
      (new BrandInsertBuilder()..update(updates)).build();

  _$BrandInsert._({this.name}) : super._();

  @override
  BrandInsert rebuild(void Function(BrandInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BrandInsertBuilder toBuilder() => new BrandInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BrandInsert && name == other.name;
  }

  @override
  int get hashCode {
    return $jf($jc(0, name.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BrandInsert')..add('name', name))
        .toString();
  }
}

class BrandInsertBuilder implements Builder<BrandInsert, BrandInsertBuilder> {
  _$BrandInsert _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  BrandInsertBuilder();

  BrandInsertBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BrandInsert other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BrandInsert;
  }

  @override
  void update(void Function(BrandInsertBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BrandInsert build() {
    final _$result = _$v ?? new _$BrandInsert._(name: name);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
