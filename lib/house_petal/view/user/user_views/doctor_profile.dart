import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/logic/doctor_schedule/doctor_schedule_cubit.dart';
import 'package:grade_project/house_petal/model/doctor_model.dart';
import 'package:grade_project/house_petal/shared/constants/colors.dart';
import 'package:grade_project/house_petal/view/widgets/custom_button.dart';

import 'booking_screen.dart';

class DoctorProfile extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorProfile({Key? key, required this.doctor}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<DoctorScheduleCubit, DoctorScheduleStates>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return Container(
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
                    CircleAvatar(
                      backgroundImage:
                          CachedNetworkImageProvider(doctor.image!),
                      //backgroundColor: Colors.lightBlue[100],
                      radius: 80,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${doctor.name}",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${doctor.type}",
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
                        for (var i = 0; i < int.parse(doctor.rating!); i++)
                          const Icon(
                            Icons.star_rounded,
                            color: Colors.indigoAccent,
                            size: 30,
                          ),
                        if (5 - int.parse(doctor.rating!) > 0)
                          for (var i = 0;
                              i < 5 - int.parse(doctor.rating!);
                              i++)
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
                        "${doctor.department}",
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
                              "${doctor.location}",
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
                            onPressed: () => DoctorScheduleCubit.of(context)
                                .launchCaller("tel:" "${doctor.mobile}"),
                            child: Text(
                              "${doctor.mobile}",
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
                            "${doctor.time}",
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
                              builder: (context) => BookingScreen(
                                doctor: doctor,
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
              );
            },
          ),
        ),
      ),
    );
  }
}
