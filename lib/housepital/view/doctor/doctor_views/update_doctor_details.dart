import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/logic/doctor_logic/doctor_profile/doctor_profile_cubit.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:grade_project/housepital/view/widgets/custom_text_form_field.dart';

class UpdateDoctorDetails extends StatelessWidget {
  final String label;
  final String field;
  const UpdateDoctorDetails(
      {Key? key, required this.label, required this.field})
      : super(key: key);

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
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextFormField(
                      controller:
                          DoctorProfileCubit.of(context).fieldController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter the $label';
                        }
                        return null;
                      },
                      hint: field,
                      ffem: 1,
                      fem: 1,
                      prefixIcon: FontAwesomeIcons.neos,
                      keyBoardType: TextInputType.name,
                      obscureText: false,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: state is DoctorProfileUpdateFieldLoadingState
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: primaryColor,
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () {
                              //todo
                              if (DoctorProfileCubit.of(context)
                                  .updateProfileFormKey
                                  .currentState!
                                  .validate()) {
                                DoctorProfileCubit.of(context).updateField(
                                  field: field,
                                  value: DoctorProfileCubit.of(context)
                                      .fieldController
                                      .text,
                                  context: context,
                                );
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: primaryColor,
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(32.0),
                              ),
                            ),
                            child: Text(
                              'Update',
                              style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
