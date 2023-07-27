import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import '../presentation/widgets/widgets_presentations.dart';

class DetallesClase extends StatelessWidget {
  final int id;
  final String cursoID;
  final String descripcion;
  final String titulomodulo;
  final String imgD;
  final List<dynamic> tareas;
  final List<Materiale> materiales;
  final ArchivoTemario temario;
  final Reunion ligaReunion;

  const DetallesClase({
    super.key,
    required this.id,
    required this.cursoID,
    required this.descripcion,
    required this.titulomodulo,
    required this.imgD,
    required this.tareas,
    required this.materiales,
    required this.temario,
    required this.ligaReunion,
  });

  @override
  Widget build(BuildContext context) {
    return SilverAppBar(
      id: id,
      cursoID: cursoID,
      descripcion: descripcion,
      titulomodulo: titulomodulo,
      imgD: imgD,
      tareas: tareas,
      materiales: materiales,
      temario: temario,
      ligaReunion: ligaReunion,
    );
  }
}

class SilverAppBar extends StatelessWidget {
  final String cursoID;
  final String descripcion;
  final String titulomodulo;
  final String imgD;
  final List<dynamic> tareas;
  final List<Materiale> materiales;
  final ArchivoTemario temario;
  final Reunion ligaReunion;

  const SilverAppBar({
    super.key,
    required this.id,
    required this.cursoID,
    required this.descripcion,
    required this.titulomodulo,
    required this.imgD,
    required this.tareas,
    required this.materiales,
    required this.temario,
    required this.ligaReunion,
  });

  final dynamic id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          _CustomAppBar(
            id: id,
            size: size,
            imgD: imgD,
            tituloModulo: titulomodulo,
          ),
          CursoTabBar(
            id: id,
            cursoID: cursoID,
            size: size,
            tituloModulo: titulomodulo,
            descripcion: descripcion,
            tareas: tareas,
            materiales: materiales,
            temario: temario,
            ligaReunion: ligaReunion,
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final dynamic id;
  final Size size;
  final String imgD;
  final String tituloModulo;

  const _CustomAppBar(
      {required this.id,
      required this.size,
      required this.imgD,
      required this.tituloModulo});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.33,
          decoration: const BoxDecoration(
            color: AppTheme.primary,
          ),
          child: ClipRRect(
            child: FadeInImage(
              image: NetworkImage(imgD),
              placeholder: const AssetImage('assets/gif/loading.gif'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.05,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                size: 40,
                color: AppTheme.baseBlanca,
              ),
            ),
            SizedBox(
              height: size.height * 0.133,
            ),
            Container(
              width: double.infinity,
              height: size.height * 0.07,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    tituloModulo,
                    maxLines: 3,
                    style: const TextStyle(
                        fontFamily: AppTheme.fontCuerpo,
                        color: AppTheme.baseBlanca,
                        fontSize: 13,
                        overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class CursoTabBar extends StatelessWidget {
  final Size size;
  final int id;
  final String cursoID;
  final String tituloModulo;
  final String descripcion;
  final List<dynamic> tareas;
  final List<Materiale> materiales;
  final ArchivoTemario temario;
  final Reunion ligaReunion;

  const CursoTabBar({
    super.key,
    required this.size,
    required this.id,
    required this.cursoID,
    required this.tituloModulo,
    required this.descripcion,
    required this.tareas,
    required this.materiales,
    required this.temario,
    required this.ligaReunion,
  });
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.primary,
            ),
            height: size.height * 0.07,
            child: TabBar(
              isScrollable: true,
              labelColor: AppTheme.baseBlanca,
              unselectedLabelColor: AppTheme.baseBlanca.withOpacity(0.4),
              indicatorColor: Colors.white,
              tabs: const [
                Tab(
                  text: 'Info.',
                ),
                Tab(
                  text: 'Temario',
                ),
                Tab(
                  text: 'Materiales',
                ),
                Tab(
                  text: 'Tareas',
                ),
                Tab(
                  text: 'Liga de Acceso',
                ),
              ],
            ),
          ),
          SizedBox(
              height: size.height * 0.5,
              child: TabBarView(
                children: [
                  InfoCurso(
                    descripcion: descripcion,
                  ),
                  TemarioCurso(
                    temario: temario,
                    tituloModulo: tituloModulo,
                  ),
                  MaterialesCurso(
                    materiales: materiales,
                  ),
                  TareasCurso(
                    tareas: tareas,
                  ),
                  ReunionCurso(
                    ligaReunion: ligaReunion,
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
