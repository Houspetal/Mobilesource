import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/logic/user_disease/user_disease_cubit.dart';
import 'package:grade_project/house_petal/logic/user_home/user_home_cubit.dart';
import 'package:grade_project/house_petal/view/splash/splash.dart';

import 'firebase_options.dart';
import 'house_petal/helper/cache/cache.dart';
import 'house_petal/logic/bloc_observer/my_observer.dart';
import 'house_petal/logic/doctor_schedule/doctor_schedule_cubit.dart';
import 'house_petal/logic/user_auth/user_auth_cubit.dart';
import 'house_petal/logic/user_profile/user_profile_cubit.dart';
import 'house_petal/model/user_model.dart';
import 'house_petal/shared/constants/constants.dart';
import 'house_petal/view/widgets/utils.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  uid = await CacheHelper.getData(key: "uid");
  String? userJson = await CacheHelper.getData(key: "user");
  if (userJson != null) {
    user = UserModel.fromJson(json.decode(userJson));
  } else {}
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
          create: (context) => UserProfileCubit(),
        ),
        BlocProvider(
          create: (context) => UserHomeCubit()
            ..getUserData(uid: uid!)
            ..getDoctors(),
        ),
        BlocProvider(
          create: (context) => DoctorScheduleCubit()..getAllMeetings(),
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
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
