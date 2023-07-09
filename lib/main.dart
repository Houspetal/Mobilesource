import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/logic/admin_logic/admin_auth/admin_auth_cubit.dart';
import 'package:grade_project/housepital/logic/admin_logic/admin_home/admin_home_cubit.dart';
import 'package:grade_project/housepital/logic/doctor_logic/doctor_auth/doctor_auth_cubit.dart';
import 'package:grade_project/housepital/logic/user_logic/user_disease/user_disease_cubit.dart';
import 'package:grade_project/housepital/logic/user_logic/user_home/user_home_cubit.dart';
import 'package:grade_project/housepital/model/doctor_model.dart';
import 'package:grade_project/housepital/view/splash/splash.dart';

import 'firebase_options.dart';
import 'housepital/helper/cache/cache.dart';
import 'housepital/logic/bloc_observer/my_observer.dart';
import 'housepital/logic/doctor_logic/doctor_home/doctor_home_cubit.dart';
import 'housepital/logic/doctor_logic/doctor_profile/doctor_profile_cubit.dart';
import 'housepital/logic/doctor_logic/doctor_schedule/doctor_schedule_cubit.dart';
import 'housepital/logic/user_logic/doctor_schedule/doctor_schedule_cubit.dart';
import 'housepital/logic/user_logic/user_auth/user_auth_cubit.dart';
import 'housepital/logic/user_logic/user_profile/user_profile_cubit.dart';
import 'housepital/model/user_model.dart';
import 'housepital/shared/constants/constants.dart';
import 'housepital/view/widgets/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  uid = await CacheHelper.getData(key: "uid");
  String? userJson = await CacheHelper.getData(key: "user");
  final isUser =
      await FirebaseFirestore.instance.collection("Users").doc(uid).get();
  final isDoctor =
      await FirebaseFirestore.instance.collection("Doctors").doc(uid).get();
  if (userJson != null && isUser.exists) {
    user = UserModel.fromJson(json.decode(userJson));
  } else if (userJson != null && isDoctor.exists) {
    user = DoctorModel.fromJson(json.decode(userJson));
  }
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserAuthCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorAuthCubit(),
        ),
        BlocProvider(
          create: (context) => AdminAuthCubit(),
        ),
        BlocProvider(
          create: (context) => UserProfileCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorProfileCubit(),
        ),
        BlocProvider(
          create: (context) => UserHomeCubit()
            ..getUserData(uid: uid!)
            ..getDoctors(),
        ),
        BlocProvider(
          create: (context) =>
              DoctorHomeCubit()..getDoctorData(uid: uid!, context: context),
        ),
        BlocProvider(
          create: (context) => AdminHomeCubit()
            ..getAdmin()
            ..getDoctors()
            ..getUsers(),
        ),
        BlocProvider(
          create: (context) => DoctorScheduleCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorScheduleDoctorCubit(),
        ),
        BlocProvider(
          create: (context) => UserDiseaseCubit()..getDiseases(),
        ),
      ],
      child: MaterialApp(
        title: 'HousePetal',
        debugShowCheckedModeBanner: false,
        scrollBehavior: MyCustomScrollBehavior(),
        theme: ThemeData(
          primarySwatch: Colors.pink,
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
