import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/login.dart';
import 'package:dio/dio.dart';

Future<Cursos?> loginAPI(String correo, String password) async {
  final dio = Dio();
  String url = dotenv.env['URILOGIN']!;
  try {
    final options = Options(headers: {'Origin': 'http://192.168.1.100:3000'});
    final response = await dio.post(url,
        data: {'correo': correo, 'contraseña': password}, options: options);
    if (response.statusCode == 200) {
      final cursos = Cursos.fromJson(response.data);
      debugPrint("el rol de usuario es: ${cursos.data.user.role}");
      return cursos;
    } else {
      throw Exception('Error en la petición: ${response.statusCode}');
    }
  } catch (e) {
    throw Exception('Error en la conexión: $e');
  }
}
