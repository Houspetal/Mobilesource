import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grade_project/house_petal/view/control/control.dart';
import 'package:grade_project/house_petal/view/doctor/doctor_view/doctor_veiw.dart';
import 'package:grade_project/house_petal/view/onboarding/onboarding.dart';
import 'package:grade_project/house_petal/view/onboarding/welcome_screen.dart';
import 'package:grade_project/house_petal/view/user/user_auth/sign_in.dart';

import '../../helper/cache/cache.dart';
import '../admin/admin_view/admin_veiw.dart';
import '../user/user_layout/main_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  String? appType = CacheHelper.getData(key: "appType");
  String? uId = CacheHelper.getData(key: "uid");
  bool? isApproved = CacheHelper.getData(key: "isApproved");
  bool? starting = CacheHelper.getData(key: "starting");
  bool? onBoarding = CacheHelper.getData(key: "onBoarding");

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (starting == null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const WelcomeScreen(),
          ),
          (route) => false,
        );
      } else {
        if (onBoarding == null) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const OnBoardingScreen(),
            ),
            (route) => false,
          );
        } else {
          if (appType == "doctor") {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DoctorScreen(),
              ),
              (route) => false,
            );
          } else if (appType == "user") {
            if (uId != null) {
              //TODO go to User Home Screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
                (route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserSignInScreen(),
                ),
                (route) => false,
              );
            }
          } else if (appType == "admin") {
            if (uId != null) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminScreen(),
                ),
                (route) => false,
              );
            } else {
              //TODO go to Admin Login Screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminScreen(),
                ),
                (route) => false,
              );
            }
          } else {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const ControlScreen(),
              ),
              (route) => false,
            );
          }
        }
      }
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                child: Image.asset(
                  "assets/logo.png",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
