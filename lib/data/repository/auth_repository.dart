import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/exceptions/login_null_result_exception.dart';
import 'package:flutter_presensi_mhs/data/model/local/auth.dart' as local;
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart' as api;
import 'package:flutter_presensi_mhs/data/provider/auth_provider.dart';
import 'package:flutter_presensi_mhs/data/provider/base_provider.dart';

class AuthRepository {
  final PresensiAppApi _presensiAppApi;
  final BaseProvider _provider;

  AuthRepository(this._presensiAppApi, this._provider);

  Future<api.Auth> login(String username, String password) async {
    final loginApiResult = await _presensiAppApi.login(
      username: username,
      password: password,
    );

    if (loginApiResult == null) {
      throw LoginNullResultException('Login api returns null');
    }
    await (_provider as AuthProvider).saveAuth(local.Auth((b) => b
      ..id = null
      ..accessToken = loginApiResult.accessToken
      ..refreshToken = loginApiResult.refreshToken
      ..createdAt = DateTime.now().millisecondsSinceEpoch ~/ 1000));
    return loginApiResult;
  }

  Future<String?> logout(String accessToken, String refreshToken) async {
    final logoutResult = await _presensiAppApi.logout(
      accessToken: accessToken,
      refreshToken: refreshToken,
    );
    return logoutResult;
  }

  Future<String?> renewToken(String refreshToken) async {
    final accessToken =
        await _presensiAppApi.renewAccessToken(refreshToken: refreshToken);
    var auth = await (_provider as AuthProvider).getAuth();
    auth.rebuild((b) => b..accessToken = accessToken);
    await (_provider as AuthProvider).updateToken(auth);

    return accessToken;
  }

  Future<local.Auth> getAuth() async {
    return await (_provider as AuthProvider).getAuth();
  }
}
