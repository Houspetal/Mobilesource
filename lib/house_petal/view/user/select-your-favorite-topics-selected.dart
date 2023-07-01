import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class Scene extends StatelessWidget {
  const Scene({super.key});

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
            // selectyourfavoritetopicsselect (8:570)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // selectyourfavoritetopics79d (8:608)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                  child: Text(
                    'Select your favorite topics',
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
                  // selectsomeofyourfavoritetopics (8:607)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 286 * fem,
                  ),
                  child: Text(
                    'Select some of your favorite topics to let us suggest better news for you.',
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
                  // autogroupxd3roaB (BjphE23Kt9BGK7Qfy5Xd3R)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupq8ybE9h (BjpfkZVijKxsZXYvnpQ8Yb)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category1NQK (8:604)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff475ad6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🏈   Sports',
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
                            Container(
                              // category2RG7 (8:601)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '⚖️   Politics',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupu683XTZ (Bjpg9JLqCbvEYEcVpMu683)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category3aRq (8:598)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🌞   Life',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // category4cmq (8:595)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🎮   Gaming',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupzjb1PAK (BjpgQTaEr7tUXNesqPZjB1)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category5N2F (8:592)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🐻   Animals',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // category6GG3 (8:589)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🌴   Nature',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupmb31QmZ (BjpgexA6DxwFmD8eU4mB31)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category7PG7 (8:586)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🍔   Food',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // category8Q4j (8:583)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xff475ad6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '🎨   Art',
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
                      Container(
                        // autogroup5r999Aj (Bjpgrn9iX8JC1qMyZL5r99)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category98oM (8:580)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 16 * fem, 0 * fem),
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '📜   History',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              // category101Es (8:577)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '👗   Fashion',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // primarybuttonWaw (8:574)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 111 * fem),
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
                      Container(
                        // homeindicatorf6T (8:573)
                        margin: EdgeInsets.fromLTRB(
                            101 * fem, 0 * fem, 101 * fem, 0 * fem),
                        width: double.infinity,
                        height: 5 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100 * fem),
                          color: const Color(0xff22242f),
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
