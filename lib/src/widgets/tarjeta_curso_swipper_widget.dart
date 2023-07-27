import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import '../models/cursos.dart';
import '../screens/screens.dart';

class TarjetaCursoSwipperWidget extends StatelessWidget {
  final Welcome cursos;
  const TarjetaCursoSwipperWidget({super.key, required this.cursos});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.7,
      child: Swiper(
        itemCount: cursos.data.data.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.5,
        itemBuilder: (BuildContext context, int i) {
          return CardCurso(
              size: size,
              cursoID: cursos.data.data[i].curso.cursoId,
              title: cursos.data.data[i].curso.nombre,
              modulos: cursos.data.data[i].curso.modulos,
              img: cursos.data.data[i].curso.imagenCover.url);
        },
      ),
    );
  }
}

class CardCurso extends StatelessWidget {
  final Size size;
  final String cursoID;
  final String title;
  final List<Modulo>? modulos;
  final String? img;
  const CardCurso(
      {super.key,
      required this.size,
      required this.cursoID,
      required this.title,
      required this.modulos,
      required this.img});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ModulosCursoScreen(cursoID: cursoID, modulos: modulos),
          )),
      child: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: size.height * 0.6,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder:
                    const AssetImage('assets/gifs/loading_mis_cursos.gif'),
                image: NetworkImage((img == null || img == '')
                    ? 'https://i.pinimg.com/originals/59/99/43/5999437a8324f521f60c2f33eb1ed370.gif'
                    : img!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: size.height*0.04,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      title,
                      maxLines: 4,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
