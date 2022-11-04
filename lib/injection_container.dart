import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_mhs/data/provider/app_provider.dart';
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/data/repository/perkuliahan_repository.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_bloc.dart';
import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:flutter_presensi_mhs/ui/login/login_bloc.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_bloc.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';
import 'package:sqflite/sqflite.dart';

Future initKiwi() async {
  String dbPath = await getDatabasesPath();
  print('initiating dependency injection...');
  KiwiContainer()
    ..registerInstance(http.Client())
    ..registerFactory((container) => PresensiAppDb(dbPath))
    // api see
    ..registerFactory((container) => PresensiAppApi(container.resolve()))
    // provider
    ..registerFactory((container) => AppProvider(container.resolve()))
    ..registerFactory((container) => AuthProvider(container.resolve()))
    // repository
    ..registerFactory(
        (container) => AppRepository(container.resolve<AppProvider>()))
    ..registerFactory((container) =>
        AuthRepository(container.resolve(), container.resolve<AuthProvider>()))
    ..registerFactory((container) => PerkuliahanRepository(container.resolve()))
    // bloc
    ..registerFactory((container) => SplashBloc(container.resolve()))
    ..registerFactory((container) => AuthBloc(container.resolve()))
    ..registerFactory((container) => WelcomeBloc(container.resolve()))
    ..registerFactory((container) => LoginBloc(container.resolve()))
    ..registerFactory((container) => HomeBloc(container.resolve()));
}
