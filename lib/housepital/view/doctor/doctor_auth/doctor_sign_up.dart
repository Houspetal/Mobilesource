import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:grade_project/housepital/view/doctor/doctor_auth/doctor_sign_in.dart';
import 'package:grade_project/housepital/view/widgets/custom_button.dart';

import '../../../logic/doctor_logic/doctor_auth/doctor_auth_cubit.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/utils.dart';

class DoctorSignUpScreen extends StatelessWidget {
  const DoctorSignUpScreen({super.key});

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
                  'Welcome to Housepital 👋',
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
              BlocConsumer<DoctorAuthCubit, DoctorAuthStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Form(
                    key: DoctorAuthCubit.of(context).signupFormKey,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(
                          20 * fem, 32 * fem, 19 * fem, 8 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CustomTextFormField(
                            hint: 'Doctor Name',
                            prefixIcon: FontAwesomeIcons.usersRays,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
                                .registerUsernameController,
                            keyBoardType: TextInputType.name,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (DoctorAuthCubit.of(context)
                                  .registerUsernameController
                                  .text
                                  .isEmpty) {
                                return "Enter Doctor name";
                              }
                              if (DoctorAuthCubit.of(context)
                                      .registerUsernameController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Doctor name at least 6 char";
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
                              if (!DoctorAuthCubit.of(context)
                                  .registerEmailController
                                  .text
                                  .contains("@")) {
                                return "Enter Valid Email contains @";
                              }
                              if (DoctorAuthCubit.of(context)
                                  .registerEmailController
                                  .text
                                  .isEmpty) {
                                return "Enter Email";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
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
                              if (DoctorAuthCubit.of(context)
                                  .registerPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (DoctorAuthCubit.of(context)
                                      .registerPasswordController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Password at least 6 char";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
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
                              if (DoctorAuthCubit.of(context)
                                  .registerRepeatPasswordController
                                  .text
                                  .isEmpty) {
                                return "Enter Password";
                              }
                              if (DoctorAuthCubit.of(context)
                                      .registerRepeatPasswordController
                                      .text
                                      .length <
                                  6) {
                                return "Enter Password at least 6 char";
                              }
                              if (DoctorAuthCubit.of(context)
                                      .registerRepeatPasswordController
                                      .text !=
                                  DoctorAuthCubit.of(context)
                                      .registerPasswordController
                                      .text) {
                                return "Password And the Repeat password aren't the same";
                              }
                              return null;
                            },
                            alignment: Alignment.center,
                            controller: DoctorAuthCubit.of(context)
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
                            controller: DoctorAuthCubit.of(context)
                                .registerPhoneController,
                            keyBoardType: TextInputType.visiblePassword,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (DoctorAuthCubit.of(context)
                                  .registerPhoneController
                                  .text
                                  .isEmpty) {
                                return "Enter phone";
                              }
                              if (DoctorAuthCubit.of(context)
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
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Working Time from when to when',
                            prefixIcon: FontAwesomeIcons.businessTime,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller:
                                DoctorAuthCubit.of(context).timeController,
                            keyBoardType: TextInputType.name,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (DoctorAuthCubit.of(context)
                                  .timeController
                                  .text
                                  .isEmpty) {
                                return "Enter Doctor Working time";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          CustomTextFormField(
                            hint: 'Appointment Fees',
                            prefixIcon: FontAwesomeIcons.circleDollarToSlot,
                            obscureText: false,
                            alignment: Alignment.center,
                            controller:
                                DoctorAuthCubit.of(context).feesController,
                            keyBoardType: TextInputType.number,
                            ffem: ffem,
                            fem: fem,
                            validator: (value) {
                              if (DoctorAuthCubit.of(context)
                                  .feesController
                                  .text
                                  .isEmpty) {
                                return "Enter Appointment fees";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3f3f6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Department :",
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: textColor,
                                  ),
                                ),
                                DropdownButton<String>(
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  value: DoctorAuthCubit.of(context).department,
                                  dropdownColor: const Color(0xfff3f3f6),
                                  onChanged: (String? newValue) {
                                    DoctorAuthCubit.of(context)
                                        .changeDepartment(newValue!);
                                  },
                                  items: DoctorAuthCubit.of(context)
                                      .dropdownItemsDepartments,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xfff3f3f6),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Location :",
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 20 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: textColor,
                                  ),
                                ),
                                DropdownButton<String>(
                                  style: SafeGoogleFont(
                                    'SF Pro Text',
                                    fontSize: 16 * ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5 * ffem / fem,
                                    color: textColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  value: DoctorAuthCubit.of(context).location,
                                  dropdownColor: const Color(0xfff3f3f6),
                                  onChanged: (String? newValue) {
                                    DoctorAuthCubit.of(context)
                                        .changeLocation(newValue!);
                                  },
                                  items: DoctorAuthCubit.of(context)
                                      .dropdownItemsLocations,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          state is DoctorAuthRegisterLoadingState
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
                                    if (DoctorAuthCubit.of(context)
                                        .signupFormKey
                                        .currentState!
                                        .validate()) {
                                      DoctorAuthCubit.of(context)
                                          .doctorRegister(
                                        username: DoctorAuthCubit.of(context)
                                            .registerUsernameController
                                            .text,
                                        password: DoctorAuthCubit.of(context)
                                            .registerRepeatPasswordController
                                            .text,
                                        email: DoctorAuthCubit.of(context)
                                            .registerEmailController
                                            .text,
                                        phone: DoctorAuthCubit.of(context)
                                            .registerPhoneController
                                            .text,
                                        context: context,
                                        fees: DoctorAuthCubit.of(context)
                                            .feesController
                                            .text
                                            .toString(),
                                        department: DoctorAuthCubit.of(context)
                                            .department,
                                        location: DoctorAuthCubit.of(context)
                                            .location,
                                        time: DoctorAuthCubit.of(context)
                                            .timeController
                                            .text,
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
                                          const DoctorSignInScreen(),
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
