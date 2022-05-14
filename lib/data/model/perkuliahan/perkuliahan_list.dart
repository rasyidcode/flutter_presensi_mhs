library perkuliahan_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'perkuliahan_list.g.dart';

abstract class PerkuliahanList
    implements Built<PerkuliahanList, PerkuliahanListBuilder> {
  BuiltList<PerkuliahanItem?> get data;

  PerkuliahanList._();

  factory PerkuliahanList([Function(PerkuliahanListBuilder b) updates]) =
      _$PerkuliahanList;

  String toJson() {
    return json
        .encode(serializers.serializeWith(PerkuliahanList.serializer, this));
  }

  static PerkuliahanList? fromJson(String jsonString) {
    return serializers.deserializeWith(
        PerkuliahanList.serializer, json.decode(jsonString));
  }

  static Serializer<PerkuliahanList> get serializer =>
      _$perkuliahanListSerializer;
}
