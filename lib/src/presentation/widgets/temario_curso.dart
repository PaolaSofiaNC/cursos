import 'dart:isolate';
import 'dart:ui';

import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class TemarioCurso extends StatelessWidget {
  final ArchivoTemario temario;
  final String tituloModulo;
  const TemarioCurso(
      {super.key, required this.temario, required this.tituloModulo});

  @override
  Widget build(BuildContext context) {
    return temario.url != ''
        ? TemarioC(
            temario: temario,
            tituloModulo: tituloModulo,
          )
        : const TemarioVacio();
  }
}

class TemarioC extends StatefulWidget {
  final String tituloModulo;
  final ArchivoTemario temario;
  const TemarioC(
      {super.key, required this.temario, required this.tituloModulo});

  @override
  State<TemarioC> createState() => _TemarioCState();
}

class _TemarioCState extends State<TemarioC> {
  void _comenzarDescarga(String titulo, String url) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseDirectorio = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
          url: url,
          savedDir: baseDirectorio!.path,
          fileName: '$titulo-temario.pdf');
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
    return ListTile(
      title: const Text(
        'Temario',
        style: TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          letterSpacing: 3,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          _comenzarDescarga(widget.tituloModulo, widget.temario.url);
        },
        icon: const Icon(
          Icons.download_for_offline_rounded,
          size: 40,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}

class TemarioVacio extends StatelessWidget {
  const TemarioVacio({super.key});
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
          const Text("Aqui Se Mostrará El Temario"),
        ],
      ),
    );
  }
}
