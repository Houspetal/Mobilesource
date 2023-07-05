import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/house_petal/model/schedule_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../shared/constants/constants.dart';

part 'doctor_schedule_state.dart';

class DoctorScheduleCubit extends Cubit<DoctorScheduleStates> {
  DoctorScheduleCubit() : super(DoctorScheduleInitial()) {
    getAllMeetings();
  }
  static DoctorScheduleCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<ScheduleModel> meetings = [];

  Future<void> launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void getAllMeetings() {
    meetings = [];
    emit(DoctorGetSchedulesLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Meetings")
        .get()
        .then(
      (value) {
        value.docs.forEach((element) {
          meetings.add(
            ScheduleModel.fromJson(
              element.data(),
            ),
          );
        });
        emit(DoctorGetSchedulesSuccessState());
      },
    ).catchError(
      (error) {
        emit(DoctorGetSchedulesErrorState());
      },
    );
  }

  void deleteMeeting({required String meetingId}) {
    emit(DoctorDeleteSchedulesLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Meetings")
        .doc(meetingId)
        .delete()
        .then((value) {
      emit(DoctorDeleteSchedulesSuccessState());
      getAllMeetings();
    }).catchError((error) {
      emit(DoctorDeleteSchedulesErrorState());
    });
  }
}
