import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';

import '../../../logic/doctor_logic/doctor_profile/doctor_profile_cubit.dart';

class UpdateUserProfileDetails extends StatelessWidget {
  final String label;
  final String field;

  const UpdateUserProfileDetails({
    Key? key,
    required this.label,
    required this.field,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: primaryColor,
          ),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Update $label",
            style: GoogleFonts.lato(
              color: primaryColor,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BlocConsumer<DoctorProfileCubit, DoctorProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: Form(
              key: DoctorProfileCubit.of(context).updateProfileFormKey,
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 400,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                        colors: [primaryColor, Colors.indigoAccent])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        DoctorProfileCubit.of(context)
                            .getProfileImageFromGallery(context);
                      },
                      icon: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                              shape: BoxShape.circle),
                          child: const Icon(Icons.camera_enhance_outlined)),
                      color: Colors.white,
                      iconSize: 75,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    if (state is DoctorProfileUpdateImageLoadingState)
                      const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
