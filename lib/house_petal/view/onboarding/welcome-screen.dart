import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // welcomescreenadR (2:253)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // dillustration9TZ (2:288)
                  margin:
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 120 * fem),
                  width: 496 * fem,
                  height: 272 * fem,
                  child: Image.asset(
                    'assets/news-app/images/d-illustration.png',
                  ),
                ),
                Container(
                  // logotext7oh (2:291)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 24 * fem),
                  width: 120 * fem,
                  height: 24 * fem,
                  child: Image.asset(
                    'assets/news-app/images/logo-text.png',
                    width: 120 * fem,
                    height: 24 * fem,
                  ),
                ),
                Container(
                  // allnewsinoneplacebethefirsttok (2:293)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 217 * fem,
                  ),
                  child: Text(
                    'All news in one place, be the first to know last news',
                    textAlign: TextAlign.center,
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 16 * ffem,
                      fontWeight: FontWeight.w400,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xff7c81a1),
                    ),
                  ),
                ),
                Container(
                  // autogroupj5cppk3 (BjqBgT8Hruir3j93fhJ5CP)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 64 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // primarybuttonpdZ (2:296)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 10 * fem),
                        width: double.infinity,
                        height: 56 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff475ad6),
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Get Started',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.5 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
