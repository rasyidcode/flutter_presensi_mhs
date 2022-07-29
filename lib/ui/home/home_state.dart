library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/presensi_result.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  bool get isLoading;
  bool? get isPresensiLoading;
  bool? get isPresensiSuccess;
  BuiltList<PerkuliahanItem?> get matkulData;
  PresensiResult? get presensiResult;
  int? get matkulTotal;
  bool get isError => error.isNotEmpty;
  bool get isSuccess =>
      error.isEmpty &&
      !isLoading &&
      matkulData.isNotEmpty &&
      (matkulTotal != null && matkulTotal != 0);
  bool? get isTokenExpired;
  String? get currentState;
  String? get currentCode;

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

  factory HomeState.loading({bool? isPresensiLoading}) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = true
        ..isPresensiLoading = isPresensiLoading
        ..matkulData.replace(BuiltList<PerkuliahanItem>()),
    );
  }

  factory HomeState.error(String error,
      {bool? tokenExpired, String? currentState, String? currentCode}) {
    return HomeState(
      (b) => b
        ..error = error
        ..isLoading = false
        ..isTokenExpired = tokenExpired
        ..currentState = currentState
        ..currentCode = currentCode
        ..matkulData.replace(BuiltList<PerkuliahanItem>()),
    );
  }

  factory HomeState.success(
      {BuiltList<PerkuliahanItem?>? data,
      int? totalData,
      bool? isPresensiLoading,
      PresensiResult? dataPresensi,
      String? currentCode}) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..matkulTotal = totalData
        ..isPresensiLoading = isPresensiLoading
        ..currentCode = currentCode
        ..matkulData.replace(data ?? BuiltList<PerkuliahanItem>())
        ..presensiResult.replace(dataPresensi ?? PresensiResult()),
    );
  }
}
