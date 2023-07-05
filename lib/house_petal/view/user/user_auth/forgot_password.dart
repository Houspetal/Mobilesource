import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/logic/user_auth/user_auth_cubit.dart';

import '../../../shared/constants/colors.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class UserForgotPasswordScreen extends StatelessWidget {
  const UserForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xffffffff),
              borderRadius: BorderRadius.circular(16 * fem),
            ),
            child: BlocConsumer<UserAuthCubit, UserAuthStates>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return Form(
                  key: UserAuthCubit.of(context).resetPasswordFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            20 * fem, 0 * fem, 0 * fem, 8 * fem),
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
                        margin: EdgeInsets.fromLTRB(
                            20 * fem, 0 * fem, 0 * fem, 0 * fem),
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
                        padding: EdgeInsets.fromLTRB(
                            20 * fem, 32 * fem, 19 * fem, 8 * fem),
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                              hint: 'Email Address',
                              prefixIcon: Icons.email_outlined,
                              obscureText: false,
                              validator: (value) {
                                if (!UserAuthCubit.of(context)
                                    .resetPasswordEmailController
                                    .text
                                    .contains("@")) {
                                  return "Enter Valid Email contains @";
                                }
                                if (UserAuthCubit.of(context)
                                    .resetPasswordEmailController
                                    .text
                                    .isEmpty) {
                                  return "Enter Email";
                                }
                                return null;
                              },
                              alignment: Alignment.center,
                              controller: UserAuthCubit.of(context)
                                  .resetPasswordEmailController,
                              keyBoardType: TextInputType.visiblePassword,
                              ffem: ffem,
                              fem: fem,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            state is UserAuthChangePasswordLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator(
                                      color: primaryColor,
                                    ),
                                  )
                                : CustomButton(
                                    color: primaryColor,
                                    text: 'Next',
                                    ffem: ffem,
                                    fem: fem,
                                    width: double.infinity,
                                    onPressed: () {
                                      UserAuthCubit.of(context).resetPassword(
                                        email: UserAuthCubit.of(context)
                                            .resetPasswordEmailController
                                            .text,
                                        context: context,
                                      );
                                    },
                                    radius: 10,
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
