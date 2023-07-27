import 'package:flutter/material.dart';

class FiguraManchaWidget extends StatelessWidget {
  final Color color;
  final double pTop;
  final double pRight;
  final double pBottom;
  final double pLeft;
  const FiguraManchaWidget(
      {super.key,
      required this.color,
      required this.pTop,
      required this.pRight,
      required this.pBottom,
      required this.pLeft});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Padding(
        padding: EdgeInsets.only(
            top: pTop, right: pRight, bottom: pBottom, left: pLeft),
        child: Container(
          color: color,
          height: size.height*0.37,
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(100, size.height / 500);
    path.cubicTo(size.width / 2, 2 * (size.height / 2), 2 * (size.width / 3),
        size.height / 3, size.width, size.height * 0.9);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
