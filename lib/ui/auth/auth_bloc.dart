import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/repository_error_exception.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local;
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_event.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  void getAuth() {
    add(GetAuth());
  }

  void renewToken(local.Auth auth) {
    add(RenewToken((b) => b..auth.replace(auth)));
  }

  void logout(local.Auth auth) {
    add(DoLogout((b) => b
      ..accessToken = auth.accessToken
      ..refreshToken = auth.refreshToken));
  }

  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(AuthState.loading(stateMsg: 'Getting auth...', isLoading: true));

      try {
        final auth = await _authRepository.getAuth();
        emit(AuthState.success(auth,
            stateMsg: 'Auth exist', isDoneGetAuth: true));
      } on NoAuthFoundException catch (e) {
        emit(AuthState.fail(e.message, stateMsg: 'No auth found'));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong'));
      }
    });
    on<RenewToken>((event, emit) async {
      emit(AuthState.loading(isLoading: true));

      try {
        final auth = await _authRepository.renewToken(event.auth);
        emit(AuthState.success(auth, isDoneRenewToken: true));
      } on ApiAccessErrorException catch (e) {
        emit(AuthState.fail(e.message));
      } on RepositoryErrorException catch (e) {
        emit(AuthState.fail(e.message));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong'));
      }
    });
    on<DoLogout>((event, emit) async {
      emit(AuthState.loading(isLoading: false, isLoadingLogout: true));

      try {
        final res =
            await _authRepository.logout(event.accessToken, event.refreshToken);
        log('logout res: $res');
        emit(AuthState.success(state.auth, isSuccessLogout: true));
      } on ApiAccessErrorException catch (e) {
        emit(AuthState.fail(e.message, isSuccessLogout: false));
      } on RepositoryErrorException catch (e) {
        emit(AuthState.fail(e.message, isSuccessLogout: false));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong', isSuccessLogout: false));
      }
    });
  }
}
