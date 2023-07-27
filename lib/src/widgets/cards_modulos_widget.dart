import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../screens/screens.dart';

class CardsModulosWidget extends StatelessWidget {
  final int id;
  final String cursoID;
  final String? imgModulo;
  final String tituloModulo;
  final DateTime fechaInicio;
  final List<dynamic> tareas;
  final List<Materiale> materiales;
  final ArchivoTemario temario;
  final Reunion ligaReunion;

  // DETALLES DE LOS MODULOS
  final String descripcion;

  const CardsModulosWidget({
    super.key,
    required this.id,
    required this.cursoID,
    required this.imgModulo,
    required this.tituloModulo,
    required this.fechaInicio,
    required this.descripcion,
    required this.tareas,
    required this.materiales,
    required this.temario,
    required this.ligaReunion,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2));

    final imgM = (imgModulo == null || imgModulo == '')
        ? 'https://cdn.dribbble.com/users/2394007/screenshots/7824075/media/248c9f9a704ea6873cb967309895cc24.gif'
        : imgModulo!;

    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetallesClase(
                id: id,
                cursoID: cursoID,
                descripcion: descripcion,
                titulomodulo: tituloModulo,
                imgD: imgM,
                tareas: tareas,
                materiales: materiales,
                temario: temario,
                ligaReunion: ligaReunion),
          )),
      child: Container(
        margin: const EdgeInsets.only(top: 0, right: 16, bottom: 16, left: 16),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(
            color: AppTheme.primary,
            width: size.width*0.01,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              width: size.width*0.3,
              height: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder:
                      const AssetImage('assets/gifs/loading_curso.gif'),
                  image: NetworkImage(imgM),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: size.height*0.01,
                ),
                Container(
                  height: size.height*0.11,
                  width: size.width*0.56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      tituloModulo,
                      maxLines: 5,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: AppTheme.fontCuerpo,
                        color: Colors.black,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: size.width*0.5,
                  height: size.height*0.08,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Inicio: ${DateFormat('dd/MM/yyyy').format(fechaInicio)}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontFamily: AppTheme.fontCuerpo,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
