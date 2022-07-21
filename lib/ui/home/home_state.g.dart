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
  final PerkuliahanList data;
  @override
  final bool isGetAuthFinished;
  @override
  final bool? isExpiredToken;
  @override
  final bool isTokenRenewed;

  factory _$HomeState([void Function(HomeStateBuilder)? updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {required this.error,
      required this.isLoading,
      required this.data,
      required this.isGetAuthFinished,
      this.isExpiredToken,
      required this.isTokenRenewed})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(error, 'HomeState', 'error');
    BuiltValueNullFieldError.checkNotNull(isLoading, 'HomeState', 'isLoading');
    BuiltValueNullFieldError.checkNotNull(data, 'HomeState', 'data');
    BuiltValueNullFieldError.checkNotNull(
        isGetAuthFinished, 'HomeState', 'isGetAuthFinished');
    BuiltValueNullFieldError.checkNotNull(
        isTokenRenewed, 'HomeState', 'isTokenRenewed');
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
        data == other.data &&
        isGetAuthFinished == other.isGetAuthFinished &&
        isExpiredToken == other.isExpiredToken &&
        isTokenRenewed == other.isTokenRenewed;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, error.hashCode), isLoading.hashCode),
                    data.hashCode),
                isGetAuthFinished.hashCode),
            isExpiredToken.hashCode),
        isTokenRenewed.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('error', error)
          ..add('isLoading', isLoading)
          ..add('data', data)
          ..add('isGetAuthFinished', isGetAuthFinished)
          ..add('isExpiredToken', isExpiredToken)
          ..add('isTokenRenewed', isTokenRenewed))
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

  PerkuliahanListBuilder? _data;
  PerkuliahanListBuilder get data =>
      _$this._data ??= new PerkuliahanListBuilder();
  set data(PerkuliahanListBuilder? data) => _$this._data = data;

  bool? _isGetAuthFinished;
  bool? get isGetAuthFinished => _$this._isGetAuthFinished;
  set isGetAuthFinished(bool? isGetAuthFinished) =>
      _$this._isGetAuthFinished = isGetAuthFinished;

  bool? _isExpiredToken;
  bool? get isExpiredToken => _$this._isExpiredToken;
  set isExpiredToken(bool? isExpiredToken) =>
      _$this._isExpiredToken = isExpiredToken;

  bool? _isTokenRenewed;
  bool? get isTokenRenewed => _$this._isTokenRenewed;
  set isTokenRenewed(bool? isTokenRenewed) =>
      _$this._isTokenRenewed = isTokenRenewed;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _error = $v.error;
      _isLoading = $v.isLoading;
      _data = $v.data.toBuilder();
      _isGetAuthFinished = $v.isGetAuthFinished;
      _isExpiredToken = $v.isExpiredToken;
      _isTokenRenewed = $v.isTokenRenewed;
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
              data: data.build(),
              isGetAuthFinished: BuiltValueNullFieldError.checkNotNull(
                  isGetAuthFinished, 'HomeState', 'isGetAuthFinished'),
              isExpiredToken: isExpiredToken,
              isTokenRenewed: BuiltValueNullFieldError.checkNotNull(
                  isTokenRenewed, 'HomeState', 'isTokenRenewed'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
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
