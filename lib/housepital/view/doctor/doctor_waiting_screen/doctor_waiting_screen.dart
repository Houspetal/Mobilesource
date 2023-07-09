import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/logic/doctor_logic/doctor_auth/doctor_auth_cubit.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorWaitingScreen extends StatelessWidget {
  const DoctorWaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                DoctorAuthCubit.of(context).signOut(context);
              },
              child: Text(
                "Go Back",
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  height: 1.3333333333,
                  color: primaryColor,
                ),
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/svg/doctor.svg",
              semanticsLabel: 'Waiting Logo',
              width: 110,
              height: 110,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Waiting for admin approval",
              textAlign: TextAlign.center,
              style: GoogleFonts.josefinSans(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                height: 1.3333333333,
                color: const Color(0xff333647),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () async {
                String url =
                    Uri.encodeFull("whatsapp://send?phone=+201558499592");
                if (await canLaunch(url)) {
                  await launch(url);
                }
              },
              child: Text(
                "To Contact With Admin Now Click Here",
                textAlign: TextAlign.center,
                style: GoogleFonts.josefinSans(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 1.3333333333,
                  color: primaryColor,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
