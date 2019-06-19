// GENERATED CODE - DO NOT MODIFY BY HAND

part of supermarket_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SupermarketInitiated extends SupermarketInitiated {
  factory _$SupermarketInitiated(
          [void Function(SupermarketInitiatedBuilder) updates]) =>
      (new SupermarketInitiatedBuilder()..update(updates)).build();

  _$SupermarketInitiated._() : super._();

  @override
  SupermarketInitiated rebuild(
          void Function(SupermarketInitiatedBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketInitiatedBuilder toBuilder() =>
      new SupermarketInitiatedBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupermarketInitiated;
  }

  @override
  int get hashCode {
    return 635969481;
  }

  @override
  String toString() {
    return newBuiltValueToStringHelper('SupermarketInitiated').toString();
  }
}

class SupermarketInitiatedBuilder
    implements Builder<SupermarketInitiated, SupermarketInitiatedBuilder> {
  _$SupermarketInitiated _$v;

  SupermarketInitiatedBuilder();

  @override
  void replace(SupermarketInitiated other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SupermarketInitiated;
  }

  @override
  void update(void Function(SupermarketInitiatedBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupermarketInitiated build() {
    final _$result = _$v ?? new _$SupermarketInitiated._();
    replace(_$result);
    return _$result;
  }
}

class _$SupermarketInsert extends SupermarketInsert {
  @override
  final String name;
  @override
  final String brandID;

  factory _$SupermarketInsert(
          [void Function(SupermarketInsertBuilder) updates]) =>
      (new SupermarketInsertBuilder()..update(updates)).build();

  _$SupermarketInsert._({this.name, this.brandID}) : super._();

  @override
  SupermarketInsert rebuild(void Function(SupermarketInsertBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketInsertBuilder toBuilder() =>
      new SupermarketInsertBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupermarketInsert &&
        name == other.name &&
        brandID == other.brandID;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, name.hashCode), brandID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SupermarketInsert')
          ..add('name', name)
          ..add('brandID', brandID))
        .toString();
  }
}

class SupermarketInsertBuilder
    implements Builder<SupermarketInsert, SupermarketInsertBuilder> {
  _$SupermarketInsert _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _brandID;
  String get brandID => _$this._brandID;
  set brandID(String brandID) => _$this._brandID = brandID;

  SupermarketInsertBuilder();

  SupermarketInsertBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _brandID = _$v.brandID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupermarketInsert other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SupermarketInsert;
  }

  @override
  void update(void Function(SupermarketInsertBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupermarketInsert build() {
    final _$result =
        _$v ?? new _$SupermarketInsert._(name: name, brandID: brandID);
    replace(_$result);
    return _$result;
  }
}

class _$SupermarketDelete extends SupermarketDelete {
  @override
  final String documentID;

  factory _$SupermarketDelete(
          [void Function(SupermarketDeleteBuilder) updates]) =>
      (new SupermarketDeleteBuilder()..update(updates)).build();

  _$SupermarketDelete._({this.documentID}) : super._() {
    if (documentID == null) {
      throw new BuiltValueNullFieldError('SupermarketDelete', 'documentID');
    }
  }

  @override
  SupermarketDelete rebuild(void Function(SupermarketDeleteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketDeleteBuilder toBuilder() =>
      new SupermarketDeleteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupermarketDelete && documentID == other.documentID;
  }

  @override
  int get hashCode {
    return $jf($jc(0, documentID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SupermarketDelete')
          ..add('documentID', documentID))
        .toString();
  }
}

class SupermarketDeleteBuilder
    implements Builder<SupermarketDelete, SupermarketDeleteBuilder> {
  _$SupermarketDelete _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  SupermarketDeleteBuilder();

  SupermarketDeleteBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupermarketDelete other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SupermarketDelete;
  }

  @override
  void update(void Function(SupermarketDeleteBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupermarketDelete build() {
    final _$result = _$v ?? new _$SupermarketDelete._(documentID: documentID);
    replace(_$result);
    return _$result;
  }
}

class _$SupermarketEdit extends SupermarketEdit {
  @override
  final String documentID;
  @override
  final String name;
  @override
  final String brandID;

  factory _$SupermarketEdit([void Function(SupermarketEditBuilder) updates]) =>
      (new SupermarketEditBuilder()..update(updates)).build();

  _$SupermarketEdit._({this.documentID, this.name, this.brandID}) : super._();

  @override
  SupermarketEdit rebuild(void Function(SupermarketEditBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SupermarketEditBuilder toBuilder() =>
      new SupermarketEditBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SupermarketEdit &&
        documentID == other.documentID &&
        name == other.name &&
        brandID == other.brandID;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, documentID.hashCode), name.hashCode), brandID.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SupermarketEdit')
          ..add('documentID', documentID)
          ..add('name', name)
          ..add('brandID', brandID))
        .toString();
  }
}

class SupermarketEditBuilder
    implements Builder<SupermarketEdit, SupermarketEditBuilder> {
  _$SupermarketEdit _$v;

  String _documentID;
  String get documentID => _$this._documentID;
  set documentID(String documentID) => _$this._documentID = documentID;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _brandID;
  String get brandID => _$this._brandID;
  set brandID(String brandID) => _$this._brandID = brandID;

  SupermarketEditBuilder();

  SupermarketEditBuilder get _$this {
    if (_$v != null) {
      _documentID = _$v.documentID;
      _name = _$v.name;
      _brandID = _$v.brandID;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SupermarketEdit other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$SupermarketEdit;
  }

  @override
  void update(void Function(SupermarketEditBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SupermarketEdit build() {
    final _$result = _$v ??
        new _$SupermarketEdit._(
            documentID: documentID, name: name, brandID: brandID);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
