import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/constants.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class DoctorChangePasswordScreen extends StatelessWidget {
  const DoctorChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            // changepasswordQAo (26:295)
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: Container(
              padding:
                  EdgeInsets.fromLTRB(20 * fem, 24 * fem, 19 * fem, 10 * fem),
              width: 375 * fem,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // titleWt3 (26:310)
                    margin: EdgeInsets.fromLTRB(
                        0 * fem, 0 * fem, 77.5 * fem, 24 * fem),
                    padding:
                        EdgeInsets.fromLTRB(6 * fem, 0 * fem, 0 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // lefticonPwq (26:312)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 58.5 * fem, 0 * fem),
                          width: 12 * fem,
                          height: 12.01 * fem,
                          child: Image.asset(
                            'assets/news-app/images/left-icon-3VV.png',
                            width: 12 * fem,
                            height: 12.01 * fem,
                          ),
                        ),
                        Text(
                          // changepasswordqYw (26:311)
                          'Change Password',
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
                  CustomTextFormField(
                    hint: "Current Password",
                    prefixIcon: FontAwesomeIcons.userSecret,
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
                    hint: 'New Password',
                    prefixIcon: FontAwesomeIcons.userSecret,
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
                    hint: 'Repeat New Password',
                    prefixIcon: FontAwesomeIcons.userSecret,
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
                  CustomButton(
                    color: primaryColor,
                    text: 'Change Password',
                    ffem: ffem,
                    fem: fem,
                    width: double.infinity,
                    onPressed: () {},
                    radius: 10,
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
