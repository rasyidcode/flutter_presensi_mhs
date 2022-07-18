import 'package:flutter_presensi_mhs/data/provider/app_provider.dart';

class AppRepository {
  final AppProvider _appProvider;

  AppRepository(this._appProvider) : super() {
    _appProvider.open();
  }

  Future<int> getFirstTime() async {
    final firstTime = await _appProvider.getFirstTime();

    return firstTime;
  }

  Future<void> createFirstTime() async {
    await _appProvider.flagFirstTime();
  }
}
