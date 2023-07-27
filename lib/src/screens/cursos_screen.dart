import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/carrusel_slider_curso_widget.dart';
import 'package:flutter/material.dart';

class CursosScreen extends StatelessWidget {
  final Welcome? apiCursos;

  const CursosScreen({super.key, required this.apiCursos});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipPath(
              clipper: WaveShape(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.2,
                color: AppTheme.primary,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: ClipPath(
              clipper: BottomWaveShape(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: size.height * 0.2,
                color: AppTheme.primary,
              ),
            ),
          ),
          CarruselSliderCursoWidget(
            cursos: apiCursos!,
          ),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Row(
                children: [
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: AppTheme.primary,
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.09,
                  ),
                  const Text(
                    "Mis Cursos",
                    style: TextStyle(
                      fontFamily: AppTheme.fontTitle,
                      fontSize: 30,
                      letterSpacing: 5,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 2, 0, width * 2 / 4, height, width, height);
    p.lineTo(width, 0);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}

class BottomWaveShape extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    double height = size.height;
    double width = size.width;
    var p = Path();
    p.lineTo(0, 0);
    p.cubicTo(width * 1 / 5, 0, width * 2 / 5, height * 0.9, width, height);
    p.lineTo(0, height);
    p.close();
    return p;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
