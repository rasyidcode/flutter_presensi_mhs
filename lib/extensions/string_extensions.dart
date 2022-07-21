import 'package:jwt_decode/jwt_decode.dart';

extension StringExtensions on String {
  Map<String, dynamic> jwtDecode() {
    Map<String, dynamic> payload = Jwt.parseJwt(this);
    return payload;
  }
}
