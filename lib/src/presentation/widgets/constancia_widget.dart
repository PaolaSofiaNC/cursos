import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:isolate';
import 'dart:ui';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/models/constancias.dart';
import 'package:cursos/src/services/obt_contancia_por_curso.dart';
import 'package:cursos/src/config/data/user_session.dart';

class ConstanciaCurso extends StatefulWidget {
  final String cursoID;

  const ConstanciaCurso({
    super.key,
    required this.cursoID,
  });

  @override
  State<ConstanciaCurso> createState() => _ConstanciaCursoState();
}

class _ConstanciaCursoState extends State<ConstanciaCurso> {
  PeticionConstancias? resp;

  Future<void> obtDatosUser() async {
    final datosUser = await UserStorage.instance.fetchUser();
    if (datosUser?.userID != null) {
      getConstanciasPorCurso(datosUser!.userID, widget.cursoID).then((data) {
        setState(() {
          resp = data;
        });
      }).catchError((e) {
        debugPrint("no se pudo encontrar la data $e");
      });
    }
  }

  Future<bool> condicion() async {
    await Future.delayed(const Duration(seconds: 2));
    return resp != null ? (resp!.data.data.isNotEmpty ? true : false) : false;
  }

  @override
  void initState() {
    super.initState();
    obtDatosUser();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return FutureBuilder<bool>(
      future: condicion(),
      builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const CircularProgressIndicator(
                    strokeWidth: 4,
                    color: AppTheme.primary,
                  ),
                  SizedBox(
                    height: size.height*0.01,
                  ),
                  const Text(
                    'Verificando existencia de constancias...',
                    style: TextStyle(
                      fontFamily: AppTheme.fontCuerpo,
                      letterSpacing: 3,
                    ),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error de peticion'),
          );
        } else {
          final bool condition = snapshot.data ?? false;
          if (condition) {
            return ConstanciaC(
              resp: resp,
            );
          } else {
            return const Center(
              child: NoHayConstancia(),
            );
          }
        }
      },
    );
  }
}

class ConstanciaC extends StatefulWidget {
  final PeticionConstancias? resp;

  const ConstanciaC({super.key, required this.resp});

  @override
  State<ConstanciaC> createState() => _ConstanciaCState();
}

class _ConstanciaCState extends State<ConstanciaC> {
  void _comenzarDescarga() async {
    final status = await Permission.storage.request();
    if (widget.resp?.data != null) {
      if (widget.resp!.data.data.isNotEmpty) {
        try {
          final String nombreCurso = widget.resp!.data.data[0].curso.nombre;
          final String nombreUser =
              "${widget.resp!.data.data[0].user.nombre}_${widget.resp!.data.data[0].user.apellidoMaterno}_${widget.resp!.data.data[0].user.apellidoPaterno}";
          if (status.isGranted) {
            final baseDirectorio = await getExternalStorageDirectory();
            await FlutterDownloader.enqueue(
                url: widget.resp!.data.data[0].constancias.iktanUrl,
                savedDir: baseDirectorio!.path,
                fileName: '${nombreUser}_$nombreCurso.pdf');
          } else {
            debugPrint("No permision");
          }
        } catch (e) {
          debugPrint('error $e');
        }
      } else {
        debugPrint('No Hay Datos');
      }
    }
  }

  ReceivePort receivePort = ReceivePort();

  @override
  void initState() {
    IsolateNameServer.registerPortWithName(
        receivePort.sendPort, 'descargarConstancia');
    receivePort.listen((message) {});
    FlutterDownloader.registerCallback(downloadCallback);
    super.initState();
  }

  static downloadCallback(id, status, progress) {
    SendPort sendPort =
        IsolateNameServer.lookupPortByName('descargarConstancia')!;
    sendPort.send(progress);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text(
        'Constancia',
        style: TextStyle(
          fontFamily: AppTheme.fontCuerpo,
          letterSpacing: 3,
        ),
      ),
      trailing: IconButton(
        onPressed: () {
          _comenzarDescarga();
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

class NoHayConstancia extends StatelessWidget {
  const NoHayConstancia({super.key});
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
          const Text(
            "No tiene ninguna constancia",
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
