import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/logic/user_home/user_home_cubit.dart';
import 'package:grade_project/house_petal/model/doctor_model.dart';
import 'package:grade_project/house_petal/shared/constants/colors.dart';
import 'package:typicons_flutter/typicons_flutter.dart';

import '../user_views/doctor_profile.dart';

class SearchList extends StatelessWidget {
  final List<DoctorModel> doctors;

  const SearchList({Key? key, required this.doctors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<UserHomeCubit, UserHomeStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) => UserHomeCubit.of(context)
                  .searchDoctors
                  .isEmpty
              ? Center(
                  child: Container(
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
                  ),
                )
              : Scrollbar(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Card(
                          color: primaryColor.withOpacity(.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 0),
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height / 9,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DoctorProfile(
                                      doctor: doctors[index],
                                    ),
                                  ),
                                );
                              },
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  CircleAvatar(
                                    backgroundImage: CachedNetworkImageProvider(
                                        "${doctors[index].image}"),
                                    //backgroundColor: Colors.blue,
                                    radius: 20,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${doctors[index].name}",
                                        style: GoogleFonts.lato(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Text(
                                        "${doctors[index].department}",
                                        style: GoogleFonts.lato(
                                            fontSize: 14,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.centerRight,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Typicons.star_full_outline,
                                            size: 20,
                                            color: Colors.indigo[400],
                                          ),
                                          const SizedBox(
                                            width: 3,
                                          ),
                                          Text(
                                            "${doctors[index].rating} Stars",
                                            style: GoogleFonts.lato(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              color: Colors.indigo,
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
                  ),
                ),
        ),
      ),
    );
  }
}
