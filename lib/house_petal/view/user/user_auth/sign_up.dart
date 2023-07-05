import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grade_project/house_petal/shared/constants/colors.dart';
import 'package:grade_project/house_petal/view/user/user_auth/sign_in.dart';
import 'package:grade_project/house_petal/view/widgets/custom_button.dart';

import '../../../logic/user_auth/user_auth_cubit.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class UserSignUpScreen extends StatelessWidget {
  const UserSignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
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
                margin:
                    EdgeInsets.fromLTRB(20 * fem, 0 * fem, 0 * fem, 8 * fem),
                child: Text(
                  'Welcome to HousePetal 👋',
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
              BlocConsumer<UserAuthCubit, UserAuthStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return Form(
                    key: UserAuthCubit.of(context).signupFormKey,
                    child: Container(
                      // autogroup95fqPHu (BjpxNVyDqyt77SHFgr95fq)
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 32 * fem, 19 * fem, 8 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hint: 'Username',
                            prefixIcon: FontAwesomeIcons.usersRays,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .registerUsernameController,
                            keyBoardType: TextInputType.name,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (UserAuthCubit.of(context)
                                  .registerUsernameController
                                  .text
                                  .isEmpty) {
                                return "Enter Username";
                              }
                              if (UserAuthCubit.of(context)
                                      .registerUsernameController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Username at least 6 char";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Email Address',
                            prefixIcon: Icons.email_outlined,
                            obscureText: false,
                            validator: (value) {
                              if (!UserAuthCubit.of(context)
                                  .registerEmailController
                                  .text
                                  .contains("@")) {
                                return "Enter Valid Email contains @";
                              }
                              if (UserAuthCubit.of(context)
                                  .registerEmailController
                                  .text
                                  .isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .registerEmailController,
                            keyBoardType: TextInputType.emailAddress,
                            ffem: ffem,
                            fem: fem,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Password',
                            prefixIcon: FontAwesomeIcons.userSecret,
                            obscureText: true,
                            validator: (value) {
                              if (UserAuthCubit.of(context)
                                  .registerPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (UserAuthCubit.of(context)
                                      .registerPasswordController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Password at least 6 char";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .registerPasswordController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Repeat Password',
                            prefixIcon: FontAwesomeIcons.userSecret,
                            obscureText: true,
                            validator: (value) {
                              if (UserAuthCubit.of(context)
                                  .registerRepeatPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (UserAuthCubit.of(context)
                                      .registerRepeatPasswordController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Password at least 6 char";
                              }
                              if (UserAuthCubit.of(context)
                                      .registerRepeatPasswordController
                                      .text !=
                                  UserAuthCubit.of(context)
                                      .registerPasswordController
                                      .text) {
                                return "Password And the Repeat password aren't the same";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .registerRepeatPasswordController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Phone',
                            prefixIcon: FontAwesomeIcons.mobile,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller: UserAuthCubit.of(context)
                                .registerPhoneController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (UserAuthCubit.of(context)
                                  .registerPhoneController
                                  .text
                                  .isEmpty) {
                                return "Enter phone";
                              }
                              if (UserAuthCubit.of(context)
                                      .registerPhoneController
                                      .text
                                      .length !=
                                  11) {
                                return "Enter phone with 11 numbers";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          state is UserAuthRegisterLoadingState
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: primaryColor,
                                  ),
                                )
                              : CustomButton(
                                  color: primaryColor,
                                  text: "Sign Up",
                                  ffem: ffem,
                                  fem: fem,
                                  width: double.infinity,
                                  onPressed: () {
                                    if (UserAuthCubit.of(context)
                                        .signupFormKey
                                        .currentState!
                                        .validate()) {
                                      UserAuthCubit.of(context).userRegister(
                                        username: UserAuthCubit.of(context)
                                            .registerUsernameController
                                            .text,
                                        password: UserAuthCubit.of(context)
                                            .registerRepeatPasswordController
                                            .text,
                                        email: UserAuthCubit.of(context)
                                            .registerEmailController
                                            .text,
                                        phone: UserAuthCubit.of(context)
                                            .registerPhoneController
                                            .text,
                                        context: context,
                                      );
                                    }
                                  },
                                ),
                          SizedBox(
                            height: 150 * fem,
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
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const UserSignInScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(
                                  ' Log in',
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
