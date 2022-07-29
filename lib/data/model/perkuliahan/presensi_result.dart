library presensi_result;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'presensi_result.g.dart';

abstract class PresensiResult
    implements Built<PresensiResult, PresensiResultBuilder> {
  String get message;
  String get statusPresensi;

  PresensiResult._();

  factory PresensiResult([Function(PresensiResultBuilder b) updates]) =
      _$PresensiResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PresensiResult.serializer, this));
  }

  static PresensiResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PresensiResult.serializer, json.decode(jsonString));
  }

  static Serializer<PresensiResult> get serializer =>
      _$presensiResultSerializer;
}
