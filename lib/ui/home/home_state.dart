library home_state;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/presensi_result.dart';

part 'home_state.g.dart';

abstract class HomeState implements Built<HomeState, HomeStateBuilder> {
  String get error;
  bool? get isLoading;
  bool? get isPresensiLoading;
  bool? get isPresensiSuccess;
  BuiltList<PerkuliahanItem?> get matkulData;
  PresensiResult? get presensiResult;
  int? get matkulTotal;
  bool get isError => error.isNotEmpty;
  bool get isSuccess =>
      error.isEmpty &&
      isLoading != null &&
      !isLoading! &&
      matkulData.isNotEmpty &&
      (matkulTotal != null && matkulTotal != 0);
  bool? get isTokenExpired;
  String? get currentState;
  String? get currentCode;
  String? get currentIdJadwal;

  HomeState._();

  factory HomeState([Function(HomeStateBuilder b) updates]) = _$HomeState;

  factory HomeState.initial() {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..matkulData.replace(BuiltList<PerkuliahanItem>())
        ..presensiResult.replace(PresensiResult((b) => b
          ..message = ''
          ..statusPresensi = '')),
    );
  }

  factory HomeState.loading(
      {bool? isLoading,
      bool? isPresensiLoading,
      BuiltList<PerkuliahanItem?>? matkulData}) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = isLoading
        ..isPresensiLoading = isPresensiLoading
        ..matkulData.replace(matkulData ?? BuiltList<PerkuliahanItem>())
        ..presensiResult.replace(PresensiResult((b) => b
          ..message = ''
          ..statusPresensi = '')),
    );
  }

  factory HomeState.error(String error,
      {bool? tokenExpired,
      String? currentState,
      String? currentCode,
      BuiltList<PerkuliahanItem?>? matkulData,
      String? idJadwal}) {
    return HomeState(
      (b) => b
        ..error = error
        ..isLoading = false
        ..isTokenExpired = tokenExpired
        ..currentState = currentState
        ..currentCode = currentCode
        ..currentIdJadwal = idJadwal
        ..matkulData.replace(matkulData ?? BuiltList<PerkuliahanItem>())
        ..presensiResult.replace(PresensiResult((b) => b
          ..message = ''
          ..statusPresensi = '')),
    );
  }

  factory HomeState.success(
      {BuiltList<PerkuliahanItem?>? data,
      int? totalData,
      bool? isPresensiLoading,
      PresensiResult? dataPresensi,
      String? currentCode,
      String? idJadwal}) {
    return HomeState(
      (b) => b
        ..error = ''
        ..isLoading = false
        ..matkulTotal = totalData
        ..isPresensiLoading = isPresensiLoading
        ..currentCode = currentCode
        ..currentIdJadwal = idJadwal
        ..matkulData.replace(data ?? BuiltList<PerkuliahanItem>())
        ..presensiResult.replace(dataPresensi ??
            PresensiResult((b) => b
              ..message = ''
              ..statusPresensi = '')),
    );
  }
}
