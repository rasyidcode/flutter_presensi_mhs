import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';

import 'package:flutter_presensi_mhs/data/exceptions/repository_error_exception.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/presensi_result.dart';

class PerkuliahanRepository {
  final PresensiAppApi _presensiAppApi;

  PerkuliahanRepository(this._presensiAppApi);

  // get list perkuliahan
  Future<PerkuliahanList> getListMatkul(String accessToken) async {
    final data =
        await _presensiAppApi.getPerkuliahanList(accessToken: accessToken);
    if (data == null) {
      throw RepositoryErrorException('Data returns null');
    }

    return data;
  }

  Future<PresensiResult> doPresensi(
      String accessToken, String code, String idJadwal) async {
    final result = await _presensiAppApi.doPresensi(
      accessToken: accessToken,
      qrcode: code,
      idJadwal: idJadwal,
    );
    if (result == null) {
      throw RepositoryErrorException('Result returns null');
    }

    return result;
  }

  // get detail perkuliahan

  // check perkuliahan
  Future<String?> checkPerkuliahan(String accessToken, String idJadwal) async {
    final result = await _presensiAppApi.checkPerkuliahan(
        accessToken: accessToken, idJadwal: idJadwal);
    if (result == null) {
      throw RepositoryErrorException('Result retuns null');
    }

    return result;
  }
}
