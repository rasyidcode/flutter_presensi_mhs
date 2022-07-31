// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final String error;
  @override
  final bool? isLoading;
  @override
  final bool? isPresensiLoading;
  @override
  final bool? isPresensiSuccess;
  @override
  final BuiltList<PerkuliahanItem?> matkulData;
  @override
  final PresensiResult? presensiResult;
  @override
  final int? matkulTotal;
  @override
  final bool? isTokenExpired;
  @override
  final String? currentState;
  @override
  final String? currentCode;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {required this.error,
      this.isLoading,
      this.isPresensiLoading,
      this.isPresensiSuccess,
      required this.matkulData,
      this.presensiResult,
      this.matkulTotal,
      this.isTokenExpired,
      this.currentState,
      this.currentCode})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'HomeState', 'error');
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
        isPresensiLoading == other.isPresensiLoading &&
        isPresensiSuccess == other.isPresensiSuccess &&
        matkulData == other.matkulData &&
        presensiResult == other.presensiResult &&
        matkulTotal == other.matkulTotal &&
        isTokenExpired == other.isTokenExpired &&
        currentState == other.currentState &&
        currentCode == other.currentCode;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc(0, error.hashCode),
                                        isLoading.hashCode),
                                    isPresensiLoading.hashCode),
                                isPresensiSuccess.hashCode),
                            matkulData.hashCode),
                        presensiResult.hashCode),
                    matkulTotal.hashCode),
                isTokenExpired.hashCode),
            currentState.hashCode),
        currentCode.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('isPresensiLoading', isPresensiLoading)
          ..add('isPresensiSuccess', isPresensiSuccess)
          ..add('matkulData', matkulData)
          ..add('presensiResult', presensiResult)
          ..add('matkulTotal', matkulTotal)
          ..add('isTokenExpired', isTokenExpired)
          ..add('currentState', currentState)
          ..add('currentCode', currentCode))
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

  bool? _isPresensiLoading;
  bool? get isPresensiLoading => _$this._isPresensiLoading;
  set isPresensiLoading(bool? isPresensiLoading) =>
      _$this._isPresensiLoading = isPresensiLoading;

  bool? _isPresensiSuccess;
  bool? get isPresensiSuccess => _$this._isPresensiSuccess;
  set isPresensiSuccess(bool? isPresensiSuccess) =>
      _$this._isPresensiSuccess = isPresensiSuccess;

  ListBuilder<PerkuliahanItem?>? _matkulData;
  ListBuilder<PerkuliahanItem?> get matkulData =>
      _$this._matkulData ??= new ListBuilder<PerkuliahanItem?>();
  set matkulData(ListBuilder<PerkuliahanItem?>? matkulData) =>
      _$this._matkulData = matkulData;

  PresensiResultBuilder? _presensiResult;
  PresensiResultBuilder get presensiResult =>
      _$this._presensiResult ??= new PresensiResultBuilder();
  set presensiResult(PresensiResultBuilder? presensiResult) =>
      _$this._presensiResult = presensiResult;

  int? _matkulTotal;
  int? get matkulTotal => _$this._matkulTotal;
  set matkulTotal(int? matkulTotal) => _$this._matkulTotal = matkulTotal;

  bool? _isTokenExpired;
  bool? get isTokenExpired => _$this._isTokenExpired;
  set isTokenExpired(bool? isTokenExpired) =>
      _$this._isTokenExpired = isTokenExpired;

  String? _currentState;
  String? get currentState => _$this._currentState;
  set currentState(String? currentState) => _$this._currentState = currentState;

  String? _currentCode;
  String? get currentCode => _$this._currentCode;
  set currentCode(String? currentCode) => _$this._currentCode = currentCode;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _isPresensiLoading = $v.isPresensiLoading;
      _isPresensiSuccess = $v.isPresensiSuccess;
      _matkulData = $v.matkulData.toBuilder();
      _presensiResult = $v.presensiResult?.toBuilder();
      _matkulTotal = $v.matkulTotal;
      _isTokenExpired = $v.isTokenExpired;
      _currentState = $v.currentState;
      _currentCode = $v.currentCode;
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
              isLoading: isLoading,
              isPresensiLoading: isPresensiLoading,
              isPresensiSuccess: isPresensiSuccess,
              matkulData: matkulData.build(),
              presensiResult: _presensiResult?.build(),
              matkulTotal: matkulTotal,
              isTokenExpired: isTokenExpired,
              currentState: currentState,
              currentCode: currentCode);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'matkulData';
        matkulData.build();
        _$failedField = 'presensiResult';
        _presensiResult?.build();
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
