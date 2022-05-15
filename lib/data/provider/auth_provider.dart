import 'package:flutter_presensi_mhs/data/model/local/auth.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AuthProvider extends BaseProvider {
  Future<void> saveAuth(Auth authdata) async {
    await db?.insert('auth', authdata.toMap());
  }
}
