import 'package:cursos/src/config/data/user_datos.dart';
import 'package:cursos/src/config/models/user_datos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/data/get_datos.dart';
import '../models/login.dart';
import '../presentation/Providers/providers.dart';
import '../services/login_api.dart';
import '../services/update_datos.dart';
import 'menu_user_screen.dart';

class FormularioPerfilScreen extends StatelessWidget {
  const FormularioPerfilScreen({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.24,
              ),
              const TextosFormulario(),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: FormularioDePerfil(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TextosFormulario extends StatelessWidget {
  const TextosFormulario({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            'Datos de Perfil',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 40,
            ),
            maxLines: 2,
          ),
        ),
      ],
    );
  }
}

class FormularioDePerfil extends StatefulWidget {
  const FormularioDePerfil({super.key});
  @override
  State<FormularioDePerfil> createState() => _FormularioDePerfilState();
}

class _FormularioDePerfilState extends State<FormularioDePerfil> {
  Cursos? cursos;

  @override
  void initState() {
    super.initState();
    hayUsuario();
  }

  Future<void> hayUsuario() async {
    var userD = await UserStorageDat.instance.fetchUser();
    getDatosSesion().then((datos) async {
      loginAPI(datos!.username, datos.password).then((data) {
        if (mounted) {
          setState(() {
            cursos = data;
            if (userD == null) {
              UserStorageDat.instance.saveUser(UserConfigDat(
                userNombre: cursos!.data.user.nombre,
                userApellidoP: cursos!.data.user.apellidoPaterno,
                userApellidoM: cursos!.data.user.apellidoMaterno,
                userCorreo: cursos!.data.user.correo,
              ));
            }
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
  final nombre = TextEditingController();
  final apellidoP = TextEditingController();
  final apellidoM = TextEditingController();
  final email = TextEditingController();

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
                        'Nombre(s)',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoNombre(nombreNuevo: nombre),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Apellido Paterno',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoApellidoP(nuevoApellidoP: apellidoP),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Apellido Materno',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoApellidoM(nuevoApellidoM: apellidoM),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 15),
                      child: Text(
                        'Email',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                    CampoEmailP(nuevoEmail: email),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BotonActualizarPerfil(
                            formKey: _formKey,
                            nombre: nombre,
                            apellidoP: apellidoP,
                            apellidoM: apellidoM,
                            email: email,
                            token: cursos?.token,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class CampoNombre extends StatelessWidget {
  final TextEditingController nombreNuevo;

  const CampoNombre({super.key, required this.nombreNuevo});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtDatos = context.watch<ValidacionUpdateDatosProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: nombreNuevo,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                obtDatos.setNombre = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 3,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: AppTheme.primary,
                ),
                hintText: 'andres',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtDatos.getNombre
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtDatos.obtMsg1,
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

class CampoApellidoP extends StatelessWidget {
  final TextEditingController nuevoApellidoP;

  const CampoApellidoP({super.key, required this.nuevoApellidoP});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtDatos = context.watch<ValidacionUpdateDatosProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: nuevoApellidoP,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                obtDatos.setApellidoP = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 3,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.group,
                  color: AppTheme.primary,
                ),
                hintText: 'Cruz',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtDatos.getApellidoP
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtDatos.obtMsg2,
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

class CampoApellidoM extends StatelessWidget {
  final TextEditingController nuevoApellidoM;

  const CampoApellidoM({super.key, required this.nuevoApellidoM});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtDatos = context.watch<ValidacionUpdateDatosProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: nuevoApellidoM,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                obtDatos.setApellidoM = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 3,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.group,
                  color: AppTheme.primary,
                ),
                hintText: 'Apellido Materno',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtDatos.getApellidoM
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtDatos.obtMsg3,
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

class CampoEmailP extends StatelessWidget {
  final TextEditingController nuevoEmail;

  const CampoEmailP({super.key, required this.nuevoEmail});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final obtDatos = context.watch<ValidacionUpdateDatosProvider>();
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: nuevoEmail,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                obtDatos.setCorreo = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black,
                fontSize: 16,
                letterSpacing: 3,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: AppTheme.primary,
                ),
                hintText: 'Correo electronico',
                hintStyle: TextStyle(color: Colors.black38),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          obtDatos.validarCorreo
              ? Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    obtDatos.obtMsg4,
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

class BotonActualizarPerfil extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nombre;
  final TextEditingController apellidoP;
  final TextEditingController apellidoM;
  final TextEditingController email;
  final String? token;

  const BotonActualizarPerfil({
    super.key,
    required this.formKey,
    required this.nombre,
    required this.apellidoP,
    required this.apellidoM,
    required this.email,
    required this.token,
  });

  @override
  Widget build(BuildContext context) {
    final obtDatos = context.watch<ValidacionUpdateDatosProvider>();
    final Size size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GestureDetector(
            onTap: () async {
              obtDatos.setNombre = nombre.text;
              obtDatos.setApellidoP = apellidoP.text;
              obtDatos.setApellidoM = apellidoM.text;
              obtDatos.setCorreo = email.text;

              if (!obtDatos.getNombre &
                  !obtDatos.getApellidoP &
                  !obtDatos.getApellidoM &
                  !obtDatos.validarCorreo) {
                try {
                  final userD = await UserStorageDat.instance.fetchUser();
                  obtDatos.setNombre = userD!.userNombre;
                  obtDatos.setApellidoP = userD.userApellidoP;
                  obtDatos.setApellidoM = userD.userApellidoM;
                  obtDatos.setCorreo = userD.userCorreo;
                  final resp = await updateDatos(nombre.text, apellidoP.text,
                      apellidoM.text, email.text, token!);
                  if (resp == 'OK') {
                    await UserStorageDat.instance.saveUser(
                      UserConfigDat(
                          userNombre: nombre.text,
                          userApellidoP: apellidoP.text,
                          userApellidoM: apellidoM.text,
                          userCorreo: email.text),
                    );
                    if (context.mounted) {
                      showSnackbarDatos(
                          context, "Los datos se actualizaron correctamente");
                      Future.delayed(const Duration(seconds: 4), () {
                        Navigator.pop(context);
                        MaterialPageRoute(
                            builder: (context) => const UserScreen());
                        (route) => false;
                      });
                    }
                  }
                } catch (e) {
                  showSnackbarDatos(context, "Los datos no se actualizaron");
                }
              }
            },
            child: Container(
              height: size.height * 0.07,
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
                    height: size.height * 0.07,
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

void showSnackbarDatos(BuildContext context, String msj) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msj),
      duration: const Duration(seconds: 2),
      backgroundColor: AppTheme.primary,
    ),
  );
}
