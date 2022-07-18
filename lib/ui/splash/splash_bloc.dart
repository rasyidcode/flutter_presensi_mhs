import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/first_time_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_event.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AppRepository _appRepository;
  final AuthRepository _authRepository;

  SplashBloc(this._appRepository, this._authRepository)
      : super(SplashState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(SplashState.loading());

      try {
        final auth = await _authRepository.getAuth();
        emit(SplashState.loggedIn(auth));
      } on NoAuthFoundException catch (_) {
        try {
          final ft = await _appRepository.getFirstTime();
          emit(SplashState.firstTime(ft == 1 ? false : true));
        } on FirstTimeException catch (_) {
          emit(SplashState.firstTime(true));
        } on Exception catch (_) {
          emit(SplashState.error('Something went wrong'));
        }
      } on Exception catch (_) {
        emit(SplashState.error('Something went wrong'));
      }
    });
  }
}
