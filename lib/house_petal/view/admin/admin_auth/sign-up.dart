import 'package:flutter/material.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class AdminSignUpScreen extends StatelessWidget {
  const AdminSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 70),
          child: Container(
            // signupDYX (8:136)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // welcometonuntiumcMh (8:165)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                  child: Text(
                    'Welcome to Nuntium 👋',
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
                  // helloiguessyouarenewaroundhere (8:164)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 316 * fem,
                  ),
                  child: Text(
                    'Hello, I guess you are new around here. You can start using the application after sign up.',
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
                  // autogroup95fqPHu (BjpxNVyDqyt77SHFgr95fq)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hint: 'Username',
                        prefixIcon: "assets/news-app/images/user-5-1-JJo.png",
                        obscureText: false,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.name,
                        ffem: ffem,
                        fem: fem,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hint: 'Email Address',
                        prefixIcon:
                            "assets/news-app/images/envelope-2-1-VBR.png",
                        obscureText: false,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.emailAddress,
                        ffem: ffem,
                        fem: fem,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hint: 'Password',
                        prefixIcon:
                            "assets/news-app/images/padlock-2-1-aWX.png",
                        obscureText: true,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.visiblePassword,
                        ffem: ffem,
                        fem: fem,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hint: 'Repeat Password',
                        prefixIcon:
                            "assets/news-app/images/padlock-2-1-aWX.png",
                        obscureText: true,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.visiblePassword,
                        ffem: ffem,
                        fem: fem,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        // primarybuttonXQf (8:149)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 150 * fem),
                        width: double.infinity,
                        height: 56 * fem,
                        decoration: BoxDecoration(
                          color: const Color(0xff475ad6),
                          borderRadius: BorderRadius.circular(12 * fem),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
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
                            'Already Have an Account?',
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
                              ' Sign in',
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
