// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$RenewToken extends RenewToken {
  @override
  final Auth auth;

  factory _$RenewToken([void Function(RenewTokenBuilder)? updates]) =>
      (new RenewTokenBuilder()..update(updates)).build();

  _$RenewToken._({required this.auth}) : super._() {
    BuiltValueNullFieldError.checkNotNull(auth, 'RenewToken', 'auth');
  }

  @override
  RenewToken rebuild(void Function(RenewTokenBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RenewTokenBuilder toBuilder() => new RenewTokenBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RenewToken && auth == other.auth;
  }

  @override
  int get hashCode {
    return $jf($jc(0, auth.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('RenewToken')..add('auth', auth))
        .toString();
  }
}

class RenewTokenBuilder implements Builder<RenewToken, RenewTokenBuilder> {
  _$RenewToken? _$v;

  AuthBuilder? _auth;
  AuthBuilder get auth => _$this._auth ??= new AuthBuilder();
  set auth(AuthBuilder? auth) => _$this._auth = auth;

  RenewTokenBuilder();

  RenewTokenBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _auth = $v.auth.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RenewToken other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RenewToken;
  }

  @override
  void update(void Function(RenewTokenBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$RenewToken build() {
    _$RenewToken _$result;
    try {
      _$result = _$v ?? new _$RenewToken._(auth: auth.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'auth';
        auth.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'RenewToken', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$DoLogout extends DoLogout {
  @override
  final String accessToken;
  @override
  final String refreshToken;

  factory _$DoLogout([void Function(DoLogoutBuilder)? updates]) =>
      (new DoLogoutBuilder()..update(updates)).build();

  _$DoLogout._({required this.accessToken, required this.refreshToken})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, 'DoLogout', 'accessToken');
    BuiltValueNullFieldError.checkNotNull(
        refreshToken, 'DoLogout', 'refreshToken');
  }

  @override
  DoLogout rebuild(void Function(DoLogoutBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoLogoutBuilder toBuilder() => new DoLogoutBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoLogout &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, accessToken.hashCode), refreshToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoLogout')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class DoLogoutBuilder implements Builder<DoLogout, DoLogoutBuilder> {
  _$DoLogout? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  DoLogoutBuilder();

  DoLogoutBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoLogout other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoLogout;
  }

  @override
  void update(void Function(DoLogoutBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoLogout build() {
    final _$result = _$v ??
        new _$DoLogout._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, 'DoLogout', 'accessToken'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, 'DoLogout', 'refreshToken'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
