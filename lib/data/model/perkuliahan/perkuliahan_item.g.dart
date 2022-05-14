// GENERATED CODE - DO NOT MODIFY BY HAND

part of perkuliahan_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PerkuliahanItem> _$perkuliahanItemSerializer =
    new _$PerkuliahanItemSerializer();

class _$PerkuliahanItemSerializer
    implements StructuredSerializer<PerkuliahanItem> {
  @override
  final Iterable<Type> types = const [PerkuliahanItem, _$PerkuliahanItem];
  @override
  final String wireName = 'PerkuliahanItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, PerkuliahanItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nipDosen;
    if (value != null) {
      result
        ..add('nip_dosen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.namaDosen;
    if (value != null) {
      result
        ..add('nama_dosen')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.namaKelas;
    if (value != null) {
      result
        ..add('nama_kelas')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.matkul;
    if (value != null) {
      result
        ..add('matkul')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.date;
    if (value != null) {
      result
        ..add('date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.beginTime;
    if (value != null) {
      result
        ..add('begin_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.endTime;
    if (value != null) {
      result
        ..add('end_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qrSecret;
    if (value != null) {
      result
        ..add('qr_secret')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nowTime;
    if (value != null) {
      result
        ..add('now_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusPresensi;
    if (value != null) {
      result
        ..add('status_presensi')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.statusPerkuliahan;
    if (value != null) {
      result
        ..add('status_perkuliahan')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PerkuliahanItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PerkuliahanItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nip_dosen':
          result.nipDosen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nama_dosen':
          result.namaDosen = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nama_kelas':
          result.namaKelas = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'matkul':
          result.matkul = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'date':
          result.date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'begin_time':
          result.beginTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'end_time':
          result.endTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qr_secret':
          result.qrSecret = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'now_time':
          result.nowTime = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status_presensi':
          result.statusPresensi = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'status_perkuliahan':
          result.statusPerkuliahan = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$PerkuliahanItem extends PerkuliahanItem {
  @override
  final String? id;
  @override
  final String? nipDosen;
  @override
  final String? namaDosen;
  @override
  final String? namaKelas;
  @override
  final String? matkul;
  @override
  final String? date;
  @override
  final String? beginTime;
  @override
  final String? endTime;
  @override
  final String? qrSecret;
  @override
  final String? nowTime;
  @override
  final String? statusPresensi;
  @override
  final String? statusPerkuliahan;

  factory _$PerkuliahanItem([void Function(PerkuliahanItemBuilder)? updates]) =>
      (new PerkuliahanItemBuilder()..update(updates)).build();

  _$PerkuliahanItem._(
      {this.id,
      this.nipDosen,
      this.namaDosen,
      this.namaKelas,
      this.matkul,
      this.date,
      this.beginTime,
      this.endTime,
      this.qrSecret,
      this.nowTime,
      this.statusPresensi,
      this.statusPerkuliahan})
      : super._();

  @override
  PerkuliahanItem rebuild(void Function(PerkuliahanItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PerkuliahanItemBuilder toBuilder() =>
      new PerkuliahanItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PerkuliahanItem &&
        id == other.id &&
        nipDosen == other.nipDosen &&
        namaDosen == other.namaDosen &&
        namaKelas == other.namaKelas &&
        matkul == other.matkul &&
        date == other.date &&
        beginTime == other.beginTime &&
        endTime == other.endTime &&
        qrSecret == other.qrSecret &&
        nowTime == other.nowTime &&
        statusPresensi == other.statusPresensi &&
        statusPerkuliahan == other.statusPerkuliahan;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                nipDosen.hashCode),
                                            namaDosen.hashCode),
                                        namaKelas.hashCode),
                                    matkul.hashCode),
                                date.hashCode),
                            beginTime.hashCode),
                        endTime.hashCode),
                    qrSecret.hashCode),
                nowTime.hashCode),
            statusPresensi.hashCode),
        statusPerkuliahan.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('PerkuliahanItem')
          ..add('id', id)
          ..add('nipDosen', nipDosen)
          ..add('namaDosen', namaDosen)
          ..add('namaKelas', namaKelas)
          ..add('matkul', matkul)
          ..add('date', date)
          ..add('beginTime', beginTime)
          ..add('endTime', endTime)
          ..add('qrSecret', qrSecret)
          ..add('nowTime', nowTime)
          ..add('statusPresensi', statusPresensi)
          ..add('statusPerkuliahan', statusPerkuliahan))
        .toString();
  }
}

class PerkuliahanItemBuilder
    implements Builder<PerkuliahanItem, PerkuliahanItemBuilder> {
  _$PerkuliahanItem? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _nipDosen;
  String? get nipDosen => _$this._nipDosen;
  set nipDosen(String? nipDosen) => _$this._nipDosen = nipDosen;

  String? _namaDosen;
  String? get namaDosen => _$this._namaDosen;
  set namaDosen(String? namaDosen) => _$this._namaDosen = namaDosen;

  String? _namaKelas;
  String? get namaKelas => _$this._namaKelas;
  set namaKelas(String? namaKelas) => _$this._namaKelas = namaKelas;

  String? _matkul;
  String? get matkul => _$this._matkul;
  set matkul(String? matkul) => _$this._matkul = matkul;

  String? _date;
  String? get date => _$this._date;
  set date(String? date) => _$this._date = date;

  String? _beginTime;
  String? get beginTime => _$this._beginTime;
  set beginTime(String? beginTime) => _$this._beginTime = beginTime;

  String? _endTime;
  String? get endTime => _$this._endTime;
  set endTime(String? endTime) => _$this._endTime = endTime;

  String? _qrSecret;
  String? get qrSecret => _$this._qrSecret;
  set qrSecret(String? qrSecret) => _$this._qrSecret = qrSecret;

  String? _nowTime;
  String? get nowTime => _$this._nowTime;
  set nowTime(String? nowTime) => _$this._nowTime = nowTime;

  String? _statusPresensi;
  String? get statusPresensi => _$this._statusPresensi;
  set statusPresensi(String? statusPresensi) =>
      _$this._statusPresensi = statusPresensi;

  String? _statusPerkuliahan;
  String? get statusPerkuliahan => _$this._statusPerkuliahan;
  set statusPerkuliahan(String? statusPerkuliahan) =>
      _$this._statusPerkuliahan = statusPerkuliahan;

  PerkuliahanItemBuilder();

  PerkuliahanItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _nipDosen = $v.nipDosen;
      _namaDosen = $v.namaDosen;
      _namaKelas = $v.namaKelas;
      _matkul = $v.matkul;
      _date = $v.date;
      _beginTime = $v.beginTime;
      _endTime = $v.endTime;
      _qrSecret = $v.qrSecret;
      _nowTime = $v.nowTime;
      _statusPresensi = $v.statusPresensi;
      _statusPerkuliahan = $v.statusPerkuliahan;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PerkuliahanItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PerkuliahanItem;
  }

  @override
  void update(void Function(PerkuliahanItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$PerkuliahanItem build() {
    final _$result = _$v ??
        new _$PerkuliahanItem._(
            id: id,
            nipDosen: nipDosen,
            namaDosen: namaDosen,
            namaKelas: namaKelas,
            matkul: matkul,
            date: date,
            beginTime: beginTime,
            endTime: endTime,
            qrSecret: qrSecret,
            nowTime: nowTime,
            statusPresensi: statusPresensi,
            statusPerkuliahan: statusPerkuliahan);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
