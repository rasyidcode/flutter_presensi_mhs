// GENERATED CODE - DO NOT MODIFY BY HAND

part of splash_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$SplashState extends SplashState {
  @override
  final bool isLoading;
  @override
  final String error;
  @override
  final local_auth.Auth auth;
  @override
  final bool isFirstTime;

  factory _$SplashState([void Function(SplashStateBuilder)? updates]) =>
      (new SplashStateBuilder()..update(updates)).build();

  _$SplashState._(
      {required this.isLoading,
      required this.error,
      required this.auth,
      required this.isFirstTime})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        isLoading, 'SplashState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(error, 'SplashState', 'error');
    BuiltValueNullFieldError.checkNotNull(auth, 'SplashState', 'auth');
    BuiltValueNullFieldError.checkNotNull(
        isFirstTime, 'SplashState', 'isFirstTime');
  }

  @override
  SplashState rebuild(void Function(SplashStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SplashStateBuilder toBuilder() => new SplashStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SplashState &&
        isLoading == other.isLoading &&
        error == other.error &&
        auth == other.auth &&
        isFirstTime == other.isFirstTime;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), error.hashCode), auth.hashCode),
        isFirstTime.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SplashState')
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('auth', auth)
          ..add('isFirstTime', isFirstTime))
        .toString();
  }
}

class SplashStateBuilder implements Builder<SplashState, SplashStateBuilder> {
  _$SplashState? _$v;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  local_auth.AuthBuilder? _auth;
  local_auth.AuthBuilder get auth =>
      _$this._auth ??= new local_auth.AuthBuilder();
  set auth(local_auth.AuthBuilder? auth) => _$this._auth = auth;

  bool? _isFirstTime;
  bool? get isFirstTime => _$this._isFirstTime;
  set isFirstTime(bool? isFirstTime) => _$this._isFirstTime = isFirstTime;

  SplashStateBuilder();

  SplashStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isLoading = $v.isLoading;
      _error = $v.error;
      _auth = $v.auth.toBuilder();
      _isFirstTime = $v.isFirstTime;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SplashState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SplashState;
  }

  @override
  void update(void Function(SplashStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SplashState build() {
    _$SplashState _$result;
    try {
      _$result = _$v ??
          new _$SplashState._(
              isLoading: BuiltValueNullFieldError.checkNotNull(
                  isLoading, 'SplashState', 'isLoading'),
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'SplashState', 'error'),
              auth: auth.build(),
              isFirstTime: BuiltValueNullFieldError.checkNotNull(
                  isFirstTime, 'SplashState', 'isFirstTime'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'auth';
        auth.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'SplashState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
