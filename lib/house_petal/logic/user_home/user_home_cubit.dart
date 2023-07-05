import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/model/doctor_model.dart';
import 'package:grade_project/house_petal/shared/constants/constants.dart';

import '../../helper/cache/cache.dart';
import '../../model/user_model.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeStates> {
  UserHomeCubit() : super(UserHomeInitial());
  List<DoctorModel> doctors = [];
  List<DoctorModel> searchDoctors = [];
  static UserHomeCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  Future<void> getUserData({required String uid}) async {
    emit(UserHomeGetUserLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .get()
        .then((value) async {
      emit(UserHomeGetUserSuccessState());
      await CacheHelper.setData(key: "user", value: json.encode(value.data()));
      String? userJson = await CacheHelper.getData(key: "user");
      user = UserModel.fromJson(
        json.decode(userJson!),
      );
    }).catchError((error) {
      emit(UserHomeGetUserErrorState());
    });
  }

  Future<void> getDoctors() async {
    emit(UserHomeGetDoctorsLoadingState());
    doctors = [];
    FirebaseFirestore.instance.collection("Doctors").get().then((value) async {
      value.docs.forEach((element) {
        doctors.add(
          DoctorModel.fromJson(
            element.data(),
          ),
        );
      });
      emit(UserHomeGetDoctorsSuccessState());
    }).catchError((error) {
      emit(UserHomeGetDoctorsErrorState());
    });
  }

  List<DoctorModel> dentists() {
    searchDoctors = doctors
        .where((element) =>
            element.department == "Dentist" ||
            element.department!.contains("Den"))
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());
    return searchDoctors;
  }

  List<DoctorModel> cardiologists() {
    searchDoctors = doctors
        .where(
          (element) =>
              element.department == "Cardiologist" ||
              element.department!.toLowerCase() == "cardiologist" ||
              element.department!.contains("card"),
        )
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> eyes() {
    searchDoctors = doctors
        .where(
          (element) =>
              element.department == "Eye Special" ||
              element.department!.contains("Eye") ||
              element.department!.toLowerCase().contains("eye"),
        )
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> orthopaedic() {
    searchDoctors = doctors
        .where((element) =>
            element.department == "Orthopaedic" ||
            element.department!.contains("Orth") ||
            element.department!.toLowerCase().contains("or") ||
            element.department!.contains("Or"))
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> paediatricians() {
    searchDoctors = doctors
        .where(
          (element) =>
              element.department == "Paediatrician" ||
              element.department!.toLowerCase().contains("paedia") ||
              element.department!.toLowerCase().contains("pe"),
        )
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> bones() {
    searchDoctors = doctors
        .where((element) =>
            element.department == "Bones" ||
            element.department!.toLowerCase().contains("bo"))
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> earNoseThroat() {
    searchDoctors = doctors
        .where(
          (element) =>
              element.department == "Ear, Nose and Throat" ||
              element.department!.toLowerCase().contains("ear") ||
              element.department!.toLowerCase().contains("nose") ||
              element.department!.toLowerCase().contains("throat"),
        )
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> children() {
    searchDoctors = doctors
        .where((element) =>
            element.department == "Children" ||
            element.department!.toLowerCase().contains("children") ||
            element.department!.toLowerCase().contains("child") ||
            element.department!.toLowerCase().contains("baby"))
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> internalMedicine() {
    searchDoctors = doctors
        .where((element) =>
            element.department == "Internal Medicine" ||
            element.department!.toLowerCase().contains("in"))
        .toList();
    emit(UserHomeDepartmentSearchSuccessState());

    return searchDoctors;
  }

  List<DoctorModel> doctorSearch({required String name}) {

    searchDoctors = doctors
        .where(
          (element) => element.name!.toLowerCase().contains(
                name.toLowerCase(),
              ),
        )
        .toList();
    emit(UserHomeNameSearchSuccessState());
    return searchDoctors;
  }

  List<DoctorModel> departmentSearch({required String department}) {
    if (department.toLowerCase().contains("den")) {
      return dentists();
    } else if (department.toLowerCase().contains("ca")) {
      return cardiologists();
    } else if (department.toLowerCase().contains("or")) {
      return orthopaedic();
    } else if (department.toLowerCase().contains("pa")) {
      return paediatricians();
    } else if (department.toLowerCase().contains("ear")) {
      return earNoseThroat();
    } else if (department.toLowerCase().contains("ch")) {
      return children();
    } else if (department.toLowerCase().contains("in")) {
      return internalMedicine();
    } else if (department.toLowerCase().contains("ea")) {
      return eyes();
    } else if (department.toLowerCase().contains("bo")) {
      return bones();
    } else {
      return searchDoctors = [];
    }
  }
}
