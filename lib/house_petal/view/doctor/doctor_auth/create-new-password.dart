import 'package:flutter/material.dart';

import '../../../shared/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class DoctorCreateNewPasswordScreen extends StatelessWidget {
  const DoctorCreateNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // createnewpasswordTs9 (26:507)
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Container(
                // createnewpasswordLT5 (26:528)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                child: Text(
                  'Create New Password 🔒',
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
                // youcancreateanewpasswordplease (26:527)
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 0 * fem),
                constraints: BoxConstraints(
                  maxWidth: 335 * fem,
                ),
                child: Text(
                  'You can create a new password, please dont forget it too.',
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
                // autogroupxl1r4fu (BjpybJGb42pMSMmaPLxL1R)
                padding:
                    EdgeInsets.fromLTRB(20 * fem, 32 * fem, 19 * fem, 8 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomTextFormField(
                      hint: "New Password",
                      prefixIcon: "assets/news-app/images/padlock-2-1-7gP.png",
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
                      hint: "Repeat New Password",
                      prefixIcon: "assets/news-app/images/padlock-2-1-7gP.png",
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
                    CustomButton(
                      color: primaryColor,
                      text: "Confirm",
                      ffem: ffem,
                      fem: fem,
                      width: double.infinity,
                      onPressed: () {},
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
    );
  }
}
