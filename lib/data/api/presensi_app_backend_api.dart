import 'dart:convert';
import 'dart:io';

import 'package:flutter_presensi_mhs/data/exceptions/login_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/logout_exception.dart';
import 'package:flutter_presensi_mhs/data/model/auth/login.dart';
import 'package:http/http.dart' as http;

const BASE_API_URL = 'https://presensiapp.my.id/api/v1';

class PresensiAppBackendApi {
  final http.Client _client;

  PresensiAppBackendApi(this._client);

  // auth - login
  Future<Login?> login({
    required String username,
    required String password,
  }) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + '/login');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw LoginException(jsonDecode(response.body)['message']);
    }
    // print(response.body);
    return Login.fromJson(response.body);
  }

  // auth - logout
  Future<String?> logout({
    required accessToken,
    required refreshToken,
  }) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + '/logout');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
        'RefreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw LogoutException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['message'];
  }

  // todo: auth - renew access token api

  // todo: list matakuliah hari ini api

  // todo: detail matkuliah api

  // todo: do presensi api

  // todo: list jadwal matkul api

  // todo: profile api
}
