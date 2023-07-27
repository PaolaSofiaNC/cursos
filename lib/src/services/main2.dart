import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {}

consts(String correo, String password) async {
  final dio = Dio();
  final url =dotenv.env['URIMAIN']!;
  try {
    final options = Options(headers: {'Origin': 'http://192.168.1.100:3000'});
    final response = await dio.get(url, data: {}, options: options);
    if (response.statusCode == 200) {
    } else {
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error en la conexión: $e');
  }
}
