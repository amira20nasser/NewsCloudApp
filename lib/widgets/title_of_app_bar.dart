import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../colors_const.dart';

class TitleOfAppBar extends StatelessWidget {
  const TitleOfAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "News",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 27,
          ),
        ),
        AnimatedTextKit(
          repeatForever: true,
          pause: const Duration(seconds: 180),
          animatedTexts: [
            ColorizeAnimatedText(
              "Cloud",
              speed: const Duration(milliseconds: 400),
              textStyle: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 27,
              ),
              colors: [
                yankeesBlue,
                semonDark,
              ],
            ),
          ],
        ),
      ],
    );
  }
}
