import 'package:flutter_presensi_mhs/data/exceptions/first_time_exception.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AppProvider extends BaseProvider {
  Future<int> getFirstTime() async {
    final firstTime =
        await db?.rawQuery('SELECT * FROM firstTime ORDER BY id DESC LIMIT 1');

    if (firstTime == null) {
      throw FirstTimeException();
    }

    if (firstTime.isEmpty) {
      throw FirstTimeException();
    }

    return firstTime.first['firstTime'] as int;
  }

  Future<void> flagFirstTime() async {
    await db?.insert('firstTime', {
      'firstTime': 1,
      'createdAt': DateTime.now().millisecondsSinceEpoch ~/ 1000
    });
  }
}
