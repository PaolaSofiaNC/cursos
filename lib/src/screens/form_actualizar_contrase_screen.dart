import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cursos/src/config/data/get_datos.dart';
import 'package:cursos/src/config/data/user_session.dart';
import 'package:cursos/src/config/models/user_config.dart';
import 'package:cursos/src/models/login.dart';
import 'package:cursos/src/presentation/Providers/providers.dart';
import 'package:cursos/src/providers/providers.dart';
import 'package:cursos/src/services/update_contras.dart';
import 'package:cursos/src/services/login_api.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';

class FormularioActualizarContrasenaScreen extends StatelessWidget {
  const FormularioActualizarContrasenaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          FiguraManchaWidget(
              color: const Color.fromARGB(100, 248, 178, 51),
              pTop: size.height * 0.075,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          const FiguraManchaWidget(
              color: AppTheme.primary,
              pTop: 0,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.22,
              ),
              const TextosFormularioC(),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: FormularioDeContrasena(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TextosFormularioC extends StatelessWidget {
  const TextosFormularioC({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children:  [
        SizedBox(
          height: size.height*0.01,
        ),
       const  Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Actualizar Contraseña',
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 35,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDeContrasena extends StatefulWidget {
  const FormularioDeContrasena({super.key});
  @override
  State<FormularioDeContrasena> createState() => _FormularioDeContrasenaState();
}

class _FormularioDeContrasenaState extends State<FormularioDeContrasena> {
  Cursos? cursos;

  @override
  void initState() {
    super.initState();
    hayUsuario();
  }

  Future<void> hayUsuario() async {
    getDatosSesion().then((datos) {
      loginAPI(datos!.username, datos.password).then((data) {
        if (mounted) {
          setState(() {
            cursos = data;
          });
        }
      });
    }).catchError((error) {
      debugPrint('Error en la petición getDatosSesion: $error');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final contrasena = TextEditingController();
  final nuevaContras = TextEditingController();
  final confirmNuevaContra = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 25, right: 25, bottom: 5),
                      child: Text(
                        'Contraseña Actual',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoContrasenaActual(
                      passwordActual: contrasena,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 10),
                      child: Text(
                        'Nueva Contraseña',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoNuevaContrasena(
                      nuevaContrase: nuevaContras,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 10),
                      child: Text(
                        'Confirmar Contraseña',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoConfirmarNuevaContrasena(
                      confirmNuevaContra: confirmNuevaContra,
                    ),
                    SizedBox(
                      height: size.height*0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BtnActualizarCont(
                            formKey: _formKey,
                            contrasenaActual: contrasena,
                            nuevaContrasena: nuevaContras,
                            confirmarContrasena: confirmNuevaContra,
                            token: cursos?.token,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        SizedBox(height: size.height * 0.05),
      ],
    );
  }
}

class CampoContrasenaActual extends StatelessWidget {
  final TextEditingController passwordActual;

  const CampoContrasenaActual({super.key, required this.passwordActual});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final ocultar = Provider.of<BotonContrasenaActualProvider>(context);
    final obtC = context.watch<ValidacionUpdatePassProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppTheme.baseBlanca,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 3,
                  color: Colors.black12,
                ),
              ],
            ),
            height: size.height * 0.1,
            child: TextFormField(
              controller: passwordActual,
              obscureText: ocultar.ocultar,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                obtC.setCampo1 = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black87,
                fontSize: 15,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock,
                  color: AppTheme.primary,
                ),
                hintText: 'Contraseña Actual',
                hintStyle: const TextStyle(
                  color: Colors.black38,
                  letterSpacing: 3,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
                  child: ocultar.ocultar
                      ? const Icon(
                          Icons.visibility_off,
                          size: 30,
                          color: AppTheme.primary,
                        )
                      : const Icon(
                          Icons.visibility,
                          size: 30,
                          color: AppTheme.primary,
                        ),
                ),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtC.validacionesCampo1
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtC.msjCampo1,
                    style: const TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      color: Colors.red,
                      letterSpacing: 1,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(' '),
                ),
        ],
      ),
    );
  }
}

class CampoNuevaContrasena extends StatelessWidget {
  final TextEditingController nuevaContrase;

  const CampoNuevaContrasena({super.key, required this.nuevaContrase});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtC = context.watch<ValidacionUpdatePassProvider>();
    final ocultar = Provider.of<BotonNuevaContrasenaProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppTheme.baseBlanca,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 3,
                  color: Colors.black12,
                ),
              ],
            ),
            height: size.height * 0.1,
            child: TextFormField(
              controller: nuevaContrase,
              obscureText: ocultar.ocultar,
              onChanged: (value) {
                obtC.setCampo2 = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black87,
                fontSize: 15,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock_sharp,
                  color: AppTheme.primary,
                ),
                hintText: 'Nueva Contraseña',
                hintStyle: const TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  color: Colors.black38,
                  letterSpacing: 3,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
                  child: ocultar.ocultar
                      ? const Icon(
                          Icons.visibility_off,
                          size: 30,
                          color: AppTheme.primary,
                        )
                      : const Icon(
                          Icons.visibility,
                          size: 30,
                          color: AppTheme.primary,
                        ),
                ),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtC.validacionesCampo2
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtC.msjCampo2,
                    style: const TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      color: Colors.red,
                      letterSpacing: 1,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(' '),
                ),
        ],
      ),
    );
  }
}

