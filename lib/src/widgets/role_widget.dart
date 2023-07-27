import 'package:cursos/src/models/login.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class RoleUsuario extends StatelessWidget {
  final String role;
  final Cursos? cursos;

  const RoleUsuario({super.key, required this.role, required this.cursos});

  @override
  Widget build(BuildContext context) {
    return role == 'user'
        ? const ImagenTipoUser(
            imgAsset: 'assets/roles/user.png',
            networkImg:
                'https://d2gg9evh47fn9z.cloudfront.net/800px_COLOURBOX25634105.jpg',
          )
        : (role == 'empresa'
            ? const ImagenTipoUser(
                imgAsset: 'assets/roles/empresa.png',
                networkImg:
                    'https://png.pngtree.com/png-vector/20190405/ourlarge/pngtree-vector-building-icon-png-image_912147.jpg',
              )
            : (role == 'administrador')
                ? const ImagenTipoUser(
                    imgAsset: 'assets/roles/admin.png',
                    networkImg:
                        'https://us.123rf.com/450wm/designofire/designofire1902/designofire190200405/116160170-icono-de-administración-de-vectores.jpg',
                  )
                : (role == 'capacitador'
                    ? const ImagenTipoUser(
                        imgAsset: 'assets/roles/capacitador.png',
                        networkImg:
                            'https://us.123rf.com/450wm/vladvm/vladvm1511/vladvm151101860/48353968-el-icono-del-profesor-formación-y-presentación-seminario-el-aprendizaje-de-símbolos-ilustración.jpg',
                      )
                    : Container()));
  }
}

class ImagenTipoUser extends StatelessWidget {
  final String imgAsset;
  final String networkImg;

  const ImagenTipoUser(
      {super.key, required this.imgAsset, required this.networkImg});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Positioned(
      right: 10,
      bottom: 0,
      child: Container(
        height: size.height*0.04,
        width: size.width*0.08,
        decoration: BoxDecoration(
          color: AppTheme.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: ClipOval(
          child: FadeInImage(
            image: NetworkImage(networkImg, scale: 1.0),
            placeholder: AssetImage(
              imgAsset,
            ),
            width: size.height*0.1,
            height: size.width*0.1,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
