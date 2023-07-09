import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/view/splash/splash.dart';

import '../../../helper/cache/cache.dart';
import '../../../logic/admin_logic/admin_auth/admin_auth_cubit.dart';
import '../../../shared/constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class AdminSignInScreen extends StatelessWidget {
  const AdminSignInScreen({super.key});

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
                      20 * fem,
                      0 * fem,
                      0 * fem,
                      8 * fem,
                    ),
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
                child: BlocConsumer<AdminAuthCubit, AdminAuthStates>(
                  listener: (context, state) {
                    // TODO: implement listener
                  },
                  builder: (context, state) {
                    return Form(
                      key: AdminAuthCubit.of(context).loginFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hint: "Admin Name",
                            prefixIcon: Icons.verified_user,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller: AdminAuthCubit.of(context)
                                .loginUsernameController,
                            keyBoardType: TextInputType.name,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (AdminAuthCubit.of(context)
                                  .loginUsernameController
                                  .text
                                  .isEmpty) {
                                return "Enter Username";
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
                            controller: AdminAuthCubit.of(context)
                                .loginPasswordController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (AdminAuthCubit.of(context)
                                  .loginPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          state is AdminAuthLoginLoadingState
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
                                    if (AdminAuthCubit.of(context)
                                        .loginFormKey
                                        .currentState!
                                        .validate()) {
                                      AdminAuthCubit.of(context).userLogin(
                                        password: AdminAuthCubit.of(context)
                                            .loginPasswordController
                                            .text,
                                        username: AdminAuthCubit.of(context)
                                            .loginUsernameController
                                            .text,
                                        context: context,
                                      );
                                    }
                                  },
                                  radius: 10,
                                  ffem: ffem,
                                  fem: fem,
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
