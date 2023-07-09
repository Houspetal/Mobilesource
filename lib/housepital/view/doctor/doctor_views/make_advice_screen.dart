import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:grade_project/housepital/view/doctor/doctor_layout/doctor_main_page.dart';
import 'package:grade_project/housepital/view/widgets/custom_text_form_field.dart';

import '../../../model/disease_model.dart';
import 'doctor_appointments.dart';

class DoctorMakingAdvice extends StatefulWidget {
  const DoctorMakingAdvice({Key? key}) : super(key: key);

  @override
  _DoctorMakingAdviceState createState() => _DoctorMakingAdviceState();
}

class _DoctorMakingAdviceState extends State<DoctorMakingAdvice> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _symtompsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _warningController = TextEditingController();
  final TextEditingController _spreadController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String timeText = 'Select Time';
  late String dateUTC;
  late String dateTime;
  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: Text(
        "OK",
        style: GoogleFonts.lato(fontWeight: FontWeight.bold),
      ),
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DoctorAppointments(),
          ),
        );
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "Done!",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text(
        "Advice made Successfully\n for users to see.",
        style: GoogleFonts.lato(),
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _nameController.dispose();
    _warningController.dispose();
    _spreadController.dispose();
    _descriptionController.dispose();
    _symtompsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Making Advice',
          style: GoogleFonts.lato(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: const Image(
                image: AssetImage('assets/appointment.jpg'),
                height: 250,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.only(top: 0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 16),
                      child: Text(
                        'Enter Advice Details',
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: _nameController,
                      maxLines: null,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Advice Name';
                        }
                        return null;
                      },
                      hint: 'Advice name',
                      prefixIcon: FontAwesomeIcons.adversal,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.text,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Advice Description';
                        }
                        return null;
                      },
                      hint: 'Description',
                      maxLines: null,
                      prefixIcon: FontAwesomeIcons.disease,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.text,
                      fem: 1,
                      ffem: 1,
                      controller: _descriptionController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      maxLines: null,
                      onTap: () {},
                      controller: _spreadController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Spread reasons';
                        }
                        return null;
                      },
                      hint: 'How does it Spread',
                      prefixIcon: FontAwesomeIcons.resolving,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.text,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      maxLines: null,
                      controller: _symtompsController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Symptoms';
                        }
                        return null;
                      },
                      hint: 'Illness Symptoms',
                      prefixIcon: FontAwesomeIcons.mandalorian,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.text,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      maxLines: null,
                      onTap: () {},
                      controller: _warningController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Advice To users';
                        }
                        return null;
                      },
                      hint: 'What is the advice',
                      prefixIcon: FontAwesomeIcons.rectangleAd,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.text,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: primaryColor,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            showAlertDialog(context);
                            DiseaseModel advice = DiseaseModel(
                              symtomps: _symtompsController.text,
                              spread: _spreadController.text,
                              description: _descriptionController.text,
                              name: _nameController.text,
                              warning: _warningController.text,
                            );
                            _createAdvice(advice: advice);
                          }
                        },
                        child: Text(
                          "Make advice",
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createAdvice({required DiseaseModel advice}) {
    //todo create Advice
    FirebaseFirestore.instance.collection("Diseases").add(advice.toJson()).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const DoctorMainPage(),
            ),
            (route) => false);
      },
    );
  }
}
