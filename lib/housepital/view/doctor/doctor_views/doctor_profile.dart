import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:grade_project/housepital/view/doctor/doctor_views/doctor_settings.dart';

import '../../../logic/doctor_logic/doctor_profile/doctor_profile_cubit.dart';
import '../../../shared/constants/constants.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user == null
          ? const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            )
          : SafeArea(
              child: BlocConsumer<DoctorProfileCubit, DoctorProfileStates>(
                listener: (context, state) {
                  // TODO: implement listener
                },
                builder: (context, state) {
                  return ListView(
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    children: <Widget>[
                      Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    stops: [0.1, 0.5],
                                    colors: [
                                      Colors.pinkAccent,
                                      primaryColor,
                                    ],
                                  ),
                                ),
                                height: MediaQuery.of(context).size.height / 5,
                                child: Container(
                                  padding:
                                      const EdgeInsets.only(top: 10, right: 7),
                                  alignment: Alignment.topRight,
                                  child: IconButton(
                                    icon: const Icon(
                                      FontAwesomeIcons.gear,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DoctorSettings(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: MediaQuery.of(context).size.height / 5,
                                padding: const EdgeInsets.only(top: 75),
                                child: Text(
                                  user!.name!,
                                  style: GoogleFonts.lato(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.teal[50]!,
                                  width: 5,
                                ),
                                shape: BoxShape.circle),
                            child: CircleAvatar(
                              radius: 80,
                              backgroundColor: Colors.white,
                              backgroundImage:
                                  user!.image == "assets/person.jpg"
                                      ? const AssetImage('assets/person.jpg')
                                      : CachedNetworkImageProvider(user!.image!)
                                          as ImageProvider,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        padding: const EdgeInsets.only(left: 20),
                        height: MediaQuery.of(context).size.height / 7,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[50],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    color: Colors.red[900],
                                    child: const Icon(
                                      Icons.mail_rounded,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  user!.email!,
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    color: Colors.blue[800],
                                    child: const Icon(
                                      Icons.phone,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  user!.phone == null
                                      ? "Not Set"
                                      : user!.phone!,
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 20,
                        ),
                        padding: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          bottom: 20,
                        ),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[50],
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 27,
                                    width: 27,
                                    color: primaryColor,
                                    child: const Icon(
                                      FontAwesomeIcons.pencil,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Department',
                                  style: GoogleFonts.lato(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              child: getDepartment(),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  );
                },
              ),
            ),
    );
  }

  Widget getDepartment() {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(top: 10, left: 40),
      child: Text(
        user!.department ?? "Not Set Yet",
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black38,
        ),
      ),
    );
  }
}
