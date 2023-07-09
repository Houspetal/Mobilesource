part of 'doctor_schedule_cubit.dart';

@immutable
abstract class DoctorScheduleDoctorStates {}

class DoctorScheduleInitial extends DoctorScheduleDoctorStates {}

class DoctorGetSchedulesSuccessState extends DoctorScheduleDoctorStates {}

class DoctorGetSchedulesLoadingState extends DoctorScheduleDoctorStates {}

class DoctorGetSchedulesErrorState extends DoctorScheduleDoctorStates {}

class DoctorDeleteSchedulesSuccessState extends DoctorScheduleDoctorStates {}

class DoctorDeleteSchedulesLoadingState extends DoctorScheduleDoctorStates {}

class DoctorDeleteSchedulesErrorState extends DoctorScheduleDoctorStates {}
