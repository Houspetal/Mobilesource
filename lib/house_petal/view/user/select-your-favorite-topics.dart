import 'package:flutter/material.dart';

import '../../shared/constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/utils.dart';

class Specialities extends StatelessWidget {
  const Specialities({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            // selectyourfavoritetopicshkP (8:429)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // selectyourfavoritetopicsEGT (8:458)
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
                  // selectsomeofyourfavoritetopics (8:457)
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
                  // autogroup8k2ov4j (Bjpkbb68Bbi7SUvjaf8k2o)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupphdmWHq (BjpjQCv4oMEUCaWTaQpHDm)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category1tpB (8:482)
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
                                  '🏈   Sports',
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
                              // category2aKd (8:483)
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
                        // autogroupfkgfVb1 (Bjpjf2phK2jyp4mXuGFKgF)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category3uej (8:486)
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
                              // category4VWT (8:489)
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
                        // autogroupobns4xs (BjpjsC96k2ZeSLnAghobNs)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category5UFu (8:492)
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
                              // category6MDD (8:495)
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
                        // autogroupysuhT9m (Bjpk6wFCZk5HLTkW1UySuH)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category74QT (8:498)
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
                              // category8YD9 (8:501)
                              width: 160 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
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
                                    color: const Color(0xff666c8e),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // autogroupj81rwFH (BjpkJmEpruSDb5yq6kJ81R)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // category9JEF (8:504)
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
                              // category10mX9 (8:507)
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
                      CustomButton(
                        color: primaryColor,
                        text: 'Next',
                        ffem: ffem,
                        fem: fem,
                        width: double.infinity,
                        onPressed: () {},
                        radius: 10,
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
