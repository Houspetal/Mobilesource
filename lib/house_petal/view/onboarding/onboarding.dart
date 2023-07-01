import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70.0),
          child: Container(
            // onboardingMVd (26:563)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // imagesQ6X (26:604)
                  width: double.infinity,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // rectangle16djy (26:596)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 28 * fem, 0 * fem),
                        width: 16 * fem,
                        height: 288 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12 * fem),
                            bottomRight: Radius.circular(12 * fem),
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/news-app/images/rectangle-16-bg.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // rectangle18cbu (26:598)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 27 * fem, 0 * fem),
                        width: 288 * fem,
                        height: 336 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * fem),
                          color: const Color(0xffc4c4c4),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/news-app/images/rectangle-18-bg.png',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        // rectangle17LgK (26:597)
                        width: 16 * fem,
                        height: 288 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xffc4c4c4),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12 * fem),
                            bottomLeft: Radius.circular(12 * fem),
                          ),
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              'assets/news-app/images/rectangle-17-bg.png',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // autogroupsws7SMy (BjqCGmUSmyC6VpbU1sSWS7)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 40 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // steps4u9 (26:603)
                        margin: EdgeInsets.fromLTRB(
                            140 * fem, 0 * fem, 140 * fem, 34 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // rectangle196aw (26:600)
                              width: 24 * fem,
                              height: 8 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4 * fem),
                                color: const Color(0xff475ad6),
                              ),
                            ),
                            SizedBox(
                              width: 8 * fem,
                            ),
                            Container(
                              // rectangle20PyM (26:601)
                              width: 8 * fem,
                              height: 8 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4 * fem),
                                color: const Color(0xfff3f3f6),
                              ),
                            ),
                            SizedBox(
                              width: 8 * fem,
                            ),
                            Container(
                              // rectangle21rc3 (26:602)
                              width: 8 * fem,
                              height: 8 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4 * fem),
                                color: const Color(0xfff3f3f6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // firsttoknowYjm (26:599)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 24 * fem),
                        child: Text(
                          'First to know',
                          textAlign: TextAlign.center,
                          style: SafeGoogleFont(
                            'SF Pro Text',
                            fontSize: 24 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.3333333333 * ffem / fem,
                            color: const Color(0xff333647),
                          ),
                        ),
                      ),
                      Container(
                        // allnewsinoneplacebethefirsttok (26:570)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 64 * fem),
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
                        // primarybuttonJPV (26:567)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 37 * fem),
                        width: double.infinity,
                        height: 56 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff475ad6),
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Next',
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
