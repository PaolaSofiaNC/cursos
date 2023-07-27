import 'package:cursos/src/config/models/user_datos.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserStorageDat {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static final UserStorageDat _instance = UserStorageDat._internal();
  factory UserStorageDat() {
    return _instance;
  }

  UserStorageDat._internal();

  static UserStorageDat get instance => _instance;

  Future<void> saveUser(UserConfigDat user) async {
    await secureStorage.write(key: 'userNombre', value: user.userNombre);
    await secureStorage.write(
        key: 'userApellidoPaterno', value: user.userApellidoP);
    await secureStorage.write(
        key: 'userApellidoMaterno', value: user.userApellidoM);
    await secureStorage.write(key: 'userCorreo', value: user.userCorreo);
  }

  Future<UserConfigDat?> fetchUser() async {
    const secureStorage = FlutterSecureStorage();

    final userNombre = await secureStorage.read(key: 'userNombre');
    final userApellidoP = await secureStorage.read(key: 'userApellidoPaterno');
    final userApellidoM = await secureStorage.read(key: 'userApellidoMaterno');
    final userCorreo = await secureStorage.read(key: 'userCorreo');

    if (userNombre != null &&
        userApellidoP != null &&
        userApellidoM != null &&
        userCorreo != null) {
      return UserConfigDat(
        userNombre: userNombre,
        userApellidoP: userApellidoP,
        userApellidoM: userApellidoM,
        userCorreo: userCorreo,
      );
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    await secureStorage.deleteAll();
  }
}
