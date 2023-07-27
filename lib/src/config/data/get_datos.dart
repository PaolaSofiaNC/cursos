import 'package:cursos/src/config/data/user_session.dart';
import 'package:cursos/src/config/models/user_config.dart';

Future<UserConfig?> getDatosSesion() async {
  final userStorage = UserStorage.instance;
  final cuenta = await userStorage.fetchUser();
  return cuenta;
}
