// GENERATED CODE - DO NOT MODIFY BY HAND

part of supermarket_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SupermarketState extends SupermarketState {
  @override
  final bool isLoading;
  @override
  final BuiltList<Supermarket> supermarkets;
  @override
  final String error;
  @override
  final BuiltList<Brand> brands;

  factory _$SupermarketState(
          [void Function(SupermarketStateBuilder) updates]) =>
      (new SupermarketStateBuilder()..update(updates)).build();

  _$SupermarketState._(
      {this.isLoading, this.supermarkets, this.error, this.brands})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('SupermarketState', 'isLoading');
    }
    if (supermarkets == null) {
      throw new BuiltValueNullFieldError('SupermarketState', 'supermarkets');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('SupermarketState', 'error');
    }
    if (brands == null) {
      throw new BuiltValueNullFieldError('SupermarketState', 'brands');
    }
  }

  @override
  SupermarketState rebuild(void Function(SupermarketStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketStateBuilder toBuilder() =>
      new SupermarketStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupermarketState &&
        isLoading == other.isLoading &&
        supermarkets == other.supermarkets &&
        error == other.error &&
        brands == other.brands;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), supermarkets.hashCode),
            error.hashCode),
        brands.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SupermarketState')
          ..add('isLoading', isLoading)
          ..add('supermarkets', supermarkets)
          ..add('error', error)
          ..add('brands', brands))
        .toString();
  }
}

class SupermarketStateBuilder
    implements Builder<SupermarketState, SupermarketStateBuilder> {
  _$SupermarketState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  ListBuilder<Supermarket> _supermarkets;
  ListBuilder<Supermarket> get supermarkets =>
      _$this._supermarkets ??= new ListBuilder<Supermarket>();
  set supermarkets(ListBuilder<Supermarket> supermarkets) =>
      _$this._supermarkets = supermarkets;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  ListBuilder<Brand> _brands;
  ListBuilder<Brand> get brands => _$this._brands ??= new ListBuilder<Brand>();
  set brands(ListBuilder<Brand> brands) => _$this._brands = brands;

  SupermarketStateBuilder();

  SupermarketStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _supermarkets = _$v.supermarkets?.toBuilder();
      _error = _$v.error;
      _brands = _$v.brands?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupermarketState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SupermarketState;
  }

  @override
  void update(void Function(SupermarketStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupermarketState build() {
    _$SupermarketState _$result;
    try {
      _$result = _$v ??
          new _$SupermarketState._(
              isLoading: isLoading,
              supermarkets: supermarkets.build(),
              error: error,
              brands: brands.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'supermarkets';
        supermarkets.build();

        _$failedField = 'brands';
        brands.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SupermarketState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
