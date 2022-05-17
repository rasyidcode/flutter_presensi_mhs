import 'package:built_collection/built_collection.dart';
import 'package:flutter_presensi_mhs/data/exceptions/first_time_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_empty_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/provider_null_exception.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AuthProvider extends BaseProvider {
  Future<void> saveAuth(Auth authdata) async {
    await db?.insert('auth', authdata.toMap());
  }

  Future<Auth> getAuth() async {
    final auth =
        await db?.rawQuery('SELECT * FROM auth ORDER BY id DESC LIMIT 1');
    if (auth == null) {
      throw NoAuthFoundException();
    }

    if (auth.isEmpty) {
      throw NoAuthFoundException();
    }

    final auths = auth
        .map((a) => Auth((b) => b
          ..id = a['id'] as int
          ..accessToken = a['accessToken'] as String
          ..refreshToken = a['refreshToken'] as String
          ..createdAt = a['createdAt'] as int))
        .toBuiltList();

    return auths[0];
  }

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
}
