import 'dart:convert';
import 'dart:io';

import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/login_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/logout_exception.dart';
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';
import 'package:http/http.dart' as http;

const BASE_API_URL = 'https://presensiapp.my.id/api/v1';

class PresensiAppBackendApi {
  final http.Client _client;

  PresensiAppBackendApi(this._client);

  // auth - login
  Future<Auth?> login({
    required String username,
    required String password,
  }) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + '/auth/login');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: {
        'username': username,
        'password': password,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return Auth.fromJson(response.body);
  }

  // auth - logout
  Future<String?> logout({
    required String accessToken,
    required String refreshToken,
  }) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + '/auth/logout');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
        'RefreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['message'];
  }

  // auth - renew access token
  Future<Auth?> renewAccessToken({required String refreshToken}) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + '/auth/renew-token');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {
        'RefreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return Auth.fromJson(response.body);
  }

  // list matakuliah hari ini
  Future<PerkuliahanList?> getPerkuliahanList(
      {required String accessToken}) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + 'perkuliahan');
    final response = await _client.get(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return PerkuliahanList.fromJson(response.body);
  }

  // todo: detail perkuliahan
  Future<PerkuliahanItem?> getDetailPerkuliahan({
    required String accessToken,
    required int perkuliahanId,
  }) async {
    final urlEncoded = Uri.encodeFull(BASE_API_URL + 'perkuliahan');
    final response = await _client.get(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return PerkuliahanItem.fromJson(response.body);
  }

  // todo: do presensi
  Future<void> doPresensi({required accessToken}) async {}

  // todo: list jadwal matkul
  Future<void> getAllJadwal({required accessToken}) async {}

  // todo: profile
  Future<void> getProfile({required accessToken}) async {}
}
