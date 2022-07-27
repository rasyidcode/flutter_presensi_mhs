library splash_state;

import 'package:built_value/built_value.dart';

part 'splash_state.g.dart';

abstract class SplashState implements Built<SplashState, SplashStateBuilder> {
  bool get isLoading;
  String get error;
  bool? get isFirstTime;
  String get stateMessage;
  bool get hideStateMessage;

  bool get isError => error.isEmpty;

  SplashState._();

  factory SplashState([Function(SplashStateBuilder b) updates]) = _$SplashState;

  factory SplashState.initial() {
    return SplashState((b) => b
      ..isLoading = false
      ..error = ''
      ..hideStateMessage = false
      ..stateMessage = '');
  }

  factory SplashState.loading(String message) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..hideStateMessage = false
      ..stateMessage = message);
  }

  factory SplashState.fail(String errorMsg,
      {bool? isFirstTime, bool? dbInitiated}) {
    return SplashState((b) => b
      ..isLoading = false
      ..error = errorMsg
      ..isFirstTime = isFirstTime
      ..hideStateMessage = false
      ..stateMessage = '');
  }

  factory SplashState.success(String message,
      {bool? dbInitiated, bool? isFirstTime, bool? hideStateMsg}) {
    return SplashState((b) => b
      ..isLoading = true
      ..error = ''
      ..isFirstTime = isFirstTime
      ..hideStateMessage = hideStateMsg ?? false
      ..stateMessage = message);
  }
}
