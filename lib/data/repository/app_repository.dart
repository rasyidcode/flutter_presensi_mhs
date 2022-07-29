import 'package:flutter_presensi_mhs/data/provider/app_provider.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AppRepository {
  final BaseProvider _provider;

  AppRepository(this._provider);

  Future<bool> checkFirstTime() async {
    return await (_provider as AppProvider).checkFirstTime();
  }

  Future<void> flagFirstTime() async {
    await (_provider as AppProvider).flagFirstTime();
  }
}
