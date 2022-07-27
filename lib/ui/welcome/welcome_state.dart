library welcome_state;

import 'package:built_value/built_value.dart';

part 'welcome_state.g.dart';

abstract class WelcomeState
    implements Built<WelcomeState, WelcomeStateBuilder> {
  WelcomeState._();

  String get error;
  bool? get isSuccess;

  factory WelcomeState([Function(WelcomeStateBuilder b) updates]) =
      _$WelcomeState;

  factory WelcomeState.initial() {
    return WelcomeState((b) => b..error = '');
  }

  factory WelcomeState.success() {
    return WelcomeState((b) => b
      ..error = ''
      ..isSuccess = true);
  }

  factory WelcomeState.error(String err) {
    return WelcomeState((b) => b
      ..error = err
      ..isSuccess = false);
  }
}
