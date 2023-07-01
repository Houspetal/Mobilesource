import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import 'utils.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hint,
    this.suffixIcon,
    required this.prefixIcon,
    required this.obscureText,
    required this.alignment,
    required this.controller,
    this.onSave,
    this.onChanged,
    this.validator,
    required this.keyBoardType,
    this.suffixPressed,
    required this.ffem,
    required this.fem,
  }) : super(key: key);
  final String hint;
  final IconData? suffixIcon;
  final String prefixIcon;
  final bool obscureText;
  final Alignment alignment;
  final TextEditingController controller;
  final ValueChanged<String>? onSave;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextInputType keyBoardType;
  final VoidCallback? suffixPressed;
  final double ffem;
  final double fem;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        // emailinputjNs (2:342)
        decoration: BoxDecoration(
          color: const Color(0xfff3f3f6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          controller: controller,
          validator: validator,
          onChanged: onChanged,
          cursorColor: textColor,
          style: SafeGoogleFont(
            'SF Pro Text',
            fontSize: 16 * ffem,
            fontWeight: FontWeight.w500,
            height: 1.5 * ffem / fem,
            color: textColor,
          ),
          // cursorColor: kSecondPrimaryColor,
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(10),
            labelText: hint,
            labelStyle: SafeGoogleFont(
              'SF Pro Text',
              fontSize: 16 * ffem,
              fontWeight: FontWeight.w500,
              height: 1.5 * ffem / fem,
              color: textColor,
            ),
            prefixIcon: Container(
              // envelope21Sgb (2:339)
              margin: EdgeInsets.fromLTRB(17 * fem, 0 * fem, 17 * fem, 0 * fem),
              width: 10 * fem,
              height: 10 * fem,
              child: Image.asset(
                prefixIcon,
                width: 10 * fem,
                height: 10 * fem,
              ),
            ),
            suffixIcon: IconButton(
              icon: Icon(suffixIcon),
              onPressed: suffixPressed,
            ),
            hintStyle: const TextStyle(
              color: Colors.grey,
            ),
            fillColor: const Color(0xfff3f3f6),
          ),
          obscureText: obscureText,
          keyboardType: keyBoardType,
          onFieldSubmitted: onSave,
        ),
      ),
    );
  }
}
