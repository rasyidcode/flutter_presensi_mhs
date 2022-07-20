import 'package:flutter_presensi_mhs/data/provider/app_provider.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AppRepository {
  final BaseProvider _provider;

  AppRepository(this._provider);

  Future initAppProvider() async {
    await (_provider as AppProvider).initDatabase();
  }

  Future<int> getFirstTime() async {
    final firstTime = await (_provider as AppProvider).getFirstTime();

    return firstTime;
  }

  Future<void> createFirstTime() async {
    await (_provider as AppProvider).flagFirstTime();
  }
}
