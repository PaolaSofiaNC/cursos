import 'package:cursos/src/presentation/Providers/providers.dart';
import 'package:cursos/src/widgets/role_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/config/data/user_session.dart';
import 'package:cursos/src/services/login_api.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/models/login.dart';
import '../config/data/get_datos.dart';
import '../services/cursos_api.dart';
import '../widgets/widgets.dart';

enum _MenuValues { editPerf, editCont, cerrarSesion }

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
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

  @override
  Widget build(BuildContext context) {
    final imgS = (cursos?.data.user.photo.url == null ||
            cursos?.data.user.photo.url == '')
        ? 'https://cdn.dribbble.com/users/2394007/screenshots/7824075/media/248c9f9a704ea6873cb967309895cc24.gif'
        : cursos?.data.user.photo.url;

    return Scaffold(
      body: Stack(
        children: [
          const CirculosTopWidget(),
          const UserBottonMenu(),
          SingleChildScrollView(
            child: Column(
              children: [
                AvatarUser(
                    img: imgS,
                    nombre:
                        "${cursos?.data.user.nombre == null ? '' : cursos!.data.user.nombre} ${cursos?.data.user.apellidoMaterno ?? ''}",
                    role: cursos?.data.user.role,
                    cursos: cursos),
                MenuDashboard(cursos: cursos),
              ],
            ),
          ),
          const UserBottonMenu(),
        ],
      ),
    );
  }
}

class AvatarUser extends StatefulWidget {
  final String? img;
  final String? nombre;
  final String? role;
  final Cursos? cursos;

  const AvatarUser(
      {super.key,
      required this.img,
      required this.nombre,
      required this.role,
      this.cursos});

  @override
  State<AvatarUser> createState() => _AvatarUserState();
}

class _AvatarUserState extends State<AvatarUser> {
  Future<bool>? _imageLoadedFuture;

  @override
  void initState() {
    super.initState();
    _imageLoadedFuture = Future.delayed(
        const Duration(seconds: 1), () => true); // Simula la carga de la imagen
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final imgS = widget.img == '' || widget.img == null
        ? 'https://www.nicepng.com/png/detail/128-1280406_view-user-icon-png-user-circle-icon-png.png'
        : widget.img;

    return Column(children: [
      SizedBox(
        height: size.height * 0.14,
      ),
      Center(
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppTheme.baseBlanca,
            border: Border.all(
              width: 5,
              color: AppTheme.baseBlanca,
            ),
            shape: BoxShape.circle,
          ),
          width: size.width * 0.4,
          height: size.height * 0.2,
          child: FutureBuilder<bool>(
            future: _imageLoadedFuture,
            builder: (context, snapshot) {
              final isImageLoaded = snapshot.data ?? false;
              return Stack(
                children: [
                  ClipOval(
                    child: Image.network(
                      imgS!,
                      width: size.width * 0.4,
                      height: size.height * 0.2,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (isImageLoaded)
                    RoleUsuario(
                      role: widget.role == null ? 'user' : widget.role!,
                      cursos: widget.cursos,
                    ),
                ],
              );
            },
          ),
        ),
      ),
      SizedBox(
        height: size.height * 0.005,
      ),
      Text(
        widget.nombre!,
        style: const TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          fontSize: 18,
          letterSpacing: 3,
        ),
      ),
      SizedBox(
        height: size.height * 0.005,
      ),
      Text(
        widget.role == null ? '' : widget.role!,
        style: const TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          color: Colors.black45,
          fontSize: 15,
          letterSpacing: 2,
        ),
      ),
    ]);
  }
}

class UserBottonMenu extends StatelessWidget {
  const UserBottonMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final obtC = context.watch<ValidacionUpdatePassProvider>();
    final obtCorreo = context.watch<ValidacionUpdateDatosProvider>();
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.05,
        ),
        Row(
          children: [
            SizedBox(
              width: size.width * 0.82,
            ),
            PopupMenuButton<_MenuValues>(
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem(
                  value: _MenuValues.editPerf,
                  child: Text(
                    'Actualizar datos de perfil',
                    style: TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      letterSpacing: 1,
                      fontSize: 15,
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: _MenuValues.editCont,
                  child: Text(
                    'Actualizar contraseña',
                    style: TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      letterSpacing: 1,
                      fontSize: 15,
                    ),
                  ),
                ),
                const PopupMenuItem(
                  value: _MenuValues.cerrarSesion,
                  child: Text(
                    'Cerrar Sesion',
                    style: TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      letterSpacing: 1,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
              elevation: 0,
              color: AppTheme.baseBlanca,
              icon: const Icon(
                Icons.more_vert_outlined,
                color: AppTheme.baseBlanca,
              ),
              iconSize: 40,
              onSelected: (value) {
                switch (value) {
                  case _MenuValues.editPerf:
                    obtCorreo.setNombre = ' ';
                    obtCorreo.setApellidoP = ' ';
                    obtCorreo.setApellidoM = ' ';
                    obtCorreo.setCorreo = ' ';
                    Navigator.pushNamed(context, 'formularioPerfil');
                    break;
                  case _MenuValues.editCont:
                    obtC.setCampo1 = ' ';
                    obtC.setCampo2 = ' ';
                    obtC.setCampo3 = ' ';
                    Navigator.pushNamed(context, 'formularioContrasena');
                    break;
                  case _MenuValues.cerrarSesion:
                    UserStorage.instance.logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BienvenidaScreen(),
                      ),
                    );
                    break;
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}

class MenuDashboard extends StatelessWidget {
  final Cursos? cursos;

  const MenuDashboard({super.key, this.cursos});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Center(
        child: Wrap(
          spacing: size.height * 0.025,
          runSpacing: size.height * 0.025,
          children: [
            CardOptionMenuUserWidget(
              urlImg: 'assets/dashboard_menu/curso-online.png',
              title: 'Mis Cursos',
              onTap: () async {
                final dataID = await getDatosSesion();
                final cursosA = await getCursos(dataID!.userID);
                // ignore: use_build_context_synchronously
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CursosScreen(apiCursos: cursosA),
                  ),
                );
              },
            ),
            CardOptionMenuUserWidget(
              urlImg: 'assets/dashboard_menu/constancias.png',
              title: 'Constancias',
              onTap: () => Navigator.pushNamed(context, 'constancias'),
            ),
            CardOptionMenuUserWidget(
              urlImg: 'assets/dashboard_menu/validador.png',
              title: 'Validador',
              onTap: () => {launchUrlString('https://iktantraining.com')},
            ),
            CardOptionMenuUserWidget(
              urlImg: 'assets/dashboard_menu/contactos.png',
              title: 'Contactanos',
              onTap: () => Navigator.pushNamed(context, 'contactanos'),
            ),
          ],
        ),
      ),
    );
  }
}
