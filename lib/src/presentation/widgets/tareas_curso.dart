import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class TareasCurso extends StatelessWidget {
  final List<dynamic> tareas;
  const TareasCurso({super.key, required this.tareas});

  @override
  Widget build(BuildContext context) {
    return tareas.isEmpty
        ? const TareasVacias()
        : TareasAsignadas(
            tareas: tareas,
          );
  }
}

class TareasAsignadas extends StatelessWidget {
  final List<dynamic> tareas;
  const TareasAsignadas({super.key, required this.tareas});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tareas.length,
      itemBuilder: (BuildContext context, int i) {
        final elemento = tareas[i];
        return ListTile(
          title: Text(elemento.title),
          subtitle: Text(elemento.subtitle),
        );
      },
    );
  }
}

class TareasVacias extends StatelessWidget {
  const TareasVacias({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_add,
            size: size.width * 0.5,
            color: AppTheme.primary,
          ),
          const Text(
            "Aqui se mostrarán las tareas",
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
