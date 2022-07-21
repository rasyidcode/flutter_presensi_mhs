library splash_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local_auth;

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  bool? get isFirstTime;
  bool? get isDBInitiated;
  String get stateMessage;

  bool get isError => error.isEmpty;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..stateMessage = '');
  }

  factory SplashState.loading(String message) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..stateMessage = message);
  }

  factory SplashState.loggedIn(local_auth.Auth authLocal) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..stateMessage = 'Auth Found');
  }

  factory SplashState.fail(String errorMsg, {bool? isFirstTime}) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = errorMsg
      ..isFirstTime = isFirstTime
      ..stateMessage = '');
  }

  factory SplashState.success(String message,
      {bool? dbInitiated, bool? isFirstTime}) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = isFirstTime
      ..isDBInitiated = dbInitiated
      ..stateMessage = message);
  }
}
