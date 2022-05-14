// GENERATED CODE - DO NOT MODIFY BY HAND

part of perkuliahan_list;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PerkuliahanList> _$perkuliahanListSerializer =
    new _$PerkuliahanListSerializer();

class _$PerkuliahanListSerializer
    implements StructuredSerializer<PerkuliahanList> {
  @override
  final Iterable<Type> types = const [PerkuliahanList, _$PerkuliahanList];
  @override
  final String wireName = 'PerkuliahanList';

  @override
  Iterable<Object?> serialize(Serializers serializers, PerkuliahanList object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'data',
      serializers.serialize(object.data,
          specifiedType: const FullType(
              BuiltList, const [const FullType.nullable(PerkuliahanItem)])),
    ];

    return result;
  }

  @override
  PerkuliahanList deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PerkuliahanListBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'data':
          result.data.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType.nullable(PerkuliahanItem)
              ]))! as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$PerkuliahanList extends PerkuliahanList {
  @override
  final BuiltList<PerkuliahanItem?> data;

  factory _$PerkuliahanList([void Function(PerkuliahanListBuilder)? updates]) =>
      (new PerkuliahanListBuilder()..update(updates)).build();

  _$PerkuliahanList._({required this.data}) : super._() {
    BuiltValueNullFieldError.checkNotNull(data, 'PerkuliahanList', 'data');
  }

  @override
  PerkuliahanList rebuild(void Function(PerkuliahanListBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PerkuliahanListBuilder toBuilder() =>
      new PerkuliahanListBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PerkuliahanList && data == other.data;
  }

  @override
  int get hashCode {
    return $jf($jc(0, data.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PerkuliahanList')..add('data', data))
        .toString();
  }
}

class PerkuliahanListBuilder
    implements Builder<PerkuliahanList, PerkuliahanListBuilder> {
  _$PerkuliahanList? _$v;

  ListBuilder<PerkuliahanItem?>? _data;
  ListBuilder<PerkuliahanItem?> get data =>
      _$this._data ??= new ListBuilder<PerkuliahanItem?>();
  set data(ListBuilder<PerkuliahanItem?>? data) => _$this._data = data;

  PerkuliahanListBuilder();

  PerkuliahanListBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _data = $v.data.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PerkuliahanList other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PerkuliahanList;
  }

  @override
  void update(void Function(PerkuliahanListBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PerkuliahanList build() {
    _$PerkuliahanList _$result;
    try {
      _$result = _$v ?? new _$PerkuliahanList._(data: data.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'data';
        data.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'PerkuliahanList', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
