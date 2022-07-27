// GENERATED CODE - DO NOT MODIFY BY HAND

part of welcome_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$WelcomeState extends WelcomeState {
  @override
  final String error;
  @override
  final bool? isSuccess;

  factory _$WelcomeState([void Function(WelcomeStateBuilder)? updates]) =>
      (new WelcomeStateBuilder()..update(updates)).build();

  _$WelcomeState._({required this.error, this.isSuccess}) : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'WelcomeState', 'error');
  }

  @override
  WelcomeState rebuild(void Function(WelcomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WelcomeStateBuilder toBuilder() => new WelcomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is WelcomeState &&
        error == other.error &&
        isSuccess == other.isSuccess;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, error.hashCode), isSuccess.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('WelcomeState')
          ..add('error', error)
          ..add('isSuccess', isSuccess))
        .toString();
  }
}

class WelcomeStateBuilder
    implements Builder<WelcomeState, WelcomeStateBuilder> {
  _$WelcomeState? _$v;

  String? _error;
  String? get error => _$this._error;
  set error(String? error) => _$this._error = error;

  bool? _isSuccess;
  bool? get isSuccess => _$this._isSuccess;
  set isSuccess(bool? isSuccess) => _$this._isSuccess = isSuccess;

  WelcomeStateBuilder();

  WelcomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isSuccess = $v.isSuccess;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(WelcomeState other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$WelcomeState;
  }

  @override
  void update(void Function(WelcomeStateBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$WelcomeState build() {
    final _$result = _$v ??
        new _$WelcomeState._(
            error: BuiltValueNullFieldError.checkNotNull(
                error, 'WelcomeState', 'error'),
            isSuccess: isSuccess);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
