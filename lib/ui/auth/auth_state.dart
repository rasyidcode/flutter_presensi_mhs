library auth_state;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';

part 'auth_state.g.dart';

abstract class AuthState implements Built<AuthState, AuthStateBuilder> {
  Auth get auth;
  bool get isLoading;
  String get error;
  bool get isReadyToNavigate;
  String? get stateMessage;

  bool get isHasAuth => isAuthNotNull && !isLoading && error == '';

  bool get isAuthNotNull =>
      auth.id != 0 &&
      auth.accessToken != '' &&
      auth.refreshToken != '' &&
      auth.createdAt != 0;

  bool? get isDoneGetAuth;
  bool? get isDoneRenewToken;
  bool get isError => error.isNotEmpty;

  AuthState._();

  factory AuthState([Function(AuthStateBuilder b) updates]) = _$AuthState;

  factory AuthState.initial() {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = ''
        ..isReadyToNavigate = false
        ..auth.replace(
          Auth((b) => b
            ..accessToken = ''
            ..refreshToken = ''
            ..id = 0
            ..createdAt = 0),
        ),
    );
  }

  factory AuthState.loading({String? stateMsg}) {
    return AuthState(
      (b) => b
        ..isLoading = true
        ..error = ''
        ..isReadyToNavigate = false
        ..stateMessage = stateMsg
        ..auth.replace(
          Auth((b) => b
            ..accessToken = ''
            ..refreshToken = ''
            ..id = 0
            ..createdAt = 0),
        ),
    );
  }

  factory AuthState.success(Auth auth,
      {String? stateMsg, bool? isDoneGetAuth, bool? isDoneRenewToken}) {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = ''
        ..stateMessage = stateMsg
        ..isDoneGetAuth = isDoneGetAuth
        ..isDoneRenewToken = isDoneRenewToken
        ..isReadyToNavigate = true
        ..auth.replace(auth),
    );
  }

  factory AuthState.fail(String error, {String? stateMsg}) {
    return AuthState(
      (b) => b
        ..isLoading = false
        ..error = error
        ..isReadyToNavigate = true
        ..stateMessage = stateMsg
        ..auth.replace(Auth((b) => b
          ..accessToken = ''
          ..refreshToken = ''
          ..id = 0
          ..createdAt = 0)),
    );
  }
}
