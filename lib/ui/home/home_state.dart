library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  bool get isLoading;
  BuiltList<PerkuliahanItem?> get matkulData;
  int? get matkulTotal;
  bool get isError => error.isNotEmpty;
  bool get isSuccess =>
      error.isEmpty &&
      !isLoading &&
      matkulData.isNotEmpty &&
      (matkulTotal != null && matkulTotal != 0);
  bool? get isTokenExpired;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..matkulData.replace(BuiltList<PerkuliahanItem>()),
    );
  }

  factory HomeState.loading() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = true
        ..matkulData.replace(BuiltList<PerkuliahanItem>()),
    );
  }

  factory HomeState.error(String error, {bool? tokenExpired}) {
    return HomeState(
      (b) => b
        ..error = error
        ..isLoading = false
        ..isTokenExpired = tokenExpired
        ..matkulData.replace(BuiltList<PerkuliahanItem>()),
    );
  }

  factory HomeState.success(BuiltList<PerkuliahanItem?> data,
      {int? totalData}) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..matkulTotal = totalData
        ..matkulData.replace(data),
    );
  }
}
