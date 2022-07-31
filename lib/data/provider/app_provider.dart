import 'dart:developer';

import 'package:flutter_presensi_mhs/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_mhs/data/exceptions/first_time_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_error_exception.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AppProvider extends BaseProvider {
  final PresensiAppDb _presensiAppDb;

  AppProvider(this._presensiAppDb);

  // Future initDatabase() async {
  //   await _presensiAppDb.initDB();
  // }

  Future<bool> checkFirstTime() async {
    final data = await (await _presensiAppDb.db)
        ?.rawQuery('SELECT COUNT(*) as total FROM firstTime');
    log('${(AppProvider).toString()} - check first time:$data');

    if (data == null) {
      throw ProviderErrorException('Query returns null');
    }

    if (data.isEmpty) {
      throw ProviderErrorException('Query returns empty');
    }

    var totalData = data.first['total'];
    if (totalData == null) {
      throw ProviderErrorException('Query is error');
    }

    int total = totalData as int;
    return total <= 0;
  }

  Future<void> flagFirstTime() async {
    final result = await (await _presensiAppDb.db)?.insert('firstTime', {
      'firstTime': 1,
      'createdAt': DateTime.now().millisecondsSinceEpoch ~/ 1000
    });
    log('${(AppProvider).toString()} - flag first time:$result');
  }
}
