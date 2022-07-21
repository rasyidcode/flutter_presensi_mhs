import 'dart:convert';
import 'dart:io';

import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_expired_token_exception.dart';
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_item.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';
import 'package:http/http.dart' as http;

const baseApiURL = 'https://presensiapp.my.id/api/v1';

class PresensiAppApi {
  final http.Client _client;

  PresensiAppApi(this._client);

  // auth - login
  Future<Auth?> login({
    required String username,
    required String password,
  }) async {
    final response = await _client.post(
      Uri.parse(baseApiURL + '/auth'),
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
    final urlEncoded = Uri.encodeFull(baseApiURL + '/auth/logout');
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
  Future<String?> renewAccessToken({required String refreshToken}) async {
    final urlEncoded = Uri.encodeFull(baseApiURL + '/auth/renew-token');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {
        'RefreshToken': refreshToken,
      },
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['access_token'];
  }

  // list matakuliah hari ini
  Future<PerkuliahanList?> getPerkuliahanList(
      {required String accessToken}) async {
    final urlEncoded = Uri.encodeFull(baseApiURL + '/perkuliahan');
    final response = await _client.get(
      Uri.parse(urlEncoded),
      headers: {
        HttpHeaders.authorizationHeader: accessToken,
      },
    );

    if (response.statusCode != 200) {
      if (response.statusCode == 401) {
        String? decoded = jsonDecode(response.body)['message'];
        if (decoded == null) {
          throw ApiAccessErrorException('Message param doesnt exist');
        }

        if (decoded.contains('Expired token')) {
          throw ApiExpiredTokenException('Token is expired');
        }
      } else {
        throw ApiAccessErrorException(jsonDecode(response.body)['message']);
      }
    }

    return PerkuliahanList.fromJson(response.body);
  }

  // detail perkuliahan
  Future<PerkuliahanItem?> getDetailPerkuliahan({
    required String accessToken,
    required int perkuliahanId,
  }) async {
    final urlEncoded =
        Uri.encodeFull(baseApiURL + '/perkuliahan/$perkuliahanId');
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

  Future<String?> doPresensi({
    required String accessToken,
    required String qrcode,
  }) async {
    final urlEncoded = Uri.encodeFull(baseApiURL + '/perkuliahan/do-presensi');
    final response = await _client.post(
      Uri.parse(urlEncoded),
      headers: {HttpHeaders.authorizationHeader: accessToken},
      body: {'qrsecret': qrcode},
    );

    if (response.statusCode != 200) {
      throw ApiAccessErrorException(jsonDecode(response.body)['message']);
    }

    return jsonDecode(response.body)['status_presensi'];
  }
}
