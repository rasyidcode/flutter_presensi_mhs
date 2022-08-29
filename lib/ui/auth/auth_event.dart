library auth_event;

import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

class GetAuth extends AuthEvent {}

abstract class RenewToken extends AuthEvent
    implements Built<RenewToken, RenewTokenBuilder> {
  Auth get auth;

  RenewToken._();

  factory RenewToken([Function(RenewTokenBuilder b) updates]) = _$RenewToken;
}

abstract class DoLogout extends AuthEvent
    implements Built<DoLogout, DoLogoutBuilder> {
  String get accessToken;
  String get refreshToken;

  DoLogout._();

  factory DoLogout([Function(DoLogoutBuilder b) updates]) = _$DoLogout;
}
