import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    required this.size,
    this.weight = FontWeight.normal,
    this.color = Colors.white,
    this.align = Alignment.topLeft,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: align,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'SF Pro Text',
          fontSize: size,
          fontWeight: weight,
          color: color,
        ),
      ),
    );
  }
}
