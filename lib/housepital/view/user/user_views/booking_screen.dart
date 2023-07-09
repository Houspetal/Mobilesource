import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/housepital/logic/user_logic/doctor_schedule/doctor_schedule_cubit.dart';
import 'package:grade_project/housepital/shared/constants/colors.dart';
import 'package:grade_project/housepital/shared/constants/constants.dart';
import 'package:grade_project/housepital/view/user/user_layout/main_page.dart';
import 'package:grade_project/housepital/view/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

import '../../../model/doctor_model.dart';
import '../../../model/schedule_model.dart';
import 'user_appointments.dart';

class UserBookingScreen extends StatefulWidget {
  final DoctorModel doctor;

  const UserBookingScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  _UserBookingScreenState createState() => _UserBookingScreenState();
}

class _UserBookingScreenState extends State<UserBookingScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _doctorController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay currentTime = TimeOfDay.now();
  String timeText = 'Select Time';
  late String dateUTC;
  late String dateTime;

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then(
      (date) {
        setState(
          () {
            selectedDate = date!;
            String formattedDate =
                DateFormat('dd-MM-yyyy').format(selectedDate);
            _dateController.text = formattedDate;
            dateUTC = DateFormat('yyyy-MM-dd').format(selectedDate);
          },
        );
      },
    );
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: currentTime,
    );

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    String formattedTime = localizations.formatTimeOfDay(selectedTime!,
        alwaysUse24HourFormat: false);

    setState(() {
      timeText = formattedTime;
      _timeController.text = timeText;
    });
    dateTime = selectedTime.toString().substring(10, 15);
  }

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
            builder: (context) => const UserAppointments(),
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
        "Appointment is registered.",
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
    selectTime(context);
    _doctorController.text = widget.doctor.name!;
    _nameController.text = user!.username!;
    if (user!.phone != null) {
      _phoneController.text = user!.phone!;
    }
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
          'Appointment booking',
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
                        'Enter Patient Details',
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
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Patient Name';
                        }
                        return null;
                      },
                      hint: 'Patient name',
                      prefixIcon: FontAwesomeIcons.person,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.name,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Enter Phone number';
                        } else if (value.toString().length < 10) {
                          return 'Please Enter correct Phone number';
                        }
                        return null;
                      },
                      hint: 'Mobile',
                      prefixIcon: FontAwesomeIcons.mobile,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.phone,
                      fem: 1,
                      ffem: 1,
                      controller: _phoneController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      controller: _descriptionController,
                      hint: 'Description',
                      prefixIcon: FontAwesomeIcons.audioDescription,
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
                      controller: _doctorController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Doctor name';
                        }
                        return null;
                      },
                      hint: 'Doctor Name',
                      prefixIcon: FontAwesomeIcons.userDoctor,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.name,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      onTap: () {
                        selectDate(context);
                      },
                      controller: _dateController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Date';
                        }
                        return null;
                      },
                      hint: 'Select Date',
                      prefixIcon: FontAwesomeIcons.calendar,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.datetime,
                      fem: 1,
                      ffem: 1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                      onTap: () {
                        selectTime(context);
                      },
                      controller: _timeController,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please enter Time';
                        }
                        return null;
                      },
                      hint: 'Select Time',
                      prefixIcon: FontAwesomeIcons.clock,
                      obscureText: false,
                      alignment: Alignment.center,
                      keyBoardType: TextInputType.datetime,
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
                            ScheduleModel meeting = ScheduleModel(
                              time: _timeController.text,
                              date: _dateController.text,
                              description: _descriptionController.text,
                              doctorName: _doctorController.text,
                              mobile: _phoneController.text,
                              patientName: _nameController.text,
                              userId: uid,
                            );
                            _createAppointment(meeting: meeting);
                          }
                        },
                        child: Text(
                          "Book Appointment",
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

  void _createAppointment({required ScheduleModel meeting}) {
    //todo create Appointment
    FirebaseFirestore.instance
        .collection("Users")
        .doc(uid)
        .collection("Meetings")
        .add(meeting.toJson())
        .then(
      (value) {
        value.update({"uid": value.id});
        DoctorScheduleCubit.of(context).getAllMeetings();
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const MainPage(),
            ),
            (route) => false);
      },
    );
  }
}
