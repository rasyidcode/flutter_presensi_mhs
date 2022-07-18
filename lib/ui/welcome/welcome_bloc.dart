import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/repository/app_repository.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_event.dart';
import 'package:flutter_presensi_mhs/ui/welcome/welcome_state.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  final AppRepository _appRepository;

  WelcomeBloc(this._appRepository) : super(WelcomeState.initial()) {
    on<CreateFirstTime>((event, emit) async {
      try {
        await _appRepository.createFirstTime();
        emit(WelcomeState.success());
      } on Exception catch (_) {
        emit(WelcomeState.error('Something went wrong'));
      }
    });
  }
}
