import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:grade_project/housepital/view/doctor/doctor_waiting_screen/doctor_waiting_screen.dart';
import 'package:intl/intl.dart';

import '../../../logic/doctor_logic/doctor_home/doctor_home_cubit.dart';
import '../../../logic/doctor_logic/doctor_schedule/doctor_schedule_cubit.dart';
import '../../../shared/constants/colors.dart';
import 'carousel_slider.dart';

class DoctorHomePage extends StatefulWidget {
  const DoctorHomePage({super.key});

  @override
  _DoctorHomePageState createState() => _DoctorHomePageState();
}

showAlertDialog(BuildContext context,
    {required String meetingId, required String userId}) {
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
      DoctorScheduleDoctorCubit.of(context).deleteMeeting(
        meetingId: meetingId,
        userId: userId,
      );
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

class _DoctorHomePageState extends State<DoctorHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    if (uid != null) {
      DoctorHomeCubit.of(context).getDoctorData(uid: uid!, context: context);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String message = "";
    DateTime now = DateTime.now();
    String currentHour = DateFormat('kk').format(now);
    int hour = int.parse(currentHour);

    setState(
      () {
        if (hour >= 5 && hour < 12) {
          message = 'Good Morning';
        } else if (hour >= 12 && hour <= 17) {
          message = 'Good Afternoon';
        } else {
          message = 'Good Evening';
        }
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          //width: MediaQuery.of(context).size.width/1.3,
          alignment: Alignment.center,
          child: Text(
            message,
            style: GoogleFonts.lato(
              color: Colors.black54,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<DoctorHomeCubit, DoctorHomeStates>(
        listener: (context, state) {
          if (state is DoctorHomeGetDoctorSuccessState) {
            setState(() {
              user;
              uid;
            });
          }
          if (user != null) {
            if (user!.isApproved! == false) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DoctorWaitingScreen(),
                  ),
                  (route) => false);
            }
          }
        },
        builder: (context, state) => user == null ||
                uid == null ||
                user!.isApproved == false
            ? const Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                ),
              )
            : SafeArea(
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: <Widget>[
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20, bottom: 10),
                          child: Text(
                            "Hello ${user!.name}",
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20, bottom: 25),
                          child: Text(
                            "Let's Help \nPeople",
                            style: GoogleFonts.lato(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 23, bottom: 10),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "We ask your advice",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: DoctorCarouselSliderBuilder(),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 20),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Your Schedule For Today",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        BlocConsumer<DoctorScheduleDoctorCubit,
                            DoctorScheduleDoctorStates>(
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
                                  : DoctorScheduleDoctorCubit.of(context)
                                          .todayMeetings
                                          .isEmpty
                                      ? Center(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 20.0),
                                            child: Column(
                                              children: [
                                                SvgPicture.asset(
                                                  "assets/svg/doctor.svg",
                                                  semanticsLabel: 'Doctor Logo',
                                                  width: 110,
                                                  height: 110,
                                                ),
                                                const SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  'No Appointment Scheduled For today',
                                                  style: GoogleFonts.lato(
                                                    color: Colors.grey,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          physics:
                                              const ClampingScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount:
                                              DoctorScheduleDoctorCubit.of(
                                                      context)
                                                  .todayMeetings
                                                  .length,
                                          itemBuilder: (context, index) {
                                            return Card(
                                              elevation: 2,
                                              child: InkWell(
                                                onTap: () {},
                                                child: ExpansionTile(
                                                  backgroundColor: primaryColor
                                                      .withOpacity(.1),
                                                  expandedCrossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(left: 5),
                                                        child: Text(
                                                          "${DoctorScheduleDoctorCubit.of(context).todayMeetings[index].patientName}",
                                                          style:
                                                              GoogleFonts.lato(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        width: 0,
                                                      ),
                                                    ],
                                                  ),
                                                  subtitle: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 5),
                                                    child: Text(
                                                      "${DoctorScheduleDoctorCubit.of(context).todayMeetings[index].date}",
                                                      style: GoogleFonts.lato(),
                                                    ),
                                                  ),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 20,
                                                              right: 10,
                                                              left: 16),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "Description: "
                                                            "${DoctorScheduleDoctorCubit.of(context).meetings[index].description}",
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize: 16,
                                                            ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(
                                                            "Time: "
                                                            "${DoctorScheduleDoctorCubit.of(context).todayMeetings[index].time}",
                                                            style: GoogleFonts
                                                                .lato(
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                          IconButton(
                                                            tooltip:
                                                                'Delete Appointment',
                                                            icon: const Icon(
                                                              Icons.delete,
                                                              color: Colors
                                                                  .black87,
                                                            ),
                                                            onPressed: () {
                                                              showAlertDialog(
                                                                  context,
                                                                  meetingId: DoctorScheduleDoctorCubit.of(
                                                                          context)
                                                                      .todayMeetings[
                                                                          index]
                                                                      .uid!,
                                                                  userId: DoctorScheduleDoctorCubit.of(
                                                                          context)
                                                                      .todayMeetings[
                                                                          index]
                                                                      .userId!);
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
                        )
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
