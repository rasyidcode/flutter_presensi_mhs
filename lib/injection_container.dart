import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/provider/app_provider.dart';
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/login/login_bloc.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_bloc.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';

void initKiwi() {
  KiwiContainer()
    ..registerInstance(http.Client())
    // api
    ..registerFactory((container) => PresensiAppBackendApi(container.resolve()),
        name: 'api')
    // provider
    ..registerFactory((container) => AppProvider(), name: 'app_pro')
    ..registerFactory((container) => AuthProvider(), name: 'auth_pro')
    // repository
    ..registerFactory(
        (container) => AppRepository(container.resolve('app_pro')),
        name: 'app_repo')
    ..registerFactory(
        (container) => AuthRepository(
            container.resolve('api'), container.resolve('auth_pro')),
        name: 'auth_repo')
    // bloc
    ..registerFactory((container) => LoginBloc(container.resolve('auth_pro')))
    ..registerFactory((container) => SplashBloc(
        container.resolve('app_repo'), container.resolve('auth_repo')))
    ..registerFactory(
        (container) => WelcomeBloc(container.resolve('app_repo')));
}
