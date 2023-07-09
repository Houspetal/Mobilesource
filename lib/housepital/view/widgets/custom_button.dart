import 'package:flutter/material.dart';

import 'utils.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    this.onPressed,
    required this.color,
    required this.text,
    this.alignment = Alignment.center,
    this.radius = 5,
    this.width,
    required this.ffem,
    this.textColor = const Color(0xffffffff),
    required this.fem,
  }) : super(key: key);
  final VoidCallback? onPressed;
  final Color color;
  final String text;
  final Color textColor;
  double radius;
  double? width;
  Alignment alignment;
  final double ffem, fem;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: MaterialButton(
          onPressed: onPressed,
          textColor: Colors.white,
          minWidth: width,
          height: 56 * fem,
          child: Text(text,
              style: SafeGoogleFont(
                'SF Pro Text',
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                color: textColor,
              )),
        ),
      ),
    );
  }
}