class CampoConfirmarNuevaContrasena extends StatelessWidget {
  final TextEditingController confirmNuevaContra;
  const CampoConfirmarNuevaContrasena(
      {super.key, required this.confirmNuevaContra});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtC = context.watch<ValidacionUpdatePassProvider>();
    final ocultar = Provider.of<BotonConfirmarContrasenaNewProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: AppTheme.baseBlanca,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 3,
                  color: Colors.black12,
                ),
              ],
            ),
            height: size.height * 0.1,
            child: TextFormField(
              controller: confirmNuevaContra,
              obscureText: ocultar.ocultar,
              onChanged: (value) {
                obtC.setCampo3 = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black87,
                fontSize: 11,
                letterSpacing: 1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 14),
                prefixIcon: const Icon(
                  Icons.lock_sharp,
                  color: AppTheme.primary,
                ),
                hintText: 'Confirmar contraseña',
                hintStyle: const TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  color: Colors.black38,
                  letterSpacing: 3,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => {ocultar.esOcultar = !ocultar.ocultar},
                  child: ocultar.ocultar
                      ? const Icon(
                          Icons.visibility_off,
                          size: 30,
                          color: AppTheme.primary,
                        )
                      : const Icon(
                          Icons.visibility,
                          size: 30,
                          color: AppTheme.primary,
                        ),
                ),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtC.validacionesCampo3
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtC.msjCampo3,
                    style: const TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      color: Colors.red,
                      letterSpacing: 1,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 2),
                  child: Text(' '),
                ),
        ],
      ),
    );
  }
}

class BtnActualizarCont extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController contrasenaActual;
  final TextEditingController nuevaContrasena;
  final TextEditingController confirmarContrasena;
  final String? token;

  const BtnActualizarCont(
      {super.key,
      required this.formKey,
      required this.contrasenaActual,
      required this.nuevaContrasena,
      required this.confirmarContrasena,
      required this.token});

  @override
  Widget build(BuildContext context) {
    final obtC = context.watch<ValidacionUpdatePassProvider>();
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () async {
              obtC.setCampo1 = contrasenaActual.text;
              obtC.setCampo2 = nuevaContrasena.text;
              obtC.setCampo3 = confirmarContrasena.text;
              if (!obtC.getCampo1Vacio &&
                  !obtC.getCampo2Vacio &&
                  !obtC.getCampo3Vacio) {
                try {
                  final userD = await UserStorage.instance.fetchUser();
                  obtC.setPassPet = userD!.password;
                  if (!obtC.validacionesCampo1 & !obtC.validacionesCampo3) {
                    final resp = await updatePassw(contrasenaActual.text,
                        nuevaContrasena.text, confirmarContrasena.text, token!);
                    if (resp == 'OK') {
                      await UserStorage.instance.saveUser(
                        UserConfig(
                            userID: userD.userID,
                            username: userD.username,
                            password: nuevaContrasena.text),
                      );
                      if (context.mounted) {
                        showSnackbar(
                            context, "Se actualizó la contraseña exitosamente");
                        Future.delayed(const Duration(seconds: 4), () {
                          Navigator.pop(context);
                        });
                      }
                    }
                  }
                } catch (e) {
                  showSnackbar(context, "Contraseña no actualizada");
                }
              }
            },
            child: Container(
              height: size.height * 0.08,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      offset: Offset(0.0, 2.0),
                      blurRadius: 1.0,
                      color: Colors.black12),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                children: [
                  Container(
                    height: size.height * 0.08,
                    width: size.width * 0.4,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                    decoration: const BoxDecoration(
                      color: AppTheme.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(70.0),
                        topLeft: Radius.circular(70.0),
                        bottomRight: Radius.circular(200),
                      ),
                    ),
                    child: const Text(
                      'Actualizar',
                      style: TextStyle(
                        fontFamily: AppTheme.fontCuerpo,
                        letterSpacing: 3,
                        color: AppTheme.baseBlanca,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.login,
                    size: size.height * 0.045,
                    color: AppTheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

void showSnackbar(BuildContext context, String msj) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msj),
      duration: const Duration(seconds: 2),
      backgroundColor: AppTheme.primary,
    ),
  );
}
