import 'package:flutter/material.dart';
import 'package:grade_project/house_petal/helper/cache/cache.dart';
import 'package:grade_project/house_petal/shared/constants/colors.dart';

import '../widgets/custom_button.dart';
import '../widgets/utils.dart';
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
                      EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 100 * fem),
                  width: 496 * fem,
                  height: 272 * fem,
                  child: Image.asset(
                    'assets/19835.jpg',
                  ),
                ),
                Container(
                  // logotext7oh (2:291)
                  margin:
                      EdgeInsets.fromLTRB(1 * fem, 0 * fem, 0 * fem, 24 * fem),
                  width: 120 * fem,
                  height: 24 * fem,
                  child: Text(
                    'HousePetal',
                    style: TextStyle(color: textColor2, fontSize: 20),
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
                    style: SafeGoogleFont(
                      'SF Pro Text',
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
    );
  }
}
