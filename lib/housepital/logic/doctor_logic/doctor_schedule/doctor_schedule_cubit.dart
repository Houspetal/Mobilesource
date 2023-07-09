import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grade_project/housepital/model/schedule_model.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/constants/constants.dart';

part 'doctor_schedule_state.dart';

class DoctorScheduleDoctorCubit extends Cubit<DoctorScheduleDoctorStates> {
  DoctorScheduleDoctorCubit() : super(DoctorScheduleInitial()) {
    getAllMeetings();
  }

  static DoctorScheduleDoctorCubit of(BuildContext context) {
    return BlocProvider.of(context);
  }

  List<ScheduleModel> meetings = [];
  List<ScheduleModel> todayMeetings = [];

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
    FirebaseFirestore.instance.collection("Users").get().then(
      (value) {
        value.docs.forEach((element) {
          element.reference
              .collection("Meetings")
              .orderBy("date")
              .get()
              .then((allMeetings) {
            var allMeetingsOfDoctor = allMeetings.docs.where(
              (element) => element["doctor_name"] == user!.name,
            );
            allMeetingsOfDoctor.forEach((element) {
              meetings.add(
                ScheduleModel.fromJson(
                  element.data(),
                ),
              );
            });
          });
        });
        todayMeetings = meetings
            .where(
              (element) =>
                  element.date ==
                  DateFormat('dd-MM-yyyy').format(
                    DateTime.now(),
                  ),
            )
            .toList();
        emit(DoctorGetSchedulesSuccessState());
      },
    ).catchError(
      (error) {
        emit(DoctorGetSchedulesErrorState());
      },
    );
  }

  void deleteMeeting({required String meetingId, required String userId}) {
    emit(DoctorDeleteSchedulesLoadingState());
    FirebaseFirestore.instance
        .collection("Users")
        .doc(userId)
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
