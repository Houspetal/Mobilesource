import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/view/doctor/doctor_auth/doctor_sign_up.dart';
import 'package:grade_project/housepital/view/widgets/custom_text.dart';

import '../../../helper/cache/cache.dart';
import '../../../logic/doctor_logic/doctor_auth/doctor_auth_cubit.dart';
import '../../../shared/constants/colors.dart';
import '../../splash/splash.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/social_sign_in_button.dart';
import '../../widgets/utils.dart';
import 'doctor_forgot_password.dart';

class DoctorSignInScreen extends StatelessWidget {
  const DoctorSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xffffffff),
            borderRadius: BorderRadius.circular(16 * fem),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        20 * fem, 0 * fem, 0 * fem, 8 * fem),
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
                  TextButton(
                      onPressed: () {
                        CacheHelper.remove("appType").then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SplashScreen(),
                              ),
                              (route) => false);
                        });
                      },
                      child: Text(
                        "Change Type",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.josefinSans(
                          fontSize: 18 * ffem,
                          height: 1.3333333333 * ffem / fem,
                          color: primaryColor,
                        ),
                      )),
                ],
              ),
              Container(
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
                padding:
                    EdgeInsets.fromLTRB(20 * fem, 32 * fem, 19 * fem, 8 * fem),
                width: double.infinity,
                child: BlocConsumer<DoctorAuthCubit, DoctorAuthStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Form(
                      key: DoctorAuthCubit.of(context).loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hint: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
                                .loginEmailController,
                            keyBoardType: TextInputType.emailAddress,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (!DoctorAuthCubit.of(context)
                                  .loginEmailController
                                  .text
                                  .contains("@")) {
                                return "Enter Valid Email contains @";
                              }
                              if (DoctorAuthCubit.of(context)
                                  .loginEmailController
                                  .text
                                  .isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: "Password",
                            prefixIcon: FontAwesomeIcons.userSecret,
                            obscureText: DoctorAuthCubit.of(context).isPass,
                            suffixPressed: () {},
                            suffixIcon: DoctorAuthCubit.of(context).isPass
                                ? FontAwesomeIcons.eye
                                : FontAwesomeIcons.eyeSlash,
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
                                .loginPasswordController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (DoctorAuthCubit.of(context)
                                  .loginPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (DoctorAuthCubit.of(context)
                                      .loginPasswordController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Password at least 6 char";
                              }
                              return null;
                            },
                          ),
                          Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorForgotPasswordScreen(),
                                    ),
                                  );
                                },
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
                          state is DoctorAuthLoginLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                )
                              : CustomButton(
                                  color: primaryColor,
                                  text: "Log in",
                                  width: double.infinity,
                                  onPressed: () {
                                    if (DoctorAuthCubit.of(context)
                                        .loginFormKey
                                        .currentState!
                                        .validate()) {
                                      DoctorAuthCubit.of(context).doctorLogin(
                                        password: DoctorAuthCubit.of(context)
                                            .loginPasswordController
                                            .text,
                                        email: DoctorAuthCubit.of(context)
                                            .loginEmailController
                                            .text,
                                        context: context,
                                      );
                                    }
                                  },
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
                            image: FontAwesomeIcons.google,
                            onTap: () {
                              DoctorAuthCubit.of(context)
                                  .signInWithGoogle(context);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SocialSignInButton(
                            ffem: ffem,
                            fem: fem,
                            text: "Sign In with Facebook",
                            image: FontAwesomeIcons.squareFacebook,
                            onTap: () {
                              DoctorAuthCubit.of(context)
                                  .signInWithFacebook(context);
                            },
                          ),
                          SizedBox(
                            height: 92.5 * fem,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const CustomText(
                                text: 'Don\'t have an account?',
                                size: 14,
                                color: textColor,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const DoctorSignUpScreen(),
                                    ),
                                  );
                                },
                                child: const CustomText(
                                  text: 'Sign Up',
                                  size: 14,
                                  color: textColor2,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
