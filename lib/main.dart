import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:cursos/src/presentation/Providers/providers.dart';
import 'package:cursos/src/providers/providers.dart';
import 'package:cursos/src/config/providers/providers.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/theme/app_theme.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  FlutterDownloader.initialize(debug: true);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const MyApp(),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BotonContrasena()),
        ChangeNotifierProvider(
            create: (context) => BotonContrasenaActualProvider()),
        ChangeNotifierProvider(
            create: (context) => BotonNuevaContrasenaProvider()),
        ChangeNotifierProvider(
            create: (context) => BotonConfirmarContrasenaNewProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => UsuarioProvider()),
        ChangeNotifierProvider(create: (context) => GetTokProvider()),

        //VALIDAR FORMULARIOS
        ChangeNotifierProvider(
            create: (context) => ValidacionUpdatePassProvider()),

        ChangeNotifierProvider(create: (context) => ValidatorLoginProvider()),
        ChangeNotifierProvider(
            create: (context) => ValidacionUpdateDatosProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Iktan Training',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'login': (_) => const LoginScreen(),
          'user': (_) => const UserScreen(),
          'formularioPerfil': (_) => const FormularioPerfilScreen(),
          'formularioContrasena': (_) =>
              const FormularioActualizarContrasenaScreen(),
          'acercaDe': (_) => const AcercaDeScreen(),
          'constancias': (_) => const ConstanciasScreen(),
          'contactanos': (_) => const ContactanosScreen(),
        },
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
