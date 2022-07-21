library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  bool get isLoading;
  PerkuliahanList get data;
  bool get isGetAuthFinished;
  bool? get isExpiredToken;
  bool get isTokenRenewed;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..isExpiredToken = null
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.loading() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = true
        ..isExpiredToken = null
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.error(String error) {
    return HomeState(
      (b) => b
        ..error = error
        ..isLoading = true
        ..isExpiredToken = null
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.success(PerkuliahanList data) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = true
        ..isExpiredToken = false
        ..isTokenRenewed = false
        ..data.replace(data),
    );
  }

  factory HomeState.auth(Auth auth) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = true
        ..isExpiredToken = null
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.authError(String error) {
    return HomeState(
      (b) => b
        ..error = error
        ..isLoading = true
        ..isExpiredToken = null
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.expiredToken() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..isExpiredToken = true
        ..isTokenRenewed = false
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }

  factory HomeState.renewToken(String accessToken) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..isExpiredToken = null
        ..isTokenRenewed = true
        ..data.replace(
          PerkuliahanList(
            (b) => b
              ..data.replace(BuiltList<PerkuliahanItem>())
              ..total = 0,
          ),
        ),
    );
  }
}
