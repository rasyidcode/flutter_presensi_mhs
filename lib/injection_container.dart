import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/db/presensi_app_db.dart';
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
    ..registerSingleton((container) => PresensiAppDb())
    // api
    ..registerFactory((container) => PresensiAppApi(container.resolve()))
    // provider
    ..registerFactory((container) => AppProvider(container.resolve()))
    ..registerFactory((container) => AuthProvider(container.resolve()))
    // repository
    ..registerFactory(
        (container) => AppRepository(container.resolve<AppProvider>()))
    ..registerFactory((container) =>
        AuthRepository(container.resolve(), container.resolve<AuthProvider>()))
    // bloc
    ..registerFactory(
        (container) => SplashBloc(container.resolve(), container.resolve()))
    ..registerFactory((container) => WelcomeBloc(container.resolve()))
    ..registerFactory((container) => LoginBloc(container.resolve()));
}
