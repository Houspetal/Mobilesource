import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/view/control/control.dart';
import 'package:grade_project/housepital/view/widgets/custom_toast.dart';

import '../../../helper/cache/cache.dart';
import '../../../model/user_model.dart';
import '../../../shared/constants/constants.dart';
import '../../../view/admin/admin_layout/admin_main_page.dart';

part 'admin_auth_state.dart';

class AdminAuthCubit extends Cubit<AdminAuthStates> {
  AdminAuthCubit() : super(AdminAuthInitial());
  bool isPass = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  bool changePassVisibility() {
    isPass = !isPass;
    emit(AdminAuthChangePasswordVisibilityState());
    return isPass;
  }

  TextEditingController loginUsernameController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  static AdminAuthCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> userLogin({
    required String password,
    required String username,
    required BuildContext context,
  }) async {
    emit(AdminAuthLoginLoadingState());
    try {
      if (password == "admin" && username == "admin") {
        await CacheHelper.setData(key: "uid", value: "admin");
        await CacheHelper.setData(
          key: "user",
          value: json.encode(
            {
              "username": "Mohammed El-Kelany",
              "image": "assets/my_photo.jpg",
              "phone": "+201067140620",
              "email": "www.mohammedfathyali@gmail.com",
              "bio": "The Admin Of the Application",
              "uid": "admin",
              "isApproved": true
            },
          ),
        );

        emit(AdminAuthLoginSuccessState());
        user = UserModel(
          username: "Mohammed El-Kelany",
          image: "assets/my_photo.jpg",
          phone: "+201067140620",
          email: "www.mohammedfathyali@gmail.com",
          bio: "The Admin Of the Application",
          uid: "admin",
          isApproved: true,
        );
        getToast(
          text: "Login Successfully\nWelcome back",
          state: ToastStates.SUCCESS,
        );
        navigateToHome(context);
      } else {
        getToast(text: "You Are Not an Admin", state: ToastStates.ERROR);
        emit(AdminAuthLoginSuccessState());
      }
    } catch (e) {
      emit(AdminAuthLoginErrorState());
      getToast(text: e.toString(), state: ToastStates.ERROR);
    }
  }

  Future<void> signOut(context) async {
    CacheHelper.remove("uid");
    CacheHelper.remove("appType");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ControlScreen(),
      ),
      (route) => false,
    );
    emit(AdminAuthLogoutSuccessState());
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const AdminMainPage(),
        ),
        (route) => false);
  }
}
