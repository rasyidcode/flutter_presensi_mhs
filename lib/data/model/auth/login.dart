library login;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'login.g.dart';

abstract class Login implements Built<Login, LoginBuilder> {
  @BuiltValueField(wireName: 'access_token')
  String? get accessToken;
  @BuiltValueField(wireName: 'refresh_token')
  String? get refreshToken;

  Login._();

  factory Login([Function(LoginBuilder b) updates]) = _$Login;

  String toJson() {
    return json.encode(serializers.serializeWith(Login.serializer, this));
  }

  static Login? fromJson(String jsonString) {
    return serializers.deserializeWith(
        Login.serializer, json.decode(jsonString));
  }

  static Serializer<Login> get serializer => _$loginSerializer;
}
