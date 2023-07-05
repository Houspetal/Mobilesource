import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/logic/user_profile/user_profile_cubit.dart';
import 'package:grade_project/house_petal/view/widgets/custom_text_form_field.dart';

class UpdateUserDetails extends StatelessWidget {
  final String label;
  final String field;
  const UpdateUserDetails({Key? key, required this.label, required this.field})
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
            color: Colors.indigo,
          ),
        ),
        title: Container(
          alignment: Alignment.centerLeft,
          child: Text(
            "Update $label",
            style: GoogleFonts.lato(
              color: Colors.indigo,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: BlocConsumer<UserProfileCubit, UserProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(5, 20, 5, 0),
            child: Form(
              key: UserProfileCubit.of(context).updateProfileFormKey,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    child: CustomTextFormField(
                      controller: UserProfileCubit.of(context).fieldController,
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
                    child: ElevatedButton(
                      onPressed: () {
                        //todo
                        if (UserProfileCubit.of(context)
                            .updateProfileFormKey
                            .currentState!
                            .validate()) {
                          UserProfileCubit.of(context).updateField(
                            field: field,
                            value: UserProfileCubit.of(context)
                                .fieldController
                                .text,
                            context: context,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.indigo.withOpacity(0.9),
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
