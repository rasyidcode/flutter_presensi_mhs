import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_error_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_event.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRepository _appRepository;

  void initDB() {
    add(InitDB());
  }

  void checkFirstTime() {
    add(CheckFirstTime());
  }

  SplashBloc(this._appRepository) : super(SplashState.initial()) {
    on<InitDB>((event, emit) async {
      emit(SplashState.loading('Initiating DB...'));

      // delay 3 sec
      await Future.delayed(const Duration(seconds: 3), () => {});

      try {
        await _appRepository.initAppProvider();
        emit(SplashState.success('DB Initiated...', dbInitiated: true));
      } on Exception catch (_) {
        emit(SplashState.fail('Init DB Failed'));
      }
    });
    on<CheckFirstTime>((event, emit) async {
      emit(SplashState.loading('Checking first time login...'));

      // delay 3 sec
      await Future.delayed(const Duration(seconds: 3), () => {});

      try {
        bool isFirstTime = await _appRepository.checkFirstTime();
        emit(SplashState.success('message', isFirstTime: isFirstTime));
      } on ProviderErrorException catch (e) {
        emit(SplashState.fail(e.message, isFirstTime: true));
      } on Exception catch (_) {
        emit(SplashState.fail('Something went wrong'));
      }
    });
  }
}
