import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/repository_error_exception.dart';
import 'package:flutter_presensi_mhs/data/repository/perkuliahan_repository.dart';
import 'package:flutter_presensi_mhs/ui/home/home_event.dart';
import 'package:flutter_presensi_mhs/ui/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PerkuliahanRepository _perkuliahanRepository;

  void getListMatkul(String accessToken) {
    add(GetListMatkul((b) => b..accessToken = accessToken));
  }

  void doPresensi(String accessToken, String code, String idJadwal) {
    add(DoPresensi((b) => b
      ..code = code
      ..accessToken = accessToken
      ..idJadwal = idJadwal));
  }

  void checkPerkuliahan(String accessToken, String idJadwal) {
    add(CheckPerkuliahan((b) => b
      ..accessToken = accessToken
      ..idJadwal = idJadwal));
  }

  HomeBloc(this._perkuliahanRepository) : super(HomeState.initial()) {
    on<GetListMatkul>((event, emit) async {
      emit(HomeState.loading(isLoading: true));

      try {
        final result =
            await _perkuliahanRepository.getListMatkul(event.accessToken);
        emit(HomeState.success(data: result.data, totalData: result.total));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(e.message, currentState: 'get_list_matkul'));
      } on ApiExpiredTokenException catch (e) {
        emit(HomeState.error(e.message,
            tokenExpired: true, currentState: 'get_list_matkul'));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(e.message, currentState: 'get_list_matkul'));
      } on Exception catch (_) {
        emit(HomeState.error('Something went wrong',
            currentState: 'get_list_matkul'));
      }
    });
    on<DoPresensi>((event, emit) async {
      emit(HomeState.loading(
          isPresensiLoading: true, matkulData: state.matkulData));

      try {
        final result = await _perkuliahanRepository.doPresensi(
            event.accessToken, event.code, event.idJadwal);
        emit(HomeState.success(
            data: state.matkulData,
            totalData: state.matkulTotal,
            dataPresensi: result,
            currentCode: event.code,
            idJadwal: event.idJadwal));
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(e.message,
            currentState: 'do_presensi',
            currentCode: event.code,
            matkulData: state.matkulData,
            idJadwal: event.idJadwal));
      } on ApiExpiredTokenException catch (e) {
        emit(HomeState.error(e.message,
            tokenExpired: true,
            currentState: 'do_presensi',
            currentCode: event.code,
            idJadwal: event.idJadwal));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(e.message,
            currentState: 'do_presensi',
            currentCode: event.code,
            matkulData: state.matkulData,
            idJadwal: event.idJadwal));
      } on Exception catch (_) {
        emit(HomeState.error('Something went wrong',
            currentState: 'do_presensi',
            currentCode: event.code,
            matkulData: state.matkulData,
            idJadwal: event.idJadwal));
      }
    });
    on<DoLogout>((event, emit) {});
    on<CheckPerkuliahan>((event, emit) async {
      emit(HomeState.loading(
        isLoading: false,
        matkulData: state.matkulData,
        isDoneCheckPresensi: false,
      ));

      try {
        final result = await _perkuliahanRepository.checkPerkuliahan(
          event.accessToken,
          event.idJadwal,
        );
        if (result != null) {
          emit(HomeState.success(
              data: state.matkulData,
              totalData: state.matkulTotal,
              idJadwal: event.idJadwal,
              isDoneCheckPresensi: true,
              isSuccessCheckPresensi: true));
        } else {
          emit(HomeState.error('Result is empty',
              currentState: 'check_presensi',
              matkulData: state.matkulData,
              idJadwal: event.idJadwal,
              isDoneCheckPresensi: true,
              isSuccessCheckPresensi: false));
        }
      } on ApiAccessErrorException catch (e) {
        emit(HomeState.error(e.message,
            currentState: 'check_presensi',
            matkulData: state.matkulData,
            idJadwal: event.idJadwal,
            isDoneCheckPresensi: true,
            isSuccessCheckPresensi: false));
      } on ApiExpiredTokenException catch (e) {
        emit(HomeState.error(e.message,
            tokenExpired: true,
            currentState: 'check_presensi',
            matkulData: state.matkulData,
            idJadwal: event.idJadwal,
            isDoneCheckPresensi: true,
            isSuccessCheckPresensi: false));
      } on RepositoryErrorException catch (e) {
        emit(HomeState.error(e.message,
            currentState: 'check_presensi',
            matkulData: state.matkulData,
            idJadwal: event.idJadwal,
            isDoneCheckPresensi: true,
            isSuccessCheckPresensi: false));
      } on Exception catch (_) {
        emit(HomeState.error(
          'Something went wrong',
          currentState: 'check_presensi',
          matkulData: state.matkulData,
          idJadwal: event.idJadwal,
          isSuccessCheckPresensi: false,
          isDoneCheckPresensi: true,
        ));
      }
    });
  }

  String getCurrentDate() {
    var now = DateTime.now();
    var month = '';
    switch (now.month) {
      case 1:
        month = 'Januari';
        break;
      case 2:
        month = 'Februari';
        break;
      case 3:
        month = 'Maret';
        break;
      case 4:
        month = 'April';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Juni';
        break;
      case 7:
        month = 'Juli';
        break;
      case 8:
        month = 'Agustus';
        break;
      case 9:
        month = 'September';
        break;
      case 10:
        month = 'Oktober';
        break;
      case 11:
        month = 'November';
        break;
      case 12:
        month = 'Desember';
        break;
      default:
        month = 'undefined';
        break;
    }

    var day = '';
    switch (now.weekday) {
      case 1:
        day = 'Senin';
        break;
      case 2:
        day = 'Selasa';
        break;
      case 3:
        day = 'Rabu';
        break;
      case 4:
        day = 'Kamis';
        break;
      case 5:
        day = 'Jum\'at';
        break;
      case 6:
        day = 'Sabtu';
        break;
      case 7:
        day = 'Minggu';
        break;
    }
    return '$day, ${now.day} $month ${now.year}';
  }
}

class DrawerData {
  final String id;
  final String name;
  DrawerData(this.id, this.name);
}
