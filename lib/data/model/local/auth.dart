library auth;

import 'package:built_value/built_value.dart';

part 'auth.g.dart';

abstract class Auth implements Built<Auth, AuthBuilder> {
  int? get id;
  String? get accessToken;
  String? get refreshToken;
  int? get createdAt;

  Auth._();

  Map<String, Object?> toMap() {
    return <String, Object?>{
      'id': id,
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'createdAt': createdAt
    };
  }

  factory Auth([Function(AuthBuilder b) updates]) = _$Auth;
}
