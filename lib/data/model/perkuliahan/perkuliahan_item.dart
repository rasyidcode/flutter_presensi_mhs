library perkuliahan_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'perkuliahan_item.g.dart';

abstract class PerkuliahanItem
    implements Built<PerkuliahanItem, PerkuliahanItemBuilder> {
  String? get id;
  @BuiltValueField(wireName: 'nip_dosen')
  String? get nipDosen;
  @BuiltValueField(wireName: 'nama_dosen')
  String? get namaDosen;
  @BuiltValueField(wireName: 'nama_kelas')
  String? get namaKelas;
  String? get matkul;
  String? get date;
  @BuiltValueField(wireName: 'begin_time')
  String? get beginTime;
  @BuiltValueField(wireName: 'end_time')
  String? get endTime;
  @BuiltValueField(wireName: 'qr_secret')
  String? get qrSecret;
  @BuiltValueField(wireName: 'now_time')
  String? get nowTime;
  @BuiltValueField(wireName: 'status_presensi')
  String? get statusPresensi;
  @BuiltValueField(wireName: 'status_perkuliahan')
  String? get statusPerkuliahan;

  PerkuliahanItem._();

  factory PerkuliahanItem([Function(PerkuliahanItemBuilder b) updates]) =
      _$PerkuliahanItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PerkuliahanItem.serializer, this));
  }

  static PerkuliahanItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PerkuliahanItem.serializer, json.decode(jsonString));
  }

  static Serializer<PerkuliahanItem> get serializer =>
      _$perkuliahanItemSerializer;
}
