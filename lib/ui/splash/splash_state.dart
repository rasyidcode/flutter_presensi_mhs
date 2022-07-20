library splash_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local_auth;

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  local_auth.Auth get auth;
  bool get isFirstTime;
  bool get isCreatingDB;
  bool get isReadyToNavigate;
  bool get isDBCreated;
  String get statusMessage;

  bool get isLoggedIn =>
      isLoading &&
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
      ..isCreatingDB = false
      ..isDBCreated = false
      ..isReadyToNavigate = false
      ..statusMessage = ''
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
      ..isCreatingDB = false
      ..isDBCreated = false
      ..isReadyToNavigate = false
      ..statusMessage = 'Preparing...'
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.loggedIn(local_auth.Auth authLocal) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..statusMessage = 'Auth Found'
      ..isFirstTime = false
      ..isCreatingDB = false
      ..isDBCreated = false
      ..isReadyToNavigate = true
      ..auth.replace(authLocal));
  }

  factory SplashState.error(String errorMsg) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = errorMsg
      ..isFirstTime = false
      ..statusMessage = ''
      ..isCreatingDB = false
      ..isDBCreated = false
      ..isReadyToNavigate = false
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.firstTime(bool ftVal) {
    String statusMsg = '';
    if (ftVal) {
      statusMsg = 'This is your first time';
    } else {
      statusMsg = 'Not your first time';
    }
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = ftVal
      ..statusMessage = statusMsg
      ..isCreatingDB = false
      ..isDBCreated = false
      ..isReadyToNavigate = true
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.dbCreating() {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = false
      ..isCreatingDB = true
      ..isDBCreated = false
      ..isReadyToNavigate = false
      ..statusMessage = 'Initializing DB...'
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }

  factory SplashState.dbCreated() {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = false
      ..isCreatingDB = false
      ..isDBCreated = true
      ..isReadyToNavigate = false
      ..statusMessage = 'DB Created...'
      ..auth.replace(local_auth.Auth((b) => b
        ..id = 0
        ..accessToken = ''
        ..refreshToken = ''
        ..createdAt = 0)));
  }
}
