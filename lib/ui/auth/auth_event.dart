library auth_event;

import 'package:built_value/built_value.dart';

part 'auth_event.g.dart';

abstract class AuthEvent {}

class GetAuth extends AuthEvent {}

abstract class RenewToken extends AuthEvent
    implements Built<RenewToken, RenewTokenBuilder> {
  String get refreshToken;

  RenewToken._();

  factory RenewToken([Function(RenewTokenBuilder b) updates]) = _$RenewToken;
}
