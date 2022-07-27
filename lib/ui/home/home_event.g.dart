// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_event;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$GetListMatkul extends GetListMatkul {
  @override
  final String accessToken;

  factory _$GetListMatkul([void Function(GetListMatkulBuilder)? updates]) =>
      (new GetListMatkulBuilder()..update(updates)).build();

  _$GetListMatkul._({required this.accessToken}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        accessToken, 'GetListMatkul', 'accessToken');
  }

  @override
  GetListMatkul rebuild(void Function(GetListMatkulBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  GetListMatkulBuilder toBuilder() => new GetListMatkulBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is GetListMatkul && accessToken == other.accessToken;
  }

  @override
  int get hashCode {
    return $jf($jc(0, accessToken.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('GetListMatkul')
          ..add('accessToken', accessToken))
        .toString();
  }
}

class GetListMatkulBuilder
    implements Builder<GetListMatkul, GetListMatkulBuilder> {
  _$GetListMatkul? _$v;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  GetListMatkulBuilder();

  GetListMatkulBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _accessToken = $v.accessToken;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(GetListMatkul other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$GetListMatkul;
  }

  @override
  void update(void Function(GetListMatkulBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$GetListMatkul build() {
    final _$result = _$v ??
        new _$GetListMatkul._(
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, 'GetListMatkul', 'accessToken'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
