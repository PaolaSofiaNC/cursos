import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class InfoCurso extends StatelessWidget {
  final String descripcion;
  const InfoCurso({super.key, required this.descripcion});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.height*0.01,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            descripcion,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              letterSpacing: 1,
              fontFamily: AppTheme.fontCuerpo,
            ),
          ),
        ),
      ],
    );
  }
}
