// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$AuthState extends AuthState {
  @override
  final Auth auth;
  @override
  final bool? isLoading;
  @override
  final String error;
  @override
  final bool isReadyToNavigate;
  @override
  final String? stateMessage;
  @override
  final bool? isDoneGetAuth;
  @override
  final bool? isDoneRenewToken;
  @override
  final bool? isSuccessLogout;
  @override
  final bool? isLoadingLogout;

  factory _$AuthState([void Function(AuthStateBuilder)? updates]) =>
      (new AuthStateBuilder()..update(updates)).build();

  _$AuthState._(
      {required this.auth,
      this.isLoading,
      required this.error,
      required this.isReadyToNavigate,
      this.stateMessage,
      this.isDoneGetAuth,
      this.isDoneRenewToken,
      this.isSuccessLogout,
      this.isLoadingLogout})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(auth, 'AuthState', 'auth');
    BuiltValueNullFieldError.checkNotNull(error, 'AuthState', 'error');
    BuiltValueNullFieldError.checkNotNull(
        isReadyToNavigate, 'AuthState', 'isReadyToNavigate');
  }

  @override
  AuthState rebuild(void Function(AuthStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AuthStateBuilder toBuilder() => new AuthStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AuthState &&
        auth == other.auth &&
        isLoading == other.isLoading &&
        error == other.error &&
        isReadyToNavigate == other.isReadyToNavigate &&
        stateMessage == other.stateMessage &&
        isDoneGetAuth == other.isDoneGetAuth &&
        isDoneRenewToken == other.isDoneRenewToken &&
        isSuccessLogout == other.isSuccessLogout &&
        isLoadingLogout == other.isLoadingLogout;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, auth.hashCode), isLoading.hashCode),
                                error.hashCode),
                            isReadyToNavigate.hashCode),
                        stateMessage.hashCode),
                    isDoneGetAuth.hashCode),
                isDoneRenewToken.hashCode),
            isSuccessLogout.hashCode),
        isLoadingLogout.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AuthState')
          ..add('auth', auth)
          ..add('isLoading', isLoading)
          ..add('error', error)
          ..add('isReadyToNavigate', isReadyToNavigate)
          ..add('stateMessage', stateMessage)
          ..add('isDoneGetAuth', isDoneGetAuth)
          ..add('isDoneRenewToken', isDoneRenewToken)
          ..add('isSuccessLogout', isSuccessLogout)
          ..add('isLoadingLogout', isLoadingLogout))
        .toString();
  }
}

class AuthStateBuilder implements Builder<AuthState, AuthStateBuilder> {
  _$AuthState? _$v;

  AuthBuilder? _auth;
  AuthBuilder get auth => _$this._auth ??= new AuthBuilder();
  set auth(AuthBuilder? auth) => _$this._auth = auth;

  bool? _isLoading;
  bool? get isLoading => _$this._isLoading;
  set isLoading(bool? isLoading) => _$this._isLoading = isLoading;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isReadyToNavigate;
  bool? get isReadyToNavigate => _$this._isReadyToNavigate;
  set isReadyToNavigate(bool? isReadyToNavigate) =>
      _$this._isReadyToNavigate = isReadyToNavigate;

  String? _stateMessage;
  String? get stateMessage => _$this._stateMessage;
  set stateMessage(String? stateMessage) => _$this._stateMessage = stateMessage;

  bool? _isDoneGetAuth;
  bool? get isDoneGetAuth => _$this._isDoneGetAuth;
  set isDoneGetAuth(bool? isDoneGetAuth) =>
      _$this._isDoneGetAuth = isDoneGetAuth;

  bool? _isDoneRenewToken;
  bool? get isDoneRenewToken => _$this._isDoneRenewToken;
  set isDoneRenewToken(bool? isDoneRenewToken) =>
      _$this._isDoneRenewToken = isDoneRenewToken;

  bool? _isSuccessLogout;
  bool? get isSuccessLogout => _$this._isSuccessLogout;
  set isSuccessLogout(bool? isSuccessLogout) =>
      _$this._isSuccessLogout = isSuccessLogout;

  bool? _isLoadingLogout;
  bool? get isLoadingLogout => _$this._isLoadingLogout;
  set isLoadingLogout(bool? isLoadingLogout) =>
      _$this._isLoadingLogout = isLoadingLogout;

  AuthStateBuilder();

  AuthStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auth = $v.auth.toBuilder();
      _isLoading = $v.isLoading;
      _error = $v.error;
      _isReadyToNavigate = $v.isReadyToNavigate;
      _stateMessage = $v.stateMessage;
      _isDoneGetAuth = $v.isDoneGetAuth;
      _isDoneRenewToken = $v.isDoneRenewToken;
      _isSuccessLogout = $v.isSuccessLogout;
      _isLoadingLogout = $v.isLoadingLogout;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AuthState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$AuthState;
  }

  @override
  void update(void Function(AuthStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AuthState build() {
    _$AuthState _$result;
    try {
      _$result = _$v ??
          new _$AuthState._(
              auth: auth.build(),
              isLoading: isLoading,
              error: BuiltValueNullFieldError.checkNotNull(
                  error, 'AuthState', 'error'),
              isReadyToNavigate: BuiltValueNullFieldError.checkNotNull(
                  isReadyToNavigate, 'AuthState', 'isReadyToNavigate'),
              stateMessage: stateMessage,
              isDoneGetAuth: isDoneGetAuth,
              isDoneRenewToken: isDoneRenewToken,
              isSuccessLogout: isSuccessLogout,
              isLoadingLogout: isLoadingLogout);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'auth';
        auth.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'AuthState', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
