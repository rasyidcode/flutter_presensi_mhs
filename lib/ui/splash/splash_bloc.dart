import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/first_time_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_empty_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_null_exception.dart';
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_event.dart';
import 'package:flutter_presensi_mhs/ui/splash/splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthProvider _authProvider;

  SplashBloc(this._authProvider) : super(SplashState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(SplashState.loading());

      try {
        final auth = await _authProvider.getAuth();
        emit(SplashState.loggedIn(auth));
      } on NoAuthFoundException catch (_) {
        emit(SplashState.noAuthFound());
      } on Exception catch (_) {
        emit(SplashState.error('Something went wrong'));
      }
    });
    on<GetFirstTime>((event, emit) async {
      emit(SplashState.loading());

      try {
        final ft = await _authProvider.getFirstTime();
        emit(SplashState.firstTime(ft == 1));
      } on FirstTimeException catch (_) {
        emit(SplashState.firstTime(false));
      } on Exception catch (_) {
        emit(SplashState.error('Something went wrong'));
      }
    });
  }
}
