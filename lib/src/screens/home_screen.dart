import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/theme/app_theme.dart';

import '../config/data/get_datos.dart';
import '../config/models/user_config.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserConfig? cuenta;

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  Future<void> checkUser() async {
    getDatosSesion().then((data) {
      setState(() {
        cuenta = data;
      });
    });
  }

  Future<bool> condicion() async {
    await Future.delayed(const Duration(seconds: 2));
    debugPrint('El valor de la condicion es: ${(cuenta?.userID != null)}');
    return (cuenta?.userID != null);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder<bool>(
      future: condicion(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    strokeWidth: 4,
                    color: AppTheme.primary,
                  ),
                  SizedBox(
                    height: size.height * 0.2,
                  ),
                  const Text(
                    "Estamos preparando todo ...",
                    style: TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      letterSpacing: 3,
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error de peticion'));
        } else {
          final bool condition = snapshot.data ?? false;
          if (condition) {
            return const UserScreen();
          } else {
            return const BienvenidaScreen();
          }
        }
      },
    );
  }
}
