// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$DoLogin extends DoLogin {
  @override
  final String username;
  @override
  final String password;

  factory _$DoLogin([void Function(DoLoginBuilder)? updates]) =>
      (new DoLoginBuilder()..update(updates)).build();

  _$DoLogin._({required this.username, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, 'DoLogin', 'username');
    BuiltValueNullFieldError.checkNotNull(password, 'DoLogin', 'password');
  }

  @override
  DoLogin rebuild(void Function(DoLoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoLoginBuilder toBuilder() => new DoLoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoLogin &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoLogin')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class DoLoginBuilder implements Builder<DoLogin, DoLoginBuilder> {
  _$DoLogin? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  DoLoginBuilder();

  DoLoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoLogin other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoLogin;
  }

  @override
  void update(void Function(DoLoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoLogin build() {
    final _$result = _$v ??
        new _$DoLogin._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, 'DoLogin', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, 'DoLogin', 'password'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
