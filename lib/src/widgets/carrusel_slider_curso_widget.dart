import 'package:cursos/src/models/cursos.dart';
import 'package:cursos/src/screens/screens.dart';
import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class CarruselSliderCursoWidget extends StatefulWidget {
  final Welcome cursos;
  const CarruselSliderCursoWidget({super.key, required this.cursos});

  @override
  State<CarruselSliderCursoWidget> createState() =>
      _CarruselSliderCursosState();
}

class _CarruselSliderCursosState extends State<CarruselSliderCursoWidget> {
  late CarouselSliderController _sliderController;

  @override
  void initState() {
    super.initState();
    _sliderController = CarouselSliderController();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2));
    final Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: SizedBox(
              height: size.height * 0.9,
              child: CarouselSlider.builder(
                unlimitedMode: true,
                controller: _sliderController,
                slideBuilder: (i) {
                  final String imgURL =
                      widget.cursos.data.data[i].curso.imagenCover.url;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ModulosCursoScreen(
                                  cursoID:
                                      widget.cursos.data.data[i].curso.cursoId,
                                  modulos:
                                      widget.cursos.data.data[i].curso.modulos),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              top: size.height * 0.17, left: size.width * 0.04),
                          child: Container(
                            height: size.height * 0.44,
                            width: size.width * 0.8,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            alignment: Alignment.center,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: FadeInImage(
                                height: size.height * 0.40,
                                width: size.width * 0.8,
                                placeholder: const AssetImage(
                                    'assets/gifs/loading_mis_cursos.gif'),
                                image: NetworkImage(imgURL, scale: 1.0),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppTheme.primary,
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              child: ClipRect(
                                  child: Container(
                                    height: size.height * 0.14,
                                    width: size.width * 0.8,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        color: Colors.grey.shade100
                                            .withOpacity(0.01)),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Text(
                                          widget
                                              .cursos.data.data[i].curso.nombre,
                                          textAlign: TextAlign.justify,
                                          style: const TextStyle(
                                            fontFamily: AppTheme.fontCuerpo,
                                            fontSize: 14,
                                            color: AppTheme.baseBlanca,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                slideTransform: const CubeTransform(),
                // slideIndicator: CircularSlideIndicator(
                //   padding: EdgeInsets.only(bottom: 32),
                //   indicatorBorderColor: Colors.black,
                // ),
                itemCount: widget.cursos.data.data.length,
                initialPage: 0,
                enableAutoSlider: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
