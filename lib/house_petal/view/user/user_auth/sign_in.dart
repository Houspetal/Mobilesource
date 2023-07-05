import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grade_project/house_petal/view/user/user_auth/forgot_password.dart';
import 'package:grade_project/house_petal/view/user/user_auth/sign_up.dart';
import 'package:grade_project/house_petal/view/widgets/custom_text.dart';

import '../../../logic/user_auth/user_auth_cubit.dart';
import '../../../shared/constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/social_sign_in_button.dart';
import '../../widgets/utils.dart';

class UserSignInScreen extends StatelessWidget {
  const UserSignInScreen({super.key});

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
              Container(
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
                child: BlocConsumer<UserAuthCubit, UserAuthStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Form(
                      key: UserAuthCubit.of(context).loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hint: "Email Address",
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller:
                                UserAuthCubit.of(context).loginEmailController,
                            keyBoardType: TextInputType.emailAddress,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (!UserAuthCubit.of(context)
                                  .loginEmailController
                                  .text
                                  .contains("@")) {
                                return "Enter Valid Email contains @";
                              }
                              if (UserAuthCubit.of(context)
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
                            obscureText: true,
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .loginPasswordController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (UserAuthCubit.of(context)
                                  .loginPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (UserAuthCubit.of(context)
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
                                          const UserForgotPasswordScreen(),
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
                          state is UserAuthLoginLoadingState
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
                                    if (UserAuthCubit.of(context)
                                        .loginFormKey
                                        .currentState!
                                        .validate()) {
                                      UserAuthCubit.of(context).userLogin(
                                        password: UserAuthCubit.of(context)
                                            .loginPasswordController
                                            .text,
                                        email: UserAuthCubit.of(context)
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
                              UserAuthCubit.of(context)
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
                              UserAuthCubit.of(context)
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
                                          const UserSignUpScreen(),
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
