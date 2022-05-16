import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/login/login_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer()
    ..registerInstance(http.Client())
    // api
    ..registerFactory((container) => PresensiAppBackendApi(container.resolve()))
    // provider
    ..registerFactory((container) => AuthProvider())
    // repository
    ..registerFactory(
        (container) => AuthRepository(container.resolve(), container.resolve()))
    // bloc
    ..registerFactory((container) => LoginBloc(container.resolve()));
}
