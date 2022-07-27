library home_event;

import 'package:built_value/built_value.dart';

part 'home_event.g.dart';

abstract class HomeEvent {}

class DoPresensi extends HomeEvent {}

abstract class GetListMatkul extends HomeEvent
    implements Built<GetListMatkul, GetListMatkulBuilder> {
  GetListMatkul._();

  String get accessToken;

  factory GetListMatkul([Function(GetListMatkulBuilder b) updates]) =
      _$GetListMatkul;
}

class GetAuth extends HomeEvent {}

class DoLogout extends HomeEvent {}

class RenewToken extends HomeEvent {}
