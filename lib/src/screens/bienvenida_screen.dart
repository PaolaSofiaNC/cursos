import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:cursos/src/presentation/Providers/providers.dart';

class BienvenidaScreen extends StatelessWidget {
  const BienvenidaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          const FigurasFondoCircularWidget(),
          const ContenedorLogo(),
          const TextosBienvenida(),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.63,
              ),
              const BotonBienvenida(),
            ],
          )
        ],
      ),
    );
  }
}

class ContenedorLogo extends StatelessWidget {
  const ContenedorLogo({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height * 0.1,
        ),
        Center(
          child: SizedBox(
            width: size.width * 0.3,
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/logos/iktan_training_logo.png',
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: size.width * 0.75,
            padding: const EdgeInsets.only(top: 5),
            child: const Image(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/logos/texto_Iktan_Training.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextosBienvenida extends StatelessWidget {
  const TextosBienvenida({super.key});
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.45,
          ),
          Text(
            'BIENVENIDO',
            style: TextStyle(
                fontFamily: AppTheme.fontTitle,
                fontSize: 35,
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
                color: AppTheme.primary,
                shadows: [
                  Shadow(
                      offset: const Offset(1, 1),
                      color: AppTheme.primary.withOpacity(0.4),
                      blurRadius: 2),
                  Shadow(
                      offset: const Offset(1, 1),
                      color: AppTheme.primary.withOpacity(0.2),
                      blurRadius: 2)
                ]),
          ),
          const Text(
            'POR FAVOR INICIA SESIÓN PARA USAR LA APLICACIÓN',
            style: TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }
}

class BotonBienvenida extends StatelessWidget {
  const BotonBienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    final datoLoginP = context.watch<ValidatorLoginProvider>();
    final Size size = MediaQuery.of(context).size;
    return Center(
      child: InkWell(
        onTap: () {
          datoLoginP.setEmail = ' ';
          datoLoginP.setContra = ' ';
          datoLoginP.setRespLogin = ' ';
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        },
        child: Container(
          height: size.height * 0.07,
          width: size.width * 0.6,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(-2, 2),
                  blurRadius: 2.0,
                  color: Colors.black12),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Row(
            children: [
              Container(
                height: size.height * 0.07,
                width: size.width * 0.46,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30.0),
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(70.0),
                    topLeft: Radius.circular(70.0),
                    bottomRight: Radius.circular(200),
                  ),
                ),
                child: const Text(
                  'INICIAR',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'sans-serif',
                    letterSpacing: 4,
                    color: AppTheme.baseBlanca,
                  ),
                ),
              ),
              Icon(
                Icons.arrow_circle_right_outlined,
                size: size.height * 0.045,
                color: AppTheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
