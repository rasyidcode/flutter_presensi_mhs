import 'package:flutter_presensi_mhs/data/api/presensi_app_backend_api.dart';
import 'package:flutter_presensi_mhs/data/exceptions/api_access_error_exception.dart';
import 'package:flutter_presensi_mhs/data/model/perkuliahan/perkuliahan_list.dart';

class PerkuliahanRepository {
  final PresensiAppApi _presensiAppApi;

  PerkuliahanRepository(this._presensiAppApi);

  // get list perkuliahan
  Future<PerkuliahanList> getData(String accessToken) async {
    final data =
        await _presensiAppApi.getPerkuliahanList(accessToken: accessToken);

    if (data == null) {
      throw ApiAccessErrorException('Data returns null');
    }

    return data;
  }

  // get detail perkuliahan
}
