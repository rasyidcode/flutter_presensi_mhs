import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_event.dart';
import 'package:flutter_presensi_mhs/ui/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  void getAuth() {
    add(GetAuth());
  }

  AuthBloc(this._authRepository) : super(AuthState.initial()) {
    on<GetAuth>((event, emit) async {
      emit(AuthState.loading());

      try {
        final auth = await _authRepository.getAuth();
        emit(AuthState.success(auth));
      } on NoAuthFoundException catch (e) {
        emit(AuthState.fail(e.message));
      } on Exception catch (_) {
        emit(AuthState.fail('Something went wrong'));
      }
    });
    on<RenewToken>((event, emit) {});
  }
}
