import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:grade_project/housepital/view/admin/admin_views/explore_list.dart';
import 'package:intl/intl.dart';

import '../../../logic/admin_logic/admin_home/admin_home_cubit.dart';
import '../../../shared/constants/colors.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  _AdminHomePageState createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController _doctorName = TextEditingController();

  @override
  void initState() {
    super.initState();
    _doctorName = TextEditingController();
  }

  @override
  void dispose() {
    _doctorName.dispose();
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
      body: BlocConsumer<AdminHomeCubit, AdminHomeStates>(
        listener: (context, state) {
          if (state is AdminHomeGetAdminSuccessState) {
            setState(() {
              user;
              uid;
            });
          }
        },
        builder: (context, state) => user == null ||
                AdminHomeCubit.of(context).doctors.isEmpty ||
                AdminHomeCubit.of(context).users.isEmpty
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
                            "Hello ${user!.username}",
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
                            "Let's Manage\nApplication",
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
                            "Total Numbers",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .45,
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: primaryColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius: .3,
                                        blurRadius: 4,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.monetization_on,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${AdminHomeCubit.of(context).users.length} User",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black45,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              ),
                                            ]),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Total Users using Housepital",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black45,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .45,
                                height:
                                    MediaQuery.of(context).size.height * .25,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: primaryColor,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black,
                                        blurStyle: BlurStyle.outer,
                                        spreadRadius: .3,
                                        blurRadius: 4,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.monetization_on,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "${AdminHomeCubit.of(context).doctors.length} Doctor",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black45,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              ),
                                            ]),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "Total Doctors using Housepital",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            shadows: [
                                              Shadow(
                                                color: Colors.black45,
                                                blurRadius: 5,
                                                offset: Offset(1, 1),
                                              ),
                                            ]),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              left: 20, bottom: 10, top: 5),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Manage Doctors",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.lato(
                                color: Colors.blue[800],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        AdminExploreList(
                          doctors: AdminHomeCubit.of(context).doctors,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
