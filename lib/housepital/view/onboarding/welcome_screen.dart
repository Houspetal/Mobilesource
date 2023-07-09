import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/helper/cache/cache.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';

import '../widgets/custom_button.dart';
import 'onboarding.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.0 * fem),
          child: SizedBox(
            width: double.infinity,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(16 * fem),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 0 * fem, 100 * fem),
                    width: 496 * fem,
                    height: 272 * fem,
                    child: Image.asset(
                      'assets/19835.jpg',
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        1 * fem, 0 * fem, 0 * fem, 24 * fem),
                    width: 120 * fem,
                    height: 35 * fem,
                    child: Text(
                      'Housepital',
                      style: GoogleFonts.josefinSans(
                        fontSize: 24 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.3333333333 * ffem / fem,
                        color: const Color(0xff333647),
                      ),
                    ),
                  ),
                  Container(
                    margin:
                        EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 0 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 217 * fem,
                    ),
                    child: Text(
                      'Your health is in one place.There are nothing more important than wellness',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.josefinSans(
                        fontSize: 16 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.5 * ffem / fem,
                        color: const Color(0xff7c81a1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        20 * fem, 50 * fem, 20 * fem, 0 * fem),
                    child: CustomButton(
                      color: primaryColor,
                      text: "Get Started",
                      ffem: ffem,
                      fem: fem,
                      width: double.infinity,
                      onPressed: () {
                        CacheHelper.setData(
                          key: "starting",
                          value: true,
                        ).then(
                          (value) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const OnBoardingScreen(),
                              ),
                              (route) => false,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
