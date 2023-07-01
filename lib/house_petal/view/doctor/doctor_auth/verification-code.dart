import 'package:flutter/material.dart';

import '../../widgets/utils.dart';

class DoctorVerificationCodeScreen extends StatelessWidget {
  const DoctorVerificationCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Container(
            // verificationcodethy (26:455)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // verificationcodeDfh (26:469)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                  child: Text(
                    'Verification Code ✅',
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
                  // youneedtoenter4digitcodewesend (26:468)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 308 * fem,
                  ),
                  child: Text(
                    'You need to enter 4-digit code we send to your email adress.',
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
                  // autogroup8hgxR31 (Bjpzw1Y6pApG1YiUi18hgX)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        // autogroupq9wbfCF (BjpzXwNDD4QAfBsbzHQ9Wb)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        height: 72 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              // numberinputsJK (26:497)
                              width: 72 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '1',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff333647),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16 * fem,
                            ),
                            Container(
                              // numberinputX1V (26:498)
                              width: 72 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '2',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff333647),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16 * fem,
                            ),
                            Container(
                              // numberinputDHd (26:501)
                              width: 72 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: const Color(0xff475ad6)),
                                color: const Color(0xffffffff),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '3',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff475ad6),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 16 * fem,
                            ),
                            Container(
                              // numberinputvLT (26:504)
                              width: 72 * fem,
                              height: double.infinity,
                              decoration: BoxDecoration(
                                color: const Color(0xfff3f3f6),
                                borderRadius: BorderRadius.circular(12 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  '-',
                                  textAlign: TextAlign.center,
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w600,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff7c81a1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // primarybuttonZnj (26:460)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 402 * fem),
                        width: double.infinity,
                        height: 56 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff475ad6),
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Confirm',
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Didn’t receive an email?',
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 2 * ffem / fem,
                              color: const Color(0xff7c81a1),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              ' Send again',
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 2 * ffem / fem,
                                color: const Color(0xff333647),
                              ),
                            ),
                          ),
                        ],
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
