import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grade_project/house_petal/view/control/control.dart';
import 'package:grade_project/house_petal/view/user/user_auth/sign_in.dart';
import 'package:grade_project/house_petal/view/widgets/custom_toast.dart';

import '../../helper/cache/cache.dart';
import '../../model/user_model.dart';
import '../../shared/constants/constants.dart';
import '../../view/user/user_layout/main_page.dart';

part 'user_auth_state.dart';

class UserAuthCubit extends Cubit<UserAuthStates> {
  UserAuthCubit() : super(UserAuthInitial());
  bool isPass = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  bool changePassVisibility() {
    isPass = !isPass;
    emit(UserAuthChangePasswordVisibilityState());
    return isPass;
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerRepeatPasswordController =
      TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController resetPasswordEmailController = TextEditingController();

  static UserAuthCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    emit(UserAuthGoogleLoginLoadingState());
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((user1) async {
        await CacheHelper.setData(key: "uid", value: user1.user!.uid);
        uid = user1.user!.uid;
        await saveUserToFirestore(
          id: user1.user!.uid,
          name: user1.user!.displayName!,
          email: user1.user!.email!,
        ).then((value) async {
          String? userJson = await CacheHelper.getData(key: "user");
          if (userJson != null) {
            user = UserModel.fromJson(
              json.decode(userJson),
            );
          }
          getToast(
            text: "Login Successfully\nWelcome back",
            state: ToastStates.SUCCESS,
          );
          emit(UserAuthGoogleLoginSuccessState());
        }).catchError((error) {
          print(error.toString());
          print("error.toString()");
        });
      });
      navigateToHome(context);
    } catch (e) {
      print(e.toString());
      print("error");
      emit(UserAuthGoogleLoginErrorState());
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook(context) async {
    try {
      emit(UserAuthFacebookLoginLoadingState());
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((user1) async {
        await saveUserToFirestore(
          id: user1.user!.uid,
          name: user1.user!.displayName!,
          email: user1.user!.email!,
          phone: user1.user!.phoneNumber!,
        );
        await CacheHelper.setData(key: "uid", value: user1.user!.uid);
        String? userJson = await CacheHelper.getData(key: "user");
        uid = user1.user!.uid;
        user = UserModel.fromJson(
          json.decode(userJson!),
        );

        navigateToHome(context);
        emit(UserAuthFacebookLoginSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(UserAuthFacebookLoginErrorState());
    }
  }

  Future<void> userLogin({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    emit(UserAuthLoginLoadingState());
    try {
      emit(UserAuthLoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await CacheHelper.setData(key: "uid", value: credential.user!.uid);
      emit(UserAuthLoginSuccessState());
      String? userJson = await CacheHelper.getData(key: "user");
      uid = credential.user!.uid;
      if (userJson != null) {
        user = UserModel.fromJson(
          json.decode(userJson),
        );
      }
      getToast(
        text: "Login Successfully\nWelcome back",
        state: ToastStates.SUCCESS,
      );
      navigateToHome(context);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'user-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }
      emit(UserAuthLoginErrorState());
      getToast(text: message, state: ToastStates.ERROR);
    } catch (e) {
      emit(UserAuthLoginErrorState());
      getToast(text: e.toString(), state: ToastStates.ERROR);
    }
  }

  Future<void> userRegister({
    required String username,
    required String password,
    required String email,
    required String phone,
    required BuildContext context,
  }) async {
    try {
      emit(UserAuthRegisterLoadingState());
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (user) {
          emit(UserAuthRegisterSuccessState());
          getToast(text: "Registered Successfully", state: ToastStates.SUCCESS);
          saveUserToFirestore(
            id: user.user!.uid,
            name: registerUsernameController.text,
            email: registerEmailController.text,
            phone: phone,
          );
          Navigator.maybePop(
            context,
            MaterialPageRoute(
              builder: (context) => const UserSignInScreen(),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      emit(UserAuthRegisterErrorState());
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = ('The account already exists for that email.');
      } else {
        message = e.message.toString();
      }
      getToast(text: message, state: ToastStates.ERROR);
    } catch (e) {
      emit(UserAuthRegisterErrorState());
      getToast(text: e.toString(), state: ToastStates.ERROR);
    }
  }

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    emit(UserAuthChangePasswordLoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
      (value) {
        emit(UserAuthChangePasswordSuccessState());

        Navigator.maybePop(
          context,
          MaterialPageRoute(
            builder: (context) => const UserSignInScreen(),
          ),
        );
        getToast(
            text: "Email Send Successfully Please Check Your Email",
            state: ToastStates.SUCCESS);
      },
    ).catchError(
      (error) {
        emit(UserAuthChangePasswordErrorState());
        getToast(text: "Error Occurred", state: ToastStates.ERROR);
      },
    );
  }

  Future<void> saveUserToFirestore({
    required String id,
    required String email,
    required String name,
    String? phone,
  }) async {
    UserModel model = UserModel(
      uId: id,
      email: email,
      username: name,
      phone: phone,
    );
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(id)
        .set(model.toJson());
    await CacheHelper.setData(key: "user", value: json.encode(model.toJson()));
  }

  Future<void> signOut(context) async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    CacheHelper.remove("uid");
    CacheHelper.remove("appType");
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const ControlScreen(),
      ),
      (route) => false,
    );
    emit(UserAuthLogoutSuccessState());
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
        (route) => false);
  }
}
