import 'dart:isolate';
import 'dart:ui';

import 'package:cursos/src/models/constancias.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class ListaConstanciasWidget extends StatelessWidget {
  final PeticionConstancias resp;

  const ListaConstanciasWidget({Key? key, required this.resp})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: resp.data.data.length,
      itemBuilder: (context, i) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 0),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: AnimationController(
                vsync: Scaffold.of(context),
                duration: const Duration(milliseconds: 500),
              )..forward(),
              curve: Curves.easeInOutCubic,
            ),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    blurRadius: 2,
                    color: Colors.black26,
                  ),
                ],
                color: AppTheme.baseBlanca),
            child: SizedBox(
              height: size.height * 0.25,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.2,
                    width: size.width * 0.3,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(100),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(100)),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(100),
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(100),
                      ),
                      child: FadeInImage(
                        image: NetworkImage(
                            resp.data.data[i].curso.imagenCover.url == 'null'
                                ? 'https://i.pinimg.com/originals/59/99/43/5999437a8324f521f60c2f33eb1ed370.gif'
                                : resp.data.data[i].curso.imagenCover.url,
                            scale: 1.0),
                        placeholder:
                            const AssetImage('assets/image/no-Imagen.jpg'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  DetallesConstancia(
                    id: i,
                    nombreCurso: resp.data.data[i].curso.nombre,
                    nombreUser:
                        '${resp.data.data[i].user.nombre}_${resp.data.data[i].user.apellidoMaterno}_${resp.data.data[i].user.apellidoPaterno}_',
                    url: resp.data.data[i].constancias.iktanUrl,
                    folio: resp.data.data[i].folio,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class DetallesConstancia extends StatefulWidget {
  final int id;
  final String nombreCurso;
  final String nombreUser;
  final String url;
  final String folio;

  const DetallesConstancia(
      {super.key,
      required this.id,
      required this.nombreCurso,
      required this.nombreUser,
      required this.url,
      required this.folio});

  @override
  State<DetallesConstancia> createState() => _DetallesConstanciaState();
}

class _DetallesConstanciaState extends State<DetallesConstancia> {
  void _comenzarDescarga(String titulo, String url) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseDirectorio = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
          url: url, savedDir: baseDirectorio!.path, fileName: '$titulo.pdf');
    } else {
      debugPrint("No permision");
    }
  }

  ReceivePort receivePort = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, 'descargarTemario');
    receivePort.listen((message) {});
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  static downloadCallback(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName('descargarTemario')!;
    sendPort.send(progress);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 8, bottom: 8),
          child: SizedBox(
            height: size.height*0.13,
            width: size.width*0.55,
            child: Text(
              widget.nombreCurso,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontFamily: AppTheme.fontCuerpo,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 8),
          child: Text(
            'Folio: ${widget.folio}',
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 13,
            ),
          ),
        ),
        SizedBox(
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  debugPrint(
                      'se esta presionando el boton de descargar en ${widget.id}');
                  _comenzarDescarga(
                      '${widget.nombreUser}_${widget.nombreCurso}', widget.url);
                },
                icon: const Icon(
                  Icons.download,
                  color: AppTheme.primary,
                  size: 30,
                ),
                highlightColor: Colors.transparent,
              ),
            ],
          ),
        )
      ],
    );
  }
}

