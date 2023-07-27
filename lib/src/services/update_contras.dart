import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> updatePassw(String passActual, String passwNueva,
    String confirmPassN, String token) async {
  Dio dio = Dio();

  dio.options.headers = {
    'Authorization': 'Bearer $token',
    'Origin': 'http://192.168.1.100:3000',
  };

  try {
    final response = await dio.request(
      dotenv.env['URIUPDATECONTRA']!,
      options: Options(method: 'PATCH'),
      data: {
        "contraseñaCurrent": passActual,
        "contraseña": passwNueva,
        "confirmarContraseña": confirmPassN
      },
    );
    return response.statusMessage;
  } catch (e) {
    return "Error 401, recurso no autorizado";
  }
}
