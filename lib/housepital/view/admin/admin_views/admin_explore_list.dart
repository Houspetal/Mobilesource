import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/model/doctor_model.dart';

import '../../../logic/admin_logic/admin_home/admin_home_cubit.dart';
import '../../../shared/constants/colors.dart';

class AdminExploreList extends StatelessWidget {
  final List<DoctorModel> doctors;
  const AdminExploreList({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminHomeCubit, AdminHomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return AdminHomeCubit.of(context).searchDoctors.isEmpty
            ? Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Doctor found!',
                      style: GoogleFonts.lato(
                        color: Colors.blue[800],
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Image(
                      image: AssetImage('assets/error-404.jpg'),
                      height: 250,
                      width: 250,
                    ),
                  ],
                ),
              )
            : ListView.builder(
                scrollDirection: Axis.vertical,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: doctors[index].isApproved!
                          ? primaryColor.withOpacity(.5)
                          : primaryColor.withOpacity(.1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 9,
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                backgroundColor: primaryColor.withOpacity(.5),
                                radius: 20,
                                backgroundImage: CachedNetworkImageProvider(
                                    "${doctors[index].image}"),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${doctors[index].name}",
                                    style: GoogleFonts.lato(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black87,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    "${doctors[index].department}",
                                    style: GoogleFonts.lato(
                                        fontSize: 14, color: Colors.black54),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  child: state
                                              is AdminHomeApproveDoctorsLoadingState ||
                                          state
                                              is AdminHomeUnApproveDoctorsLoadingState
                                      ? const Center(
                                          child: CircularProgressIndicator(
                                              color: primaryColor),
                                        )
                                      : Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                AdminHomeCubit.of(context)
                                                    .approveDoctor(
                                                        doctor: AdminHomeCubit
                                                                .of(context)
                                                            .doctors[index]);
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.check),
                                              color: Colors.green,
                                              padding: EdgeInsets.zero,
                                              style: const ButtonStyle(
                                                minimumSize:
                                                    MaterialStatePropertyAll(
                                                  Size(1, 1),
                                                ),
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                AdminHomeCubit.of(context)
                                                    .unApproveDoctor(
                                                  doctor:
                                                      AdminHomeCubit.of(context)
                                                          .doctors[index],
                                                );
                                              },
                                              padding: EdgeInsets.zero,
                                              style: const ButtonStyle(
                                                minimumSize:
                                                    MaterialStatePropertyAll(
                                                  Size(1, 1),
                                                ),
                                              ),
                                              color: Colors.red,
                                              icon: const FaIcon(
                                                FontAwesomeIcons.xmark,
                                              ),
                                            ),
                                          ],
                                        ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
