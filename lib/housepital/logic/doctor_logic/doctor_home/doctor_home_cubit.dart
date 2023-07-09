import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/model/doctor_model.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:grade_project/housepital/view/doctor/doctor_waiting_screen/doctor_waiting_screen.dart';

import '../../../helper/cache/cache.dart';

part 'doctor_home_state.dart';

class DoctorHomeCubit extends Cubit<DoctorHomeStates> {
  DoctorHomeCubit() : super(DoctorHomeInitial());
  static DoctorHomeCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> getDoctorData(
      {required String uid, required BuildContext context}) async {
    emit(DoctorHomeGetDoctorLoadingState());
    FirebaseFirestore.instance
        .collection("Doctors")
        .doc(uid)
        .get()
        .then((value) async {
      emit(DoctorHomeGetDoctorSuccessState());
      await CacheHelper.setData(
        key: "user",
        value: json.encode(
          value.data(),
        ),
      );
      String? userJson = await CacheHelper.getData(key: "user");
      if (userJson != null) {
        user = DoctorModel.fromJson(
          json.decode(userJson),
        );
      }
    }).catchError((error) {
      emit(DoctorHomeGetDoctorErrorState());
    });
  }

  void checkIsApproved(context) {
    print("Done Checking");
    if (!user!.isApproved!) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const DoctorWaitingScreen(),
        ),
        (route) => false,
      );
    }
    print("Done Checking");
    emit(DoctorHomeGetDoctorSuccessState());
  }
}
