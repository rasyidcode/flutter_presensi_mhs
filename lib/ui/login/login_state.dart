library login_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart' as api;

part 'login_state.g.dart';

abstract class LoginState implements Built<LoginState, LoginStateBuilder> {
  bool get isLoading;
  String get error;
  api.Auth get auth;

  bool get isError => error.isNotEmpty;

  bool get isSuccess =>
      !isLoading &&
      auth.accessToken!.isNotEmpty &&
      auth.refreshToken!.isNotEmpty &&
      error == '';

  LoginState._();

  factory LoginState([Function(LoginStateBuilder b) updates]) = _$LoginState;

  factory LoginState.initial() {
    return LoginState((b) => b
      ..isLoading = false
      ..error = ''
      ..auth.replace(api.Auth((b) => b
        ..accessToken = ''
        ..refreshToken = '')));
  }

  factory LoginState.loading() {
    return LoginState((b) => b
      ..isLoading = true
      ..error = ''
      ..auth.replace(api.Auth((b) => b
        ..accessToken = ''
        ..refreshToken = '')));
  }

  factory LoginState.success(api.Auth authApi) {
    return LoginState((b) => b
      ..isLoading = false
      ..error = ''
      ..auth.replace(authApi));
  }

  factory LoginState.error(String errorMsg) {
    return LoginState((b) => b
      ..isLoading = false
      ..error = errorMsg
      ..auth.replace(api.Auth((b) => b
        ..accessToken = ''
        ..refreshToken = '')));
  }
}
