import 'dart:io';

import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/model/auth/auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'presensi_app_backend_api_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  String fixtures(String name) =>
      File('test/data/fixtures/$name.json').readAsStringSync();

  late MockClient mockClient;
  late PresensiAppBackendApi api;

  setUp(() {
    mockClient = MockClient();
    api = PresensiAppBackendApi(mockClient);
  });

  group('login', () {
    test('must success when login called with given username and password',
        () async {
      when(mockClient.post(
        Uri.parse(Uri.encodeFull(BASE_API_URL + '/auth/login')),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer(
        (_) async => http.Response(
          fixtures('auth/login_success'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          },
        ),
      );

      var loginResult = await api.login(username: 'test', password: '12345');

      expect(loginResult, isNotNull);
      expect(loginResult, const TypeMatcher<Auth?>());
      expect(
          loginResult?.accessToken,
          startsWith(
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDbGFtZXJfYW'));
      expect(
          loginResult?.refreshToken,
          startsWith(
              'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDbGFtZXJfcmV'));
    });

    test('throw a LoginException error when the creds does not match', () {
      when(mockClient.post(
        Uri.parse(Uri.encodeFull(BASE_API_URL + '/auth/login')),
        headers: anyNamed('headers'),
        body: anyNamed('body'),
      )).thenAnswer(
        (_) async => http.Response(
          fixtures('auth/unauthorized'),
          401,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          },
        ),
      );

      expect(
          () async =>
              await api.login(username: 'wronguser', password: 'wrongpass'),
          throwsA(const TypeMatcher<ApiAccessErrorException>()));
    });
  });
  group('logout', () {
    test('successfully logout', () async {
      when(
        mockClient.post(
          Uri.parse(
            Uri.encodeFull(BASE_API_URL + '/auth/logout'),
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth/logout_success'),
          200,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          },
        ),
      );

      var logoutRes = await api.logout(
        accessToken:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDbGFtZXJfYWNjZXNzX3Rva2VuIiwiYXVkIjoiQXVkZXJfYWNjZXNzX3Rva2VuIiwiaWF0IjoxNjUyNDQ1MDMyLCJleHAiOjE2NTI0NDU2MzIsImRhdGEiOnsiaWQiOiI1IiwidXNlcm5hbWUiOiIxMjM0NTY3ODkiLCJuYW1lIjoiSm9rbyBXaWRvZG8iLCJlbWFpbCI6Impva29AM3BlcmlvZGUuY29tIn19.DnEvqfZi5xcaJjAAIPjjl3WGJNgnqHAPwy21BfyclU4',
        refreshToken:
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJDbGFtZXJfcmVmcmVzaF90b2tlbiIsImF1ZCI6IkF1ZGVyX3JlZnJlc2hfdG9rZW4iLCJpYXQiOjE2NTI0NDUwMzIsImRhdGEiOnsidXNlcm5hbWUiOiIxMjM0NTY3ODkifX0.D2S-IqO1zVrzNTQMuUeNfvFsCPiag-nHfe8rmQZN3YY',
      );
      expect(logoutRes, const TypeMatcher<String?>());
      expect(logoutRes, startsWith('You signed out'));
    });

    test('logout failed, incorrect refresh token', () {
      when(
        mockClient.post(
          Uri.parse(
            Uri.encodeFull(BASE_API_URL + '/auth/logout'),
          ),
          headers: anyNamed('headers'),
        ),
      ).thenAnswer(
        (_) async => http.Response(
          fixtures('auth/logout_failed'),
          400,
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8'
          },
        ),
      );

      expect(
          () async => await api.logout(
                accessToken: 'correct access token',
                refreshToken: 'wrong access token',
              ),
          throwsA(const TypeMatcher<ApiAccessErrorException>()));
    });
  });
  group('getPerkuliahan', () {});
}
