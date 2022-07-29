library home_event;

import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

abstract class GetListMatkul extends HomeEvent
    implements Built<GetListMatkul, GetListMatkulBuilder> {
  GetListMatkul._();

  String get accessToken;

  factory GetListMatkul([Function(GetListMatkulBuilder b) updates]) =
      _$GetListMatkul;
}

abstract class DoPresensi extends HomeEvent
    implements Built<DoPresensi, DoPresensiBuilder> {
  String get code;
  String get accessToken;

  DoPresensi._();

  factory DoPresensi([Function(DoPresensiBuilder b) updates]) = _$DoPresensi;
}

class DoLogout extends HomeEvent {}
