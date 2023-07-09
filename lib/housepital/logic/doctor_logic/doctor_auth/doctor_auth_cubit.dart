import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:grade_project/housepital/view/splash/splash.dart';
import 'package:grade_project/housepital/view/widgets/custom_toast.dart';

import '../../../helper/cache/cache.dart';
import '../../../model/doctor_model.dart';
import '../../../model/user_model.dart';
import '../../../shared/constants/constants.dart';
import '../../../view/doctor/doctor_auth/doctor_sign_in.dart';
import '../../../view/doctor/doctor_layout/doctor_main_page.dart';

part 'doctor_auth_state.dart';

class DoctorAuthCubit extends Cubit<DoctorAuthStates> {
  DoctorAuthCubit() : super(DoctorAuthInitial());
  bool isPass = true;
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> resetPasswordFormKey = GlobalKey<FormState>();

  bool changePassVisibility() {
    isPass = !isPass;
    emit(DoctorAuthChangePasswordVisibilityState());
    return isPass;
  }

  List<DropdownMenuItem<String>> get dropdownItemsDepartments {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
          value: "Cardiologist",
          child: Text("Cardiologist", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Dentist",
          child: Text("Dentist", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Eye Specialist",
          child: Text("Eye Specialist", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Paediatrician",
          child: Text("Paediatrician", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Bones",
          child: Text("Bones", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Ear, Nose and Throat",
          child: Text("Ear, Nose and Throat", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Children",
          child: Text("Children", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Internal Medicine",
          child: Text("Dentist", overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Orthopaedic",
          child: Text("Orthopaedic", overflow: TextOverflow.ellipsis)),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItemsLocations {
    List<DropdownMenuItem<String>> menuItems = const [
      DropdownMenuItem(
          value: "Damanhour-Gomhoria Street",
          child: Text(
            "Damanhour-Gomhoria Street",
            overflow: TextOverflow.ellipsis,
          )),
      DropdownMenuItem(
          value: "Cairo-Salah Salem Street",
          child: Text("Cairo-Salah Salem Street",
              overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Alexandria-10th of Ramadan Street",
          child: Text("Alexandria-10th of Ramadan Street",
              overflow: TextOverflow.ellipsis)),
      DropdownMenuItem(
          value: "Nubaria-Sawahly Street",
          child:
              Text("Nubaria-Sawahly Street", overflow: TextOverflow.ellipsis)),
    ];
    return menuItems;
  }

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  TextEditingController registerUsernameController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerRepeatPasswordController =
      TextEditingController();
  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController feesController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  String department = 'Cardiologist';
  String location = 'Damanhour-Gomhoria Street';
  TextEditingController resetPasswordEmailController = TextEditingController();
  void changeDepartment(String newDepartment) {
    department = newDepartment;
    emit(DoctorChangeDepartmentSuccessState());
  }

  void changeLocation(String newLocation) {
    location = newLocation;
    emit(DoctorChangeLocationSuccessState());
  }

  static DoctorAuthCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    emit(DoctorAuthGoogleLoginLoadingState());
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
        final isUser = await FirebaseFirestore.instance
            .collection("Users")
            .doc(user1.user!.uid)
            .get();
        final isDoctor = await FirebaseFirestore.instance
            .collection("Doctors")
            .doc(user1.user!.uid)
            .get();
        if (isDoctor.exists && !isUser.exists) {
          await CacheHelper.setData(key: "uid", value: user1.user!.uid);
          uid = user1.user!.uid;
          await saveDoctorToFirestore(
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
            emit(DoctorAuthGoogleLoginSuccessState());
            navigateToHome(context);
          }).catchError((error) {
            getToast(
              text: error.toString(),
              state: ToastStates.ERROR,
            );
            emit(DoctorAuthGoogleLoginErrorState());
          });
        }
      });
    } catch (e) {
      getToast(
        text: e.toString(),
        state: ToastStates.ERROR,
      );
      emit(DoctorAuthGoogleLoginErrorState());
    }
  }

  // Sign in with Facebook
  Future<void> signInWithFacebook(context) async {
    try {
      emit(DoctorAuthFacebookLoginLoadingState());
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);

      // Once signed in, return the UserCredential
      await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential)
          .then((user1) async {
        await saveDoctorToFirestore(
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
        emit(DoctorAuthFacebookLoginSuccessState());
      });
    } catch (e) {
      print(e.toString());
      emit(DoctorAuthFacebookLoginErrorState());
    }
  }

  Future<void> doctorLogin({
    required String password,
    required String email,
    required BuildContext context,
  }) async {
    emit(DoctorAuthLoginLoadingState());
    try {
      emit(DoctorAuthLoginLoadingState());
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final isUser = await FirebaseFirestore.instance
          .collection("Users")
          .doc(credential.user!.uid)
          .get();
      final isDoctor = await FirebaseFirestore.instance
          .collection("Doctors")
          .doc(credential.user!.uid)
          .get();
      if (isDoctor.exists && !isUser.exists) {
        await CacheHelper.setData(key: "uid", value: credential.user!.uid);
        emit(DoctorAuthLoginSuccessState());
        String? userJson = await CacheHelper.getData(key: "user");
        uid = credential.user!.uid;
        if (userJson != null) {
          user = DoctorModel.fromJson(
            json.decode(userJson),
          );
        }
        getToast(
          text: "Login Successfully\nWelcome back",
          state: ToastStates.SUCCESS,
        );
        navigateToHome(context);
      } else {
        await GoogleSignIn().signOut();
        await FirebaseAuth.instance.signOut();
        await CacheHelper.remove("uid");
        await CacheHelper.remove("uid");
        getToast(
          text:
              "You Aren't a Doctor\nPlease Choose another email\nand try to sign up as a Doctor",
          state: ToastStates.ERROR,
        );
        emit(DoctorAuthLoginErrorState());
      }
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'wrong-password') {
        message = 'Invalid Password. Please try again!';
      } else if (e.code == 'Doctor-not-found') {
        message =
            ('The account does not exists for $email. Create your account by signing up.');
      } else {
        message = e.message.toString();
      }
      emit(DoctorAuthLoginErrorState());
      getToast(text: message, state: ToastStates.ERROR);
    } catch (e) {
      emit(DoctorAuthLoginErrorState());
      getToast(text: e.toString(), state: ToastStates.ERROR);
    }
  }

  Future<void> doctorRegister({
    required String username,
    required String password,
    required String email,
    required String phone,
    String? fees,
    String? location,
    String? department,
    String? time,
    required BuildContext context,
  }) async {
    try {
      emit(DoctorAuthRegisterLoadingState());
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then(
        (user) {
          emit(DoctorAuthRegisterSuccessState());
          getToast(text: "Registered Successfully", state: ToastStates.SUCCESS);
          saveDoctorToFirestore(
            id: user.user!.uid,
            name: registerUsernameController.text,
            email: registerEmailController.text,
            phone: phone,
            time: time,
            location: location,
            department: department,
            fees: fees,
          );
          Navigator.maybePop(
            context,
            MaterialPageRoute(
              builder: (context) => const DoctorSignInScreen(),
            ),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      emit(DoctorAuthRegisterErrorState());
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
      emit(DoctorAuthRegisterErrorState());
      getToast(text: e.toString(), state: ToastStates.ERROR);
    }
  }

  Future<void> resetPassword({
    required String email,
    required BuildContext context,
  }) async {
    emit(DoctorAuthChangePasswordLoadingState());
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then(
      (value) {
        emit(DoctorAuthChangePasswordSuccessState());

        Navigator.maybePop(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorSignInScreen(),
          ),
        );
        getToast(
            text: "Email Send Successfully Please Check Your Email",
            state: ToastStates.SUCCESS);
      },
    ).catchError(
      (error) {
        emit(DoctorAuthChangePasswordErrorState());
        getToast(text: "Error Occurred", state: ToastStates.ERROR);
      },
    );
  }

  Future<void> saveDoctorToFirestore({
    required String id,
    required String email,
    required String name,
    String? fees,
    String? location,
    String? department,
    String? time,
    String? phone,
  }) async {
    DoctorModel model = DoctorModel(
      uid: id,
      email: email,
      name: name,
      phone: phone,
      time: time,
      location: location,
      department: department,
      fees: fees,
      username: name,
    );
    await FirebaseFirestore.instance.collection("Doctors").doc(id).set(
          model.toJson(),
        );
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
        builder: (context) => SplashScreen(),
      ),
      (route) => false,
    );
    emit(DoctorAuthLogoutSuccessState());
  }

  void navigateToHome(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DoctorMainPage(),
        ),
        (route) => false);
  }
}
