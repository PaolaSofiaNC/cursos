import 'package:cursos/src/config/data/user_session.dart';
import 'package:cursos/src/models/constancias.dart';
import 'package:cursos/src/services/obt_constancias_por_usuario.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ConstanciasScreen extends StatefulWidget {
  const ConstanciasScreen({super.key});

  @override
  State<ConstanciasScreen> createState() => _ConstanciasScreenState();
}

class _ConstanciasScreenState extends State<ConstanciasScreen> {
  PeticionConstancias? resp;

  Future<void> obtDatosUser() async {
    final datosUser = await UserStorage.instance.fetchUser();
    if (datosUser?.userID != null) {
      getConstanciasUsuario(datosUser!.userID).then((data) {
        setState(() {
          resp = data;
        });
      }).catchError((e) {
        debugPrint("no se pudo encontrar la data $e");
      });
    }
  }

  Future<bool> condicion() async {
    await Future.delayed(const Duration(seconds: 2));
    return resp != null ? (resp!.data.data.isNotEmpty ? true : false) : false;
  }

  @override
  void initState() {
    super.initState();
    obtDatosUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mis Constancias',
          style: TextStyle(
            fontFamily: AppTheme.fontTitle,
            color: AppTheme.baseBlanca,
          ),
        ),
        backgroundColor: AppTheme.primary,
      ),
      body: FutureBuilder<bool>(
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
                      height: size.height * 0.01,
                    ),
                    const Text(
                      'Verificando existencia de constancias...',
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
            return const Text('Error de petición');
          } else {
            final bool condition = snapshot.data ?? false;
            if (condition) {
              return ListaConstanciasWidget(
                resp: resp!,
              );
            } else {
              return const Center(
                child: NoHayConstancia(),
              );
            }
          }
        },
      ),
    );
  }
}

class NoHayConstancia extends StatelessWidget {
  const NoHayConstancia({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.hide_source_sharp,
            size: size.width * 0.5,
            color: AppTheme.primary,
          ),
          const Text(
            "No tiene ninguna constancia",
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              letterSpacing: 3,
            ),
          ),
        ],
      ),
    );
  }
}
