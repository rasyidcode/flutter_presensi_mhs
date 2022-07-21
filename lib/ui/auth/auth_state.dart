library auth_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  Auth get auth;
  bool get isLoading;
  String get error;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = ''
        ..auth.replace(
          Auth((b) => b
            ..accessToken = ''
            ..refreshToken = ''
            ..id = 0
            ..createdAt = 0),
        ),
    );
  }

  factory AuthState.loading() {
    return AuthState(
      (b) => b
        ..isLoading = true
        ..error = ''
        ..auth.replace(
          Auth((b) => b
            ..accessToken = ''
            ..refreshToken = ''
            ..id = 0
            ..createdAt = 0),
        ),
    );
  }

  factory AuthState.success(Auth auth) {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = ''
        ..auth.replace(auth),
    );
  }

  factory AuthState.fail(String error) {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = error
        ..auth.replace(Auth((b) => b
          ..accessToken = ''
          ..refreshToken = ''
          ..id = 0
          ..createdAt = 0)),
    );
  }
}
