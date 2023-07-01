import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/social_sign_in_button.dart';
import '../../widgets/utils.dart';

class AdminSignInScreen extends StatelessWidget {
  const AdminSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 100,
          ),
          child: Container(
            // signingpb (2:304)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // welcomebackMxf (2:337)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                  child: Text(
                    'Welcome Back 👋',
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
                  // iamhappytoseeyouagainyoucancon (2:311)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 306 * fem,
                  ),
                  child: Text(
                    'I am happy to see you again. You can continue where you left off by logging in',
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
                  // autogroupabdm8dy (BjqACAGjsWMdN1q3FzabDM)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hint: "Email Address",
                        prefixIcon:
                            'assets/news-app/images/envelope-2-1-LP5.png',
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
                        hint: "Password",
                        prefixIcon:
                            'assets/news-app/images/padlock-2-1-X7y.png',
                        obscureText: false,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.emailAddress,
                        ffem: ffem,
                        fem: fem,
                      ),
                      Align(
                        alignment: AlignmentDirectional.topEnd,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.0),
                          child: TextButton(
                            // forgotpasswordBzs (2:350)
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              textAlign: TextAlign.end,
                              style: SafeGoogleFont(
                                'SF Pro Text',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 1.5 * ffem / fem,
                                color: textColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CustomButton(
                        color: primaryColor,
                        text: "Sign In",
                        width: double.infinity,
                        radius: 10,
                        ffem: ffem,
                        fem: fem,
                      ),
                      Container(
                        // or1F9 (2:351)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 30 * fem, 3 * fem, 30 * fem),
                        child: Text(
                          'or',
                          style: SafeGoogleFont(
                            'SF Pro Text',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff7c81a1),
                          ),
                        ),
                      ),
                      SocialSignInButton(
                        ffem: ffem,
                        fem: fem,
                        text: "Sign In with Google",
                        image: "assets/news-app/images/google-logo.png",
                        onTap: () {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SocialSignInButton(
                        ffem: ffem,
                        fem: fem,
                        text: "Sign In with Facebook",
                        image: "assets/news-app/images/facebook-logo.png",
                        onTap: () {},
                      ),
                      SizedBox(
                        height: 92.5 * fem,
                      ),
                      Container(
                        // donthaveanaccountsignupZ9V (5:0)
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 1 * fem, 29 * fem),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w600,
                              height: 2 * ffem / fem,
                              color: const Color(0xff333647),
                            ),
                            children: [
                              TextSpan(
                                text: 'Don\'t have an account?',
                                style: SafeGoogleFont(
                                  'SF Pro Text',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 2 * ffem / fem,
                                  color: const Color(0xff555a76),
                                ),
                              ),
                              TextSpan(
                                text: ' Sign Up',
                                style: SafeGoogleFont(
                                  'SF Pro Text',
                                  fontSize: 16 * ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 2 * ffem / fem,
                                  color: const Color(0xff333647),
                                ),
                              ),
                            ],
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
