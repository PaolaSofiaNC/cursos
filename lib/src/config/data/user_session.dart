import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../models/user_config.dart';

class UserStorage {
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  static final UserStorage _instance = UserStorage._internal();
  factory UserStorage() {
    return _instance;
  }

  UserStorage._internal();

  static UserStorage get instance => _instance;

  Future<void> saveUser(UserConfig user) async {
    await secureStorage.write(key: 'userID', value: user.userID);
    await secureStorage.write(key: 'username', value: user.username);
    await secureStorage.write(key: 'password', value: user.password);
  }

  Future<UserConfig?> fetchUser() async {
    final userID = await secureStorage.read(key: 'userID');
    final username = await secureStorage.read(key: 'username');
    final password = await secureStorage.read(key: 'password');

    if (userID != null && username != null && password != null) {
      return UserConfig(userID: userID, username: username, password: password);
    } else {
      return null;
    }
  }

  Future<void> logout() async {
    await secureStorage.deleteAll();
  }
}
