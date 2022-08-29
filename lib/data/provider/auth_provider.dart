import 'dart:developer';

import 'package:built_collection/built_collection.dart';
import 'package:flutter_presensi_mhs/data/db/presensi_app_db.dart';
import 'package:flutter_presensi_mhs/data/exceptions/no_auth_found_exception.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AuthProvider extends BaseProvider {
  final PresensiAppDb _presensiAppDb;

  AuthProvider(this._presensiAppDb);

  Future<void> updateToken(Auth authdata) async {
    int? count = await (await _presensiAppDb.db)?.update(
        'auth', authdata.toMap(),
        where: 'id = ?', whereArgs: [authdata.id]);
    log('${(AuthProvider).toString()} - update token:$count');
  }

  Future<void> removeAuth() async {
    await (await _presensiAppDb.db)?.rawDelete('DELETE FROM auth');
  }

  Future<void> saveAuth(Auth authdata) async {
    int? result =
        await (await _presensiAppDb.db)?.insert('auth', authdata.toMap());
    log('${(AuthProvider).toString()} - save auth:$result');
  }

  Future<Auth> getAuth() async {
    final auth = await (await _presensiAppDb.db)
        ?.rawQuery('SELECT * FROM auth ORDER BY id DESC LIMIT 1');

    log('${(AuthProvider).toString()} - get auth:$auth');

    if (auth == null) {
      throw NoAuthFoundException('Auth not found', 'null');
    }

    if (auth.isEmpty) {
      throw NoAuthFoundException('Auth is empty', 'empty');
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
}
