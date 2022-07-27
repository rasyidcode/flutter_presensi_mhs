// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String error;
  @override
  final bool isLoading;
  @override
  final BuiltList<PerkuliahanItem?> matkulData;
  @override
  final int? matkulTotal;
  @override
  final bool? isTokenExpired;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {required this.error,
      required this.isLoading,
      required this.matkulData,
      this.matkulTotal,
      this.isTokenExpired})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(
        matkulData, 'HomeState', 'matkulData');
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        error == other.error &&
        isLoading == other.isLoading &&
        matkulData == other.matkulData &&
        matkulTotal == other.matkulTotal &&
        isTokenExpired == other.isTokenExpired;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                matkulData.hashCode),
            matkulTotal.hashCode),
        isTokenExpired.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('matkulData', matkulData)
          ..add('matkulTotal', matkulTotal)
          ..add('isTokenExpired', isTokenExpired))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  ListBuilder<PerkuliahanItem?>? _matkulData;
  ListBuilder<PerkuliahanItem?> get matkulData =>
      _$this._matkulData ??= new ListBuilder<PerkuliahanItem?>();
  set matkulData(ListBuilder<PerkuliahanItem?>? matkulData) =>
      _$this._matkulData = matkulData;

  int? _matkulTotal;
  int? get matkulTotal => _$this._matkulTotal;
  set matkulTotal(int? matkulTotal) => _$this._matkulTotal = matkulTotal;

  bool? _isTokenExpired;
  bool? get isTokenExpired => _$this._isTokenExpired;
  set isTokenExpired(bool? isTokenExpired) =>
      _$this._isTokenExpired = isTokenExpired;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _matkulData = $v.matkulData.toBuilder();
      _matkulTotal = $v.matkulTotal;
      _isTokenExpired = $v.isTokenExpired;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    _$HomeState _$result;
    try {
      _$result = _$v ??
          new _$HomeState._(
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'HomeState', 'error'),
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'HomeState', 'isLoading'),
              matkulData: matkulData.build(),
              matkulTotal: matkulTotal,
              isTokenExpired: isTokenExpired);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'matkulData';
        matkulData.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HomeState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
