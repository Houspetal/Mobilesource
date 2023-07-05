part of 'doctor_schedule_cubit.dart';

@immutable
abstract class DoctorScheduleStates {}

class DoctorScheduleInitial extends DoctorScheduleStates {}

class DoctorGetSchedulesSuccessState extends DoctorScheduleStates {}

class DoctorGetSchedulesLoadingState extends DoctorScheduleStates {}

class DoctorGetSchedulesErrorState extends DoctorScheduleStates {}

class DoctorDeleteSchedulesSuccessState extends DoctorScheduleStates {}

class DoctorDeleteSchedulesLoadingState extends DoctorScheduleStates {}

class DoctorDeleteSchedulesErrorState extends DoctorScheduleStates {}
