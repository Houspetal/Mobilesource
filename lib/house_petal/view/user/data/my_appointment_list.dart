import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/shared/constants/colors.dart';
import 'package:intl/intl.dart';

import '../../../logic/doctor_schedule/doctor_schedule_cubit.dart';

class MyAppointmentList extends StatelessWidget {
  const MyAppointmentList({super.key});

  String _dateFormatter(String timestamp) {
    String formattedDate =
        DateFormat('dd-MM-yyyy').format(DateTime.parse(timestamp));
    return formattedDate;
  }

  showAlertDialog(BuildContext context, {required String meetingId}) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        DoctorScheduleCubit.of(context).deleteMeeting(meetingId: meetingId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Delete"),
      content: const Text("Are you sure you want to delete this Appointment?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return SafeArea(
          child: state is DoctorGetSchedulesLoadingState
              ? const Center(
                  child: CircularProgressIndicator(
                    color: primaryColor,
                  ),
                )
              : DoctorScheduleCubit.of(context).meetings.isEmpty
                  ? Center(
                      child: Text(
                        'No Appointment Scheduled',
                        style: GoogleFonts.lato(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:
                          DoctorScheduleCubit.of(context).meetings.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: InkWell(
                            onTap: () {},
                            child: ExpansionTile(
                              backgroundColor: primaryColor.withOpacity(.1),
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      "${DoctorScheduleCubit.of(context).meetings[index].doctorName}",
                                      style: GoogleFonts.lato(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 0,
                                  ),
                                ],
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Text(
                                  "${DoctorScheduleCubit.of(context).meetings[index].date}",
                                  style: GoogleFonts.lato(),
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 20, right: 10, left: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Patient name: "
                                        "${DoctorScheduleCubit.of(context).meetings[index].patientName}",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Time: "
                                        "${DoctorScheduleCubit.of(context).meetings[index].time}",
                                        style: GoogleFonts.lato(
                                          fontSize: 16,
                                        ),
                                      ),
                                      IconButton(
                                        tooltip: 'Delete Appointment',
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.black87,
                                        ),
                                        onPressed: () {
                                          showAlertDialog(
                                            context,
                                            meetingId:
                                                DoctorScheduleCubit.of(context)
                                                    .meetings[index]
                                                    .uid!,
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        );
      },
    );
  }
}
