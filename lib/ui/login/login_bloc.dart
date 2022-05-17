import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/login_null_result_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/auth_repository.dart';
import 'package:flutter_presensi_mhs/ui/login/login_event.dart';
import 'package:flutter_presensi_mhs/ui/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  String username = '';
  String password = '';

  LoginBloc(this._authRepository) : super(LoginState.initial()) {
    on<DoLogin>((event, emit) async {
      emit(LoginState.loading());

      try {
        var loginResult = await _authRepository.login(username, password);
        emit(LoginState.success(loginResult));
      } on ApiAccessErrorException catch (e) {
        emit(LoginState.error(e.message));
      } on LoginNullResultException catch (e) {
        emit(LoginState.error(e.message));
      } on Exception catch (_) {
        emit(LoginState.error('Something went wrong'));
      }
    });
  }
}
