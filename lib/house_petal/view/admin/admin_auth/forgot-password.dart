import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class AdminForgotPasswordScreen extends StatelessWidget {
  const AdminForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            // forgotpasswordN3D (26:404)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // forgotpasswordsnb (26:433)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                  child: Text(
                    'Forgot Password 🤔',
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
                  // weneedyouremailadresssowecanse (26:432)
                  margin:
                      EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                  constraints: BoxConstraints(
                    maxWidth: 336 * fem,
                  ),
                  child: Text(
                    'We need your email adress so we can send you the password reset code.',
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
                  // autogroupa5j1ysZ (Bjq1wKCHTPU7LYQrvtA5j1)
                  padding: EdgeInsets.fromLTRB(
                      20 * fem, 32 * fem, 19 * fem, 8 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextFormField(
                        hint: 'Email Address',
                        prefixIcon: Icons.email_outlined,
                        obscureText: true,
                        alignment: Alignment.center,
                        controller: TextEditingController(),
                        keyBoardType: TextInputType.visiblePassword,
                        ffem: ffem,
                        fem: fem,
                      ),
                      const SizedBox(
                        height: 20,
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
