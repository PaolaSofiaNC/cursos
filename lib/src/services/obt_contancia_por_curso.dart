import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:cursos/src/models/constancias.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<PeticionConstancias?> getConstanciasPorCurso(
    String userID, String cursoID) async {
  final dio = Dio();
  final url ='${dotenv.env['URIOBTCONSTCURSO']}/constancias?user=$userID&curso=$cursoID';
  try {
    final options = Options(headers: {'Origin': 'http://192.168.1.100:3000'});
    final response = await dio.get(url,
        data: {'user': userID, 'curso': cursoID}, options: options);
    if (response.statusCode == 200) {
      final dataAPI = PeticionConstancias.fromMap(response.data);
      return dataAPI;
    } else {
      debugPrint('Error en la petición: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Error en la conexión: $e');
  }
  return null;
}
