library auth;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_presensi_mhs/data/model/serializers/serializers.dart';

part 'sign_in.g.dart';

abstract class SignIn implements Built<SignIn, SignInBuilder> {
  // fields go here
  String? get accessToken;
  String? get refreshToken;

  SignIn._();

  factory SignIn([Function(SignInBuilder b) updates]) = _$SignIn;

  String toJson() {
    return json.encode(serializers.serializeWith(SignIn.serializer, this));
  }

  static SignIn? fromJson(String jsonString) {
    return serializers.deserializeWith(
        SignIn.serializer, json.decode(jsonString));
  }

  static Serializer<SignIn> get serializer => _$signInSerializer;
}
