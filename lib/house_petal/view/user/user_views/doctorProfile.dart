import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/shared/constants.dart';
import 'package:grade_project/house_petal/view/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bookingScreen.dart';

class DoctorProfile extends StatefulWidget {
  final String doctor;

  const DoctorProfile({Key? key, this.doctor = ""}) : super(key: key);
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  _launchCaller(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.only(left: 5),
                  child: IconButton(
                    icon: const Icon(
                      Icons.chevron_left_sharp,
                      color: Colors.indigo,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg"),
                  //backgroundColor: Colors.lightBlue[100],
                  radius: 80,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "document['name']",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "document['type']",
                  style: GoogleFonts.lato(
                      //fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (var i = 0; i < 4; i++)
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.indigoAccent,
                        size: 30,
                      ),
                    //todo rating
                    if (5 - 4 > 0)
                      for (var i = 0; i < 5 - 4; i++)
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.black12,
                          size: 30,
                        ),
                  ],
                ),
                const SizedBox(
                  height: 14,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 22, right: 22),
                  alignment: Alignment.center,
                  child: Text(
                    "document['specification']",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.place_outlined),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.4,
                        child: Text(
                          "document['address']",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 12,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(FontAwesomeIcons.phone),
                      const SizedBox(
                        width: 11,
                      ),
                      TextButton(
                        onPressed: () =>
                            _launchCaller("tel:" "document['phone']"),
                        child: Text(
                          "document['phone'].toString()",
                          style: GoogleFonts.lato(
                              fontSize: 16, color: Colors.blue),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(Icons.access_time_rounded),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Working Hours',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.only(left: 60),
                  child: Wrap(
                    children: [
                      Text(
                        'Today: ',
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "document['openHour'] - document['closeHour']",
                        style: GoogleFonts.lato(
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: CustomButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BookingScreen(
                            doctor: "document['name']",
                          ),
                        ),
                      );
                    },
                    color: primaryColor,
                    text: 'Book an Appointment',
                    radius: 20,
                    ffem: 1,
                    fem: 1,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
