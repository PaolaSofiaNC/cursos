import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<String?> updateDatos(String nuevoNombre,String nuevoApellidoP,  String nuevoApellidoM, String nuevoCorreo,
 String token) async {
  Dio dio = Dio();

  dio.options.headers = {
    'Authorization': 'Bearer $token',
    'Origin': 'http://192.168.1.100:3000',
  };

  try {
    final response = await dio.request(
      dotenv.env['URIUPDATEDAT']!,
      options: Options(method: 'PATCH'),
      data: {
        "nombre": nuevoNombre,
        "apellidoPaterno": nuevoApellidoP,
        "apellidoMaterno": nuevoApellidoM,
        "correo":nuevoCorreo,
      },
    );
    return response.statusMessage;
  } catch (e) {
    return "Error 401, recurso no autorizado";
  }
}
