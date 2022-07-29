// GENERATED CODE - DO NOT MODIFY BY HAND

part of presensi_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PresensiResult> _$presensiResultSerializer =
    new _$PresensiResultSerializer();

class _$PresensiResultSerializer
    implements StructuredSerializer<PresensiResult> {
  @override
  final Iterable<Type> types = const [PresensiResult, _$PresensiResult];
  @override
  final String wireName = 'PresensiResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, PresensiResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'statusPresensi',
      serializers.serialize(object.statusPresensi,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  PresensiResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PresensiResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'statusPresensi':
          result.statusPresensi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$PresensiResult extends PresensiResult {
  @override
  final String message;
  @override
  final String statusPresensi;

  factory _$PresensiResult([void Function(PresensiResultBuilder)? updates]) =>
      (new PresensiResultBuilder()..update(updates)).build();

  _$PresensiResult._({required this.message, required this.statusPresensi})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(message, 'PresensiResult', 'message');
    BuiltValueNullFieldError.checkNotNull(
        statusPresensi, 'PresensiResult', 'statusPresensi');
  }

  @override
  PresensiResult rebuild(void Function(PresensiResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PresensiResultBuilder toBuilder() =>
      new PresensiResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PresensiResult &&
        message == other.message &&
        statusPresensi == other.statusPresensi;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), statusPresensi.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PresensiResult')
          ..add('message', message)
          ..add('statusPresensi', statusPresensi))
        .toString();
  }
}

class PresensiResultBuilder
    implements Builder<PresensiResult, PresensiResultBuilder> {
  _$PresensiResult? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  String? _statusPresensi;
  String? get statusPresensi => _$this._statusPresensi;
  set statusPresensi(String? statusPresensi) =>
      _$this._statusPresensi = statusPresensi;

  PresensiResultBuilder();

  PresensiResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _statusPresensi = $v.statusPresensi;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PresensiResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PresensiResult;
  }

  @override
  void update(void Function(PresensiResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PresensiResult build() {
    final _$result = _$v ??
        new _$PresensiResult._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, 'PresensiResult', 'message'),
            statusPresensi: BuiltValueNullFieldError.checkNotNull(
                statusPresensi, 'PresensiResult', 'statusPresensi'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
