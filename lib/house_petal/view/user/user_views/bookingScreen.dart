import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grade_project/house_petal/view/widgets/custom_text_form_field.dart';
import 'package:intl/intl.dart';

import 'myAppointments.dart';

class BookingScreen extends StatefulWidget {
  final String doctor;

  const BookingScreen({Key? key, required this.doctor}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
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
  late String date_Time;

  Future<void> selectDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
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
    date_Time = selectedTime.toString().substring(10, 15);
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
            builder: (context) => const MyAppointments(),
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
    _doctorController.text = widget.doctor;
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
        child: NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (OverscrollIndicatorNotification overscroll) {
            overscroll.disallowIndicator();
            return false;
          },
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
                        keyBoardType: TextInputType.text,
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
                        keyBoardType: TextInputType.text,
                        fem: 1,
                        ffem: 1,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        onTap: () {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2025),
                          );
                        },
                        controller: _dateController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please enter Date';
                          }
                          return null;
                        },
                        hint: 'Select Date',
                        prefixIcon: FontAwesomeIcons.userDoctor,
                        obscureText: false,
                        alignment: Alignment.center,
                        keyBoardType: TextInputType.text,
                        fem: 1,
                        ffem: 1,
                        suffixIcon: FontAwesomeIcons.calendar,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        onTap: () {
                          showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                        },
                        controller: _dateController,
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Please enter Date';
                          }
                          return null;
                        },
                        hint: 'Select Time',
                        prefixIcon: FontAwesomeIcons.userDoctor,
                        obscureText: false,
                        alignment: Alignment.center,
                        keyBoardType: TextInputType.text,
                        fem: 1,
                        ffem: 1,
                        suffixIcon: FontAwesomeIcons.clock,
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
                            backgroundColor: Colors.indigo,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              print(_nameController.text);
                              print(_dateController.text);
                              print(widget.doctor);
                              showAlertDialog(context);
                              _createAppointment();
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
      ),
    );
  }

  Future<void> _createAppointment() async {
    //todo create Appointment
  }
}
