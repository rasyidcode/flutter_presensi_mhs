import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_error_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_event.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRepository _appRepository;

  void checkFirstTime() {
    add(CheckFirstTime());
  }

  SplashBloc(this._appRepository) : super(SplashState.initial()) {
    on<CheckFirstTime>((event, emit) async {
      emit(SplashState.loading('Checking first time login...'));

      try {
        bool isFirstTime = await _appRepository.checkFirstTime();
        log('splash_bloc|isFirstTime:$isFirstTime', time: DateTime.now());
        emit(SplashState.success(
            isFirstTime
                ? 'This is your first time...'
                : 'Not your first time...',
            isFirstTime: isFirstTime,
            hideStateMsg: true));
      } on ProviderErrorException catch (e) {
        log('splash_bloc|isFirstTime:true', time: DateTime.now());
        emit(SplashState.fail(e.message, isFirstTime: true));
      } on Exception catch (_) {
        emit(SplashState.fail('Something went wrong'));
      }
    });
  }
}
