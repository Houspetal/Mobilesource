import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

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
            // bookmarksgpB (14:195)
            width: double.infinity,
            padding: EdgeInsets.only(top: 65 * ffem),
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Bookmarks',
                    style: SafeGoogleFont(
                      'SF Pro Text',
                      fontSize: 24 * ffem,
                      fontWeight: FontWeight.w600,
                      height: 1.3333333333 * ffem / fem,
                      color: const Color(0xff333647),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    'Saved articles to the library\n',
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
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 16 * fem, 18 * fem, 40 * fem),
                  width: 375 * fem,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // articlecontentn5q (14:268)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 39 * fem, 0 * fem),
                        width: double.infinity,
                        height: 96 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // rectangle7vbM (14:269)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 96 * fem,
                              height: 96 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: const Color(0xffc4c4c4),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/images/rectangle-7-bg-R2j.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupar4s8Bd (BjpSv6YrMq9QRUdoTXar4s)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 8 * fem, 0 * fem, 12 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // uiuxdesignpTm (14:271)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                    child: Text(
                                      'UI/UX Design',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4285714286 * ffem / fem,
                                        color: const Color(0xff7c81a1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // asimpletrickforcreatingcolorpa (14:270)
                                    constraints: BoxConstraints(
                                      maxWidth: 185 * fem,
                                    ),
                                    child: Text(
                                      'A Simple Trick For Creating Color Palettes Quickly',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xff333647),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * fem,
                      ),
                      Container(
                        // articlecontentXQ7 (14:272)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 37 * fem, 0 * fem),
                        width: double.infinity,
                        height: 96 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // rectangle7FzK (14:273)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 96 * fem,
                              height: 96 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: const Color(0xffc4c4c4),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/news-app/images/rectangle-7-bg-PFH.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupjym1cCb (BjpTQqDyG9Pv7ukrxFJYM1)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 8 * fem, 0 * fem, 12 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // arto2B (14:275)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                    child: Text(
                                      'Art',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4285714286 * ffem / fem,
                                        color: const Color(0xff7c81a1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // sixstepstocreatingacolorpalett (14:274)
                                    constraints: BoxConstraints(
                                      maxWidth: 187 * fem,
                                    ),
                                    child: Text(
                                      'Six steps to creating a color palette',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xff333647),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * fem,
                      ),
                      Container(
                        // articlecontentE11 (14:276)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 37 * fem, 0 * fem),
                        width: double.infinity,
                        height: 96 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // rectangle7z8b (14:277)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 96 * fem,
                              height: 96 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: const Color(0xffc4c4c4),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/news-app/images/rectangle-7-bg.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // autogrouphzx1X23 (BjpThjuTsJHVZiebMhhZX1)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 8 * fem, 0 * fem, 12 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // colors8nX (14:279)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                    child: Text(
                                      'Colors',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4285714286 * ffem / fem,
                                        color: const Color(0xff7c81a1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // creatingcolorpalettefromworlda (14:278)
                                    constraints: BoxConstraints(
                                      maxWidth: 187 * fem,
                                    ),
                                    child: Text(
                                      'Creating Color Palette from world around you',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xff333647),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 16 * fem,
                      ),
                      Container(
                        // articlecontente27 (14:280)
                        margin: EdgeInsets.fromLTRB(
                            1 * fem, 0 * fem, 0 * fem, 0 * fem),
                        padding: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 39 * fem, 0 * fem),
                        width: double.infinity,
                        height: 96 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // rectangle7b5m (14:281)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 96 * fem,
                              height: 96 * fem,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12 * fem),
                                color: const Color(0xffc4c4c4),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    'assets/news-app/images/rectangle-7-bg-DJs.png',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // autogroupyhlpAo5 (BjpTAFovbqjTHfLGQ2YhLP)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 8 * fem, 0 * fem, 12 * fem),
                              height: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    // uiuxdesignDWT (14:283)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 8 * fem),
                                    child: Text(
                                      'UI/UX Design',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 14 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.4285714286 * ffem / fem,
                                        color: const Color(0xff7c81a1),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // asimpletrickforcreatingcolorpa (14:282)
                                    constraints: BoxConstraints(
                                      maxWidth: 185 * fem,
                                    ),
                                    child: Text(
                                      'A Simple Trick For Creating Color Palettes Quickly',
                                      style: SafeGoogleFont(
                                        'SF Pro Text',
                                        fontSize: 16 * ffem,
                                        fontWeight: FontWeight.w600,
                                        height: 1.5 * ffem / fem,
                                        color: const Color(0xff333647),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
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
