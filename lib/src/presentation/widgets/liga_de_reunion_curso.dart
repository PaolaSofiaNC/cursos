import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ReunionCurso extends StatelessWidget {
  final Reunion ligaReunion;

  const ReunionCurso({super.key, required this.ligaReunion});

  @override
  Widget build(BuildContext context) {
    return ligaReunion.link != ''
        ? LigaReunion(
            ligaReunion: ligaReunion,
          )
        : const SinLigaReunion();
  }
}

class LigaReunion extends StatelessWidget {
  final Reunion ligaReunion;
  const LigaReunion({super.key, required this.ligaReunion});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        'Acceso a clase: ${ligaReunion.nombre}',
        style: const TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          letterSpacing: 2,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          launchUrlString(ligaReunion.link,
              mode: LaunchMode.externalApplication);
        },
        icon: const Icon(
          Icons.arrow_circle_right_outlined,
          size: 40,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}

class SinLigaReunion extends StatelessWidget {
  const SinLigaReunion({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_add,
            size: size.width * 0.5,
            color: AppTheme.primary,
          ),
          const Text("Aqui Se Mostrará La Liga de Reunion de la Clase"),
        ],
      ),
    );
  }
}
