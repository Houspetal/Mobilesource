import 'dart:async';

import 'package:flutter/material.dart';

import '../../helper/cache/cache.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  String? appType = CacheHelper.getData(key: "appType");
  String? uId = CacheHelper.getData(key: "uid");
  bool? isApproved = CacheHelper.getData(key: "isApproved");

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () async {
      if (appType == "doctor") {
        if (uId != null && isApproved == true) {
          //TODO go to doctor Home Screen
        } else if (uId != null && isApproved == false) {
          //TODO go to doctor Waiting Screen
        } else {
          //TODO go to doctor Login Screen
        }
      } else if (appType == "user") {
        if (uId != null) {
          //TODO go to User Home Screen
        } else {
          //TODO go to User Login Screen
        }
      } else if (appType == "admin") {
        if (uId != null) {
          //TODO go to Admin Home Screen
        }
      } else {
        //TODO go to Admin Login Screen
      }
    });
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset(
                "assets/images/miniLogo1.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
