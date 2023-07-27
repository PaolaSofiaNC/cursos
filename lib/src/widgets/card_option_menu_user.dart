import 'package:cursos/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CardOptionMenuUserWidget extends StatelessWidget {
  final String urlImg;
  final String title;
  final VoidCallback onTap;

  const CardOptionMenuUserWidget(
      {super.key,
      required this.urlImg,
      required this.title,
      required this.onTap});

  @override
Widget build(BuildContext context) {
  final Size size = MediaQuery.of(context).size;
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: size.width * 0.40,
      height: size.height * 0.15,
      child: Card(
        color: AppTheme.primary,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    urlImg,
                    width: size.width * 0.15,
                  ),
                ),
                 SizedBox(
                  height: size.height*0.01,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: AppTheme.fontCuerpo,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
}