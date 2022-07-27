import 'package:flutter_presensi_mhs/ui/home/home_bloc.dart';
import 'package:jwt_decode/jwt_decode.dart';

extension StringExtensions on String {
  DrawerData jwtDecode() {
    Map<String, dynamic> payload = Jwt.parseJwt(this);
    return DrawerData(payload['username'] ?? '-', payload['name'] ?? '-');
  }
}
