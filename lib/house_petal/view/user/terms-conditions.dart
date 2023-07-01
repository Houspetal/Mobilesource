import 'package:flutter/material.dart';

import '../widgets/utils.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

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
            // termsconditionsNk3 (26:356)
            width: double.infinity,
            height: 812 * fem,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Stack(
              children: [
                Positioned(
                  // autogroup5e4bDXh (BjpFuFEfpCRXcvLNiB5e4B)
                  left: 0 * fem,
                  top: 44 * fem,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(
                        20 * fem, 24 * fem, 18 * fem, 44 * fem),
                    width: 375 * fem,
                    height: 768 * fem,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // titlekAF (26:375)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 69 * fem, 20 * fem),
                          padding: EdgeInsets.fromLTRB(
                              6 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // lefticonauy (26:377)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 49 * fem, 0 * fem),
                                width: 12 * fem,
                                height: 12.01 * fem,
                                child: Image.asset(
                                  'assets/news-app/images/left-icon-pUb.png',
                                  width: 12 * fem,
                                  height: 12.01 * fem,
                                ),
                              ),
                              Text(
                                // termsconditionsCK5 (26:376)
                                'Terms & Conditions',
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
                          // loremipsumdolorsitametconsecte (26:403)
                          constraints: BoxConstraints(
                            maxWidth: 337 * fem,
                          ),
                          child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.\n\nNemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \n\nNeque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem.',
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: const Color(0xff7c81a1),
                            ),
                          ),
                        ),
                      ],
                    ),
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
