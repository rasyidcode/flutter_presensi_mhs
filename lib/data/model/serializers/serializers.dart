library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_collection/built_collection.dart';
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/presensi_result.dart';

part 'serializers.g.dart';

@SerializersFor([Auth, PerkuliahanList, PerkuliahanItem, PresensiResult])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
