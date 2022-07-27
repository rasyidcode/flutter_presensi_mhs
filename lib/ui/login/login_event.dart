library login_event;

import 'package:built_value/built_value.dart';

part 'login_event.g.dart';

abstract class LoginEvent {}

abstract class DoLogin extends LoginEvent
    implements Built<DoLogin, DoLoginBuilder> {
  String get username;
  String get password;

  DoLogin._();

  factory DoLogin([Function(DoLoginBuilder b) updates]) = _$DoLogin;
}
