import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class Languages extends StatelessWidget {
  const Languages({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // languageR7h (26:206)
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16 * fem),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.fromLTRB(20 * fem, 24 * fem, 19 * fem, 30 * fem),
                width: 375 * fem,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      // titleNSF (26:238)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 118.5 * fem, 24 * fem),
                      padding: EdgeInsets.fromLTRB(
                          6 * fem, 0 * fem, 0 * fem, 0 * fem),
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // lefticonGGj (26:277)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 98.5 * fem, 0 * fem),
                            width: 12 * fem,
                            height: 12.01 * fem,
                            child: Image.asset(
                              'assets/news-app/images/left-icon-DVV.png',
                              width: 12 * fem,
                              height: 12.01 * fem,
                            ),
                          ),
                          Text(
                            // languagev6P (26:242)
                            'Language',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 24 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 1.3333333333 * ffem / fem,
                              color: const Color(0xff333647),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // englishRJ3 (26:227)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 16 * fem),
                      padding: EdgeInsets.fromLTRB(
                          24 * fem, 16 * fem, 20.97 * fem, 16 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff475ad6),
                        borderRadius: BorderRadius.circular(12 * fem),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // englishqsZ (26:229)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 225.98 * fem, 0 * fem),
                            child: Text(
                              'English',
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w600,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            // check41JWF (26:279)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0.05 * fem, 0 * fem, 0 * fem),
                            width: 14.05 * fem,
                            height: 10.22 * fem,
                            child: Image.asset(
                              'assets/news-app/images/check-4-1.png',
                              width: 14.05 * fem,
                              height: 10.22 * fem,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // turkishkt3 (26:281)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 16 * fem),
                      padding: EdgeInsets.fromLTRB(
                          24 * fem, 16 * fem, 24 * fem, 16 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfff3f3f6),
                        borderRadius: BorderRadius.circular(12 * fem),
                      ),
                      child: Text(
                        'Turkish',
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff666c8e),
                        ),
                      ),
                    ),
                    Container(
                      // germansbH (26:286)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 16 * fem),
                      padding: EdgeInsets.fromLTRB(
                          24 * fem, 16 * fem, 24 * fem, 16 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfff3f3f6),
                        borderRadius: BorderRadius.circular(12 * fem),
                      ),
                      child: Text(
                        'German',
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff666c8e),
                        ),
                      ),
                    ),
                    Container(
                      // spanishGtK (26:289)
                      padding: EdgeInsets.fromLTRB(
                          24 * fem, 16 * fem, 24 * fem, 16 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xfff3f3f6),
                        borderRadius: BorderRadius.circular(12 * fem),
                      ),
                      child: Text(
                        'Spanish',
                        style: SafeGoogleFont(
                          'SF Pro Text',
                          fontSize: 16 * ffem,
                          fontWeight: FontWeight.w600,
                          height: 1.5 * ffem / fem,
                          color: const Color(0xff666c8e),
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
    );
  }
}
