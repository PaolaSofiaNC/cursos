import 'dart:isolate';
import 'dart:ui';

import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MaterialesCurso extends StatelessWidget {
  final List<Materiale> materiales;
  const MaterialesCurso({super.key, required this.materiales});
  @override
  Widget build(BuildContext context) {
    return materiales.isEmpty
        ? const NingunMaterial()
        : MaterialesExistentes(
            materiales: materiales,
          );
  }
}

class MaterialesExistentes extends StatefulWidget {
  final List<Materiale> materiales;
  const MaterialesExistentes({super.key, required this.materiales});
  @override
  State<MaterialesExistentes> createState() => _MaterialesExistentesState();
}

class _MaterialesExistentesState extends State<MaterialesExistentes> {
  void _startDownload(String url, String fileName) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final baseDirectorio = await getExternalStorageDirectory();
      await FlutterDownloader.enqueue(
          url: url, savedDir: baseDirectorio!.path, fileName: '$fileName.pdf');
    } else {
      debugPrint("No permision");
    }
  }

  ReceivePort receivePort = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, 'descargarVideos');
    receivePort.listen((message) {});
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  static downloadCallback(id, status, progress) {
    SendPort sendPort = IsolateNameServer.lookupPortByName('descargarVideos')!;
    sendPort.send(progress);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: widget.materiales.length,
      itemBuilder: (BuildContext context, int i) {
        final elemento = widget.materiales[i];
        return ListTile(
          title: Text(
            elemento.nombre,
            style: const TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              letterSpacing: 3,
            ),
          ),
          trailing: IconButton(
            onPressed: () {
              String url = elemento.archivoMaterial.url;
              String fileName = "material-${elemento.id}";
              _startDownload(url, fileName);
            },
            icon: const Icon(
              Icons.download_for_offline_rounded,
              size: 40,
              color: AppTheme.primary,
            ),
          ),
        );
      },
    );
  }
}

class NingunMaterial extends StatelessWidget {
  const NingunMaterial({super.key});
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
          const Text("Aqui Se Mostrarán Los Materiales"),
        ],
      ),
    );
  }
}
