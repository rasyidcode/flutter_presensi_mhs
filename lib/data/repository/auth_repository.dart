import 'dart:ffi';

import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/exceptions/login_exception.dart';

class AuthRepository {
  PresensiAppBackendApi _presensiAppBackendApi;

  AuthRepository(this._presensiAppBackendApi);

  Future<void> login(String username, String password) async {
    final loginApiResult = await _presensiAppBackendApi.login(
      username: username,
      password: password,
    );

    if (loginApiResult == null) throw LoginException('Login api returns null');

    // todo: store the accessToken and refreshToken to database
  }
}
