// GENERATED CODE - DO NOT MODIFY BY HAND

part of auth;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SignIn> _$signInSerializer = new _$SignInSerializer();

class _$SignInSerializer implements StructuredSerializer<SignIn> {
  @override
  final Iterable<Type> types = const [SignIn, _$SignIn];
  @override
  final String wireName = 'SignIn';

  @override
  Iterable<Object?> serialize(Serializers serializers, SignIn object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.accessToken;
    if (value != null) {
      result
        ..add('accessToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.refreshToken;
    if (value != null) {
      result
        ..add('refreshToken')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  SignIn deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SignInBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'accessToken':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'refreshToken':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$SignIn extends SignIn {
  @override
  final String? accessToken;
  @override
  final String? refreshToken;

  factory _$SignIn([void Function(SignInBuilder)? updates]) =>
      (new SignInBuilder()..update(updates)).build();

  _$SignIn._({this.accessToken, this.refreshToken}) : super._();

  @override
  SignIn rebuild(void Function(SignInBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SignInBuilder toBuilder() => new SignInBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SignIn &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, accessToken.hashCode), refreshToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('SignIn')
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken))
        .toString();
  }
}

class SignInBuilder implements Builder<SignIn, SignInBuilder> {
  _$SignIn? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  SignInBuilder();

  SignInBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SignIn other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SignIn;
  }

  @override
  void update(void Function(SignInBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$SignIn build() {
    final _$result = _$v ??
        new _$SignIn._(accessToken: accessToken, refreshToken: refreshToken);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
