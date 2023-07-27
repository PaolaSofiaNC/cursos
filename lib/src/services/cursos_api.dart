import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../models/cursos.dart';

Future<Welcome?> getCursos(String idUser) async {
  final dio = Dio();
  final url ='${dotenv.env['URICURSOS']}/booking?user=$idUser&pagado=true';
  try {
    final options = Options(headers: {'Origin': 'http://192.168.1.100:3000'});
    final response =
        await dio.get(url, data: {'user': idUser}, options: options);
    if (response.statusCode == 200) {
      final cursos = Welcome.fromJson(response.data);
      return cursos;
    } else {
      debugPrint("Error en la petición ${response.statusCode}");
    }
  } catch (e) {
    debugPrint('Error en la conexión: $e');
  }
  return null;
}
