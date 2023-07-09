part of 'doctor_home_cubit.dart';

@immutable
abstract class DoctorHomeStates {}

class DoctorHomeInitial extends DoctorHomeStates {}

class DoctorHomeGetDoctorLoadingState extends DoctorHomeStates {}

class DoctorHomeGetDoctorSuccessState extends DoctorHomeStates {}

class DoctorHomeGetDoctorErrorState extends DoctorHomeStates {}

class DoctorHomeGetDoctorsLoadingState extends DoctorHomeStates {}

class DoctorHomeGetDoctorsSuccessState extends DoctorHomeStates {}

class DoctorHomeDepartmentSearchSuccessState extends DoctorHomeStates {}

class DoctorHomeNameSearchSuccessState extends DoctorHomeStates {}

class DoctorHomeNameSearchLoadingState extends DoctorHomeStates {}

class DoctorHomeGetDoctorsErrorState extends DoctorHomeStates {}
