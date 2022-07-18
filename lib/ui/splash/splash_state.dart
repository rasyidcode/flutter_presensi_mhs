library splash_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local_auth;

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  local_auth.Auth get auth;
  bool get isFirstTime;

  bool get isLoggedIn =>
      !isLoading &&
      auth.id! != 0 &&
      auth.accessToken!.isNotEmpty &&
      auth.refreshToken!.isNotEmpty &&
      auth.createdAt! != 0 &&
      error.isEmpty;

  bool get isError => error.isEmpty;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..isFirstTime = false
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.loading() {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = false
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.loggedIn(local_auth.Auth authLocal) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..isFirstTime = false
      ..auth.replace(authLocal));
  }

  factory SplashState.error(String errorMsg) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = errorMsg
      ..isFirstTime = false
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.firstTime(bool ftVal) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..isFirstTime = ftVal
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }
}
