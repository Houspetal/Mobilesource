import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';

import '../../../logic/admin_logic/admin_home/admin_home_cubit.dart';
import 'explore_list.dart';

class AdminDoctorsList extends StatefulWidget {
  const AdminDoctorsList({super.key});

  @override
  _AdminDoctorsListState createState() => _AdminDoctorsListState();
}

class _AdminDoctorsListState extends State<AdminDoctorsList> {
  final TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdminHomeCubit, AdminHomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text('Find Doctors'),
            actions: <Widget>[
              SafeArea(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _textController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 20, top: 10, bottom: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[300],
                      hintText: 'Search Doctor',
                      hintStyle: GoogleFonts.lato(
                        color: Colors.black26,
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                      ),
                      prefixIcon: const Icon(
                        FontAwesomeIcons.searchengin,
                        size: 20,
                      ),
                      prefixStyle: TextStyle(
                        color: Colors.grey[300],
                      ),
                      suffixIcon: _textController.text.isNotEmpty
                          ? TextButton(
                              onPressed: () {
                                setState(() {
                                  _textController.clear();
                                });
                              },
                              child: const Icon(
                                Icons.close_rounded,
                                size: 20,
                              ),
                            )
                          : const SizedBox(),
                    ),
                    onChanged: (String searchKey) {
                      print('>>>$searchKey');
                      AdminHomeCubit.of(context).doctorSearch(
                        name: _textController.text,
                      );
                    },
                    style: GoogleFonts.lato(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textInputAction: TextInputAction.search,
                    autofocus: false,
                  ),
                ),
              )
            ],
          ),
          body: Container(
            child: AdminHomeCubit.of(context).searchDoctors.isEmpty ||
                    _textController.text.isEmpty
                ? Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Search For Doctors',
                            style: GoogleFonts.lato(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const Image(
                              image: AssetImage('assets/search-bg.png')),
                        ],
                      ),
                    ),
                  )
                : AdminExploreList(
                    doctors: AdminHomeCubit.of(context).searchDoctors,
                  ),
          ),
        );
      },
    );
  }
}
