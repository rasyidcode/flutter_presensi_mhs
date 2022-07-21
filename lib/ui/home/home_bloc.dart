import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/bloc_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_error_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/data/repository/perkuliahan_repository.dart';
import 'package:flutter_presensi_mhs/ui/home/home_event.dart';
import 'package:flutter_presensi_mhs/ui/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PerkuliahanRepository _perkuliahanRepository;
  final AuthRepository _authRepository;

  void initGetAuth() {
    add(GetAuth());
  }

  void getListMatkul() {
    add(GetListMatkul());
  }

  HomeBloc(this._perkuliahanRepository, this._authRepository)
      : super(HomeState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(HomeState.loading());

      try {
        final auth = await _authRepository.getAuth();
        // _auth = auth;

        emit(HomeState.auth(auth));
      } on NoAuthFoundException catch (e) {
        emit(HomeState.error(e.message));
      } on Exception catch (_) {
        emit(HomeState.error('Something went wrong'));
      }
    });
    on<GetListMatkul>((event, emit) async {
      emit(HomeState.loading());
      // delay 3 sec
      await Future.delayed(const Duration(seconds: 3), () => {});

      // if (_auth == null) {
      //   throw BlocErrorException('Auth is null');
      // }

      // String? accessToken = _auth!.accessToken;
      // if (accessToken == null) {
      //   throw BlocErrorException('Access token null');
      // }

      // try {
      //   final data = await _perkuliahanRepository.getData(accessToken);
      //   emit(HomeState.success(data));
      // } on ApiExpiredTokenException catch (_) {
      //   emit(HomeState.expiredToken());
      // } on ApiAccessErrorException catch (e) {
      //   emit(HomeState.error(e.message));
      // } on ProviderException catch (e) {
      //   emit(HomeState.error(e.message));
      // } on BlocErrorException catch (e) {
      //   emit(HomeState.error(e.message));
      // } on Exception catch (_) {
      //   emit(HomeState.error('Something went wrong'));
      // }
    });
    on<DoPresensi>((event, emit) {});
    on<DoLogout>((event, emit) {});
    on<RenewToken>((event, emit) async {
      emit(HomeState.loading());

      // if (_auth == null) {
      //   throw BlocErrorException('Auth is null');
      // }

      // String? accessToken = _auth!.accessToken;
      // if (accessToken == null) {
      //   throw BlocErrorException('Access token null');
      // }

      // try {
      //   String newAccessToken = await _authRepository.renewToken(_auth!);
      //   emit(HomeState.renewToken(newAccessToken));
      // } on NoAuthFoundException catch (e) {
      //   emit(HomeState.error(e.message));
      // } on Exception catch (_) {
      //   emit(HomeState.error('Something went wrong'));
      // }
    });
  }
}

class DrawerData {
  final String id;
  final String name;
  DrawerData(this.id, this.name);
}
