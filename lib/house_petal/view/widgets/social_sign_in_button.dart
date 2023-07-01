import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import 'utils.dart';

class SocialSignInButton extends StatelessWidget {
  const SocialSignInButton({
    Key? key,
    required this.ffem,
    required this.fem,
    required this.text,
    required this.image,
    required this.onTap,
  }) : super(key: key);
  final double ffem, fem;
  final String text, image;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xff666c8e).withOpacity(.2)),
      ),
      child: MaterialButton(
        padding: const EdgeInsets.all(15),
        onPressed: () {
          onTap();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // googlelogodpF (2:355)
              margin:
                  EdgeInsets.fromLTRB(0 * fem, 0 * fem, 61.5 * fem, 0 * fem),
              width: 24 * fem,
              height: 24 * fem,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              // signinwithgooglegGj (2:354)
              text,
              textAlign: TextAlign.center,
              style: SafeGoogleFont(
                'SF Pro Text',
                fontSize: 16 * ffem,
                fontWeight: FontWeight.w600,
                height: 1.5 * ffem / fem,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
