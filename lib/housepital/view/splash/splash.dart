import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grade_project/housepital/view/admin/admin_auth/admin_sign_in.dart';
import 'package:grade_project/housepital/view/control/control.dart';
import 'package:grade_project/housepital/view/doctor/doctor_auth/doctor_sign_in.dart';
import 'package:grade_project/housepital/view/onboarding/onboarding.dart';
import 'package:grade_project/housepital/view/onboarding/welcome_screen.dart';
import 'package:grade_project/housepital/view/user/user_auth/user_sign_in.dart';

import '../../helper/cache/cache.dart';
import '../admin/admin_layout/admin_main_page.dart';
import '../doctor/doctor_layout/doctor_main_page.dart';
import '../user/user_layout/main_page.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  String? appType = CacheHelper.getData(key: "appType");
  String? uId = CacheHelper.getData(key: "uid");
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
            if (uId != null) {
              //TODO go to Doctor Home Screen
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorMainPage(),
                ),
                (route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DoctorSignInScreen(),
                ),
                (route) => false,
              );
            }
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
                  builder: (context) => const AdminMainPage(),
                ),
                (route) => false,
              );
            } else {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const AdminSignInScreen(),
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
