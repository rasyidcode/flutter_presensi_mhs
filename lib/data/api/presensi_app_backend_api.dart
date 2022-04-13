import 'dart:convert';
import 'dart:io';

import 'package:flutter_presensi_mhs/data/exceptions/sign_in_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/sign_out_exception.dart';
import 'package:flutter_presensi_mhs/data/model/auth/sign_in.dart';
import 'package:http/http.dart' as http;

class PresensiAppBackendApi {
  final http.Client _client;
  final String _baseUrl = 'http://192.168.1.6/api/v1';

  PresensiAppBackendApi(this._client);

  // auth - sign in
  Future<SignIn?> signIn({
    required String username,
    required String password,
  }) async {
    final urlEncoded = Uri.encodeFull(_baseUrl + '/signIn');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw SignInException(jsonDecode(response.body)['message']);
    }

    return SignIn.fromJson(response.body);
  }

  // auth - sign out
  Future<void> signOut({
    required accessToken,
    required refreshToken,
  }) async {
    final urlEncoded = Uri.encodeFull(_baseUrl + '/signOut');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
        'RefreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw SignOutException(jsonDecode(response.body)['message']);
    }
  }

  // todo: auth - renew access token api

  // todo: list matakuliah hari ini api

  // todo: detail matkuliah api

  // todo: do presensi api

  // todo: list jadwal matkul api

  // todo: profile api
}
