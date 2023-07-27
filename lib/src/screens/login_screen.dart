// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cursos/src/presentation/Providers/providers.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:cursos/src/providers/providers.dart';
import 'package:cursos/src/theme/app_theme.dart';
import '../config/data/user_session.dart';
import '../config/models/user_config.dart';
import '../services/login_api.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          FiguraManchaWidget(
              color: AppTheme.primary.withOpacity(0.4),
              pTop: 50,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          const FiguraManchaWidget(
              color: AppTheme.primary,
              pTop: 0,
              pRight: 0,
              pBottom: 0,
              pLeft: 0),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.2,
                ),
                const TextosLogin(),
                SizedBox(
                  height: size.height * 0.05,
                ),
                LoginFormulario(),
                SizedBox(
                  height: size.height * 0.05,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class TextosLogin extends StatelessWidget {
  const TextosLogin({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height * 0.06,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: Text(
            '¡Hola!',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 65,
              letterSpacing: 2,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 14, top: 10),
          child: Text(
            'Inicie sesión en su cuenta',
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: AppTheme.fontTitle,
              fontSize: 18,
              letterSpacing: 2,
            ),
          ),
        ),
      ],
    );
  }
}

class LoginFormulario extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final contrasena = TextEditingController();

  LoginFormulario({super.key});

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
                        'Correo electronico',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    CampoEmail(
                      email: email,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                          left: 25, right: 25, bottom: 5, top: 20),
                      child: Text(
                        'Contraseña',
                        style: TextStyle(
                          fontFamily: AppTheme.fontCuerpo,
                          color: Colors.black,
                          fontSize: 16,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    CampoContrasena(
                      contrasena: contrasena,
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        BtnLogin(
                          email: email,
                          contrasena: contrasena,
                          formKey: _formKey,
                        ),
                        SizedBox(
                          width: size.width * 0.04,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CampoEmail extends StatelessWidget {
  final TextEditingController email;

  const CampoEmail({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final emailP = context.watch<ValidatorLoginProvider>();
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
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                emailP.setEmail = ' ';
              },
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                color: Colors.black87,
                fontSize: 15,
                letterSpacing: 1,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: AppTheme.primary,
                ),
                hintText: 'Correo electronico',
                hintStyle: TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  color: Colors.black38,
                  letterSpacing: 3,
                ),
              ),
              cursorColor: AppTheme.primary,
            ),
          ),
          emailP.validarCorreo
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    emailP.msjCorreo,
                    style: const TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      color: Colors.red,
                      letterSpacing: 1,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(' '),
                ),
        ],
      ),
    );
  }
}

class CampoContrasena extends StatelessWidget {
  const CampoContrasena({super.key, required this.contrasena});

  final TextEditingController contrasena;
  @override
  Widget build(BuildContext context) {
    final esOculto1 = Provider.of<BotonContrasena>(context);
    final passP = context.watch<ValidatorLoginProvider>();
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, bottom: 5),
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
                  blurRadius: 2,
                  color: Colors.black26,
                ),
              ],
            ),
            height: size.height * 0.075,
            child: TextFormField(
              controller: contrasena,
              obscureText: esOculto1.oculto,
              onChanged: (value) {
                passP.setContra = ' ';
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
                hintText: 'Contraseña',
                hintStyle: const TextStyle(
                  fontFamily: AppTheme.fontCuerpo,
                  color: Colors.black38,
                  letterSpacing: 4,
                ),
                suffixIcon: GestureDetector(
                  onTap: () => {esOculto1.esOculto = !esOculto1.oculto},
                  child: esOculto1.oculto
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
          passP.validarPassw
              ? Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text(
                    passP.msjPassw,
                    style: const TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      color: Colors.red,
                      letterSpacing: 1,
                    ),
                  ),
                )
              : const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(' '),
                ),
        ],
      ),
    );
  }
}

class BtnLogin extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController contrasena;
  final GlobalKey<FormState> formKey;

  const BtnLogin(
      {super.key,
      required this.email,
      required this.contrasena,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    final datoLoginP = context.watch<ValidatorLoginProvider>();
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () async {
          datoLoginP.setEmail = email.text;
          datoLoginP.setContra = contrasena.text;
          if (!datoLoginP.getEmailVacio && !datoLoginP.getPassWVacia) {
            try {
              final cuenta = await loginAPI(email.text, contrasena.text);
              if (cuenta?.status == 'successful') {
                datoLoginP.setRespLogin = ' ';
                final newUser = UserConfig(
                  userID: cuenta!.data.user.id,
                  username: cuenta.data.user.correo,
                  password: contrasena.text,
                );
                await UserStorage.instance.saveUser(newUser);
                email.text = '';
                contrasena.text = '';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const UserScreen()),
                  (route) => false,
                );
              }
            } catch (e) {
              datoLoginP.setRespLogin = 'error';
              debugPrint('Ocurrió un error en la petición: $e');
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
                  blurRadius: 2.0,
                  color: Colors.black12),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width * 0.38,
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 15.0),
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    topLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(200),
                  ),
                ),
                child: const Text(
                  'LOGIN',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    letterSpacing: 4,
                    fontSize: 14,
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
    );
  }
}
