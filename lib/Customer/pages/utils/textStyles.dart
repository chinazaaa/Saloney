import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BoldText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  bool isVeryBold = false;
  final int maxLines;
  final TextOverflow overflow;

  BoldText(this.text, this.size, this.color, {this.maxLines, this.overflow});
  BoldText.veryBold(this.text, this.size, this.color, this.isVeryBold,
      {this.maxLines, this.overflow});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          fontFamily: "nunito",
          fontWeight: isVeryBold ? FontWeight.w900 : FontWeight.w700,
          color: color,
          fontSize: size,
        ));
  }
}

class NormalText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;

  NormalText(this.text, this.color, this.size);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
            fontFamily: "nunito",
            fontWeight: FontWeight.w300,
            color: color,
            fontSize: size));
  }
}
