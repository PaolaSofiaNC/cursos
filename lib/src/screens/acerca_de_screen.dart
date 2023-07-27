import 'package:cursos/src/theme/app_theme.dart';
import 'package:cursos/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AcercaDeScreen extends StatelessWidget {
  const AcercaDeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          const FigurasFondoCircularWidget(),
          Column(
            children: [
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset(
                'assets/logos/iktan_training_logo.png',
                height: size.height * 0.15,
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              const Center(
                child: Text(
                  'Iktan Training',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Center(
                child: Text(
                  '1.0.0',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    fontSize: 16,
                    letterSpacing: 3,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              const Center(
                child: Text(
                  '¿Quienes Somos?',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    letterSpacing: 3,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextAboutSection(
                texto:
                    'Somos una empresa comprometida con tu conocimiento y crecimiento en las areas petroleras',
                size: size,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              const Center(
                child: Text(
                  'Visión',
                  style: TextStyle(
                    fontFamily: AppTheme.fontCuerpo,
                    letterSpacing: 3,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              TextAboutSection(
                  texto:
                      'Nuestro objetivo es ofrecer a nuestros clientes soluciones de software de alta calidad, con un enfoque en la usabilidad y la experiencia del usuario.',
                  size: size)
            ],
          ),
        ],
      ),
    );
  }
}

class TextAboutSection extends StatelessWidget {
  const TextAboutSection({super.key, required this.texto, required this.size});

  final String texto;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: SizedBox(
        height: size.height * 0.08,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Text(
            texto,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontFamily: AppTheme.fontCuerpo,
              fontSize: 14,
              letterSpacing: 3,
            ),
          ),
        ),
      ),
    );
  }
}
