import 'package:cursos/src/models/constancias.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<PeticionConstancias?> getConstanciasUsuario(String userID) async {
  final dio = Dio();
  final url ='${dotenv.env['URIOBTCONSTUSER']}/constancias?user=$userID';
  try {
    final options = Options(headers: {'Origin': 'http://192.168.1.100:3000'});
    final response =
        await dio.get(url, data: {'user': userID}, options: options);
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
