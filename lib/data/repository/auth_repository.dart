import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/exceptions/login_null_result_exception.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local;
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart' as api;
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';

class AuthRepository {
  final PresensiAppBackendApi _presensiAppBackendApi;
  final AuthProvider _authProvider;

  AuthRepository(this._presensiAppBackendApi, this._authProvider) : super() {
    _authProvider.open();
  }

  Future<api.Auth> login(String username, String password) async {
    final loginApiResult = await _presensiAppBackendApi.login(
      username: username,
      password: password,
    );

    if (loginApiResult == null) {
      throw LoginNullResultException('Login api returns null');
    }

    _authProvider.saveAuth(local.Auth((b) => b
      ..id = null
      ..accessToken = loginApiResult.accessToken
      ..refreshToken = loginApiResult.refreshToken
      ..createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000));

    return loginApiResult;
  }

  Future<String?> logout(String accessToken, String refreshToken) async {
    final logoutResult = await _presensiAppBackendApi.logout(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    return logoutResult;
  }

  Future<String?> renewToken(String refreshToken) async {
    final accessToken = await _presensiAppBackendApi.renewAccessToken(
        refreshToken: refreshToken);
    var auth = await _authProvider.getAuth();
    auth.rebuild((b) => b..accessToken = accessToken);
    _authProvider.updateToken(auth);

    return accessToken;
  }

  Future<local.Auth> getAuth() async {
    return await _authProvider.getAuth();
  }
}
