import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/model/doctor_model.dart';
import 'package:grade_project/housepital/view/widgets/custom_toast.dart';

import '../../../model/user_model.dart';
import '../../../shared/constants/constants.dart';

part 'admin_home_state.dart';

class AdminHomeCubit extends Cubit<AdminHomeStates> {
  AdminHomeCubit() : super(AdminHomeInitial());
  List<DoctorModel> doctors = [];
  List<UserModel> users = [];
  List<DoctorModel> searchDoctors = [];
  static AdminHomeCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  void approveDoctor({required DoctorModel doctor}) {
    emit(AdminHomeApproveDoctorsLoadingState());
    FirebaseFirestore.instance.collection("Doctors").doc(doctor.uid).update(
      {
        "isApproved": true,
      },
    ).then((value) {
      doctor.isApproved = true;
      emit(AdminHomeApproveDoctorsSuccessState());
      getToast(text: "Approved Successfully", state: ToastStates.SUCCESS);
    }).catchError((error) {
      getToast(text: "ERROR OCCURRED", state: ToastStates.ERROR);
      emit(AdminHomeUnApproveDoctorsErrorState());
    });
  }

  void unApproveDoctor({required DoctorModel doctor}) {
    emit(AdminHomeUnApproveDoctorsLoadingState());
    FirebaseFirestore.instance.collection("Doctors").doc(doctor.uid).update(
      {
        "isApproved": false,
      },
    ).then((value) {
      doctor.isApproved = false;
      emit(AdminHomeUnApproveDoctorsSuccessState());
      getToast(text: "Unapproved Successfully", state: ToastStates.SUCCESS);
    }).catchError((error) {
      getToast(text: "ERROR OCCURRED", state: ToastStates.ERROR);
      emit(AdminHomeUnApproveDoctorsErrorState());
    });
  }

  Future<void> getAdmin() async {
    uid = "admin";
    user = UserModel(
      username: "Mohammed El-Kelany",
      image: "assets/my_photo.jpg",
      phone: "+201067140620",
      email: "www.mohammedfathyali@gmail.com",
      bio: "The Admin Of the Application",
      uid: "admin",
      isApproved: true,
    );
    emit(AdminHomeGetAdminSuccessState());
  }

  Future<void> getDoctors() async {
    emit(AdminHomeGetDoctorsLoadingState());
    doctors = [];
    FirebaseFirestore.instance.collection("Doctors").get().then((value) async {
      value.docs.forEach((element) {
        doctors.add(
          DoctorModel.fromJson(
            element.data(),
          ),
        );
      });
      emit(AdminHomeGetDoctorsSuccessState());
    }).catchError((error) {
      emit(AdminHomeGetDoctorsErrorState());
    });
  }

  Future<void> getUsers() async {
    emit(AdminHomeGetUsersLoadingState());
    doctors = [];
    FirebaseFirestore.instance.collection("Users").get().then((value) async {
      value.docs.forEach((element) {
        users.add(
          UserModel.fromJson(
            element.data(),
          ),
        );
      });
      emit(AdminHomeGetUsersSuccessState());
    }).catchError((error) {
      emit(AdminHomeGetUsersErrorState());
    });
  }

  List<DoctorModel> doctorSearch({required String name}) {
    searchDoctors = doctors
        .where(
          (element) => element.name!.toLowerCase().contains(
                name.toLowerCase(),
              ),
        )
        .toList();
    emit(AdminHomeNameSearchSuccessState());
    return searchDoctors;
  }
}
