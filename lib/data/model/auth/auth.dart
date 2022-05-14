library auth;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'auth.g.dart';

abstract class Auth implements Built<Auth, AuthBuilder> {
  @BuiltValueField(wireName: 'access_token')
  String? get accessToken;
  @BuiltValueField(wireName: 'refresh_token')
  String? get refreshToken;

  Auth._();

  factory Auth([Function(AuthBuilder b) updates]) = _$Auth;

  String toJson() {
    return json.encode(serializers.serializeWith(Auth.serializer, this));
  }

  static Auth? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Auth.serializer, json.decode(jsonString));
  }

  static Serializer<Auth> get serializer => _$authSerializer;
}
