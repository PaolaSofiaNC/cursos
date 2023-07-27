import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import '../models/cursos.dart';

class ModulosCursoScreen extends StatelessWidget {
  final String cursoID;
  final List<Modulo>? modulos;

  final _pageController = PageController(
    viewportFraction: 0.3,
  );

  ModulosCursoScreen({super.key, required this.modulos, required this.cursoID});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppTheme.baseBlanca,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                width: size.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(70),
                    ),
                    color: AppTheme.primary),
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.21),
                  ],
                ),
              ),
              Container(
                color: AppTheme.primary,
                child: Container(
                  height: size.height * 0.2,
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  decoration: const BoxDecoration(
                    color: AppTheme.baseBlanca,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(120),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: size.height * 0.05,
              ),
              SizedBox(
                height: size.height * 0.1,
                child: Row(
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
                        color: AppTheme.baseBlanca,
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    const Text(
                      'Modulos del Curso',
                      style: TextStyle(
                          fontFamily: AppTheme.fontTitle,
                          fontSize: 25,
                          color: AppTheme.baseBlanca),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemCount: modulos!.length,
                  itemBuilder: (context, index) => builder(index),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  builder(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.0;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page! - index;
          if (value >= 0) {
            double lowerLimit = 0;
            double upperLimit = math.pi / 2;
            value = (upperLimit - (value.abs() * (upperLimit - lowerLimit)))
                .clamp(lowerLimit, upperLimit);
            value = upperLimit - value;
            value *= -1;
          }
        } else {
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = -1;
          }
        }

        return Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(value),
          alignment: Alignment.center,
          child: CardsModulosWidget(
            id: index,
            imgModulo: modulos![index].imagenCover.url,
            tituloModulo: modulos![index].nombre,
            fechaInicio: modulos![index].fechaInicio,
            descripcion: modulos![index].descripcionCard,
            tareas: modulos![index].tareas,
            materiales: modulos![index].materiales,
            temario: modulos![index].archivoTemario,
            ligaReunion: modulos![index].reunion,
            cursoID: cursoID,
          ),
        );
      },
      child: CardsModulosWidget(
        id: index,
        imgModulo: modulos![index].imagenCover.url,
        tituloModulo: modulos![index].nombre,
        fechaInicio: modulos![index].fechaInicio,
        descripcion: modulos![index].descripcionCard,
        tareas: modulos![index].tareas,
        materiales: modulos![index].materiales,
        temario: modulos![index].archivoTemario,
        ligaReunion: modulos![index].reunion,
        cursoID: cursoID,
      ),
    );
  }
}
