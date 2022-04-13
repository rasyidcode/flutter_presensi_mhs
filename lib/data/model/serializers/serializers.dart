library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_presensi_mhs/data/model/auth/sign_in.dart';

part 'serializers.g.dart';

@SerializersFor([SignIn])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
