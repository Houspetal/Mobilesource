part of 'doctor_profile_cubit.dart';

@immutable
abstract class DoctorProfileStates {}

class DoctorProfileInitial extends DoctorProfileStates {}

class DoctorProfileUpdateFieldSuccessState extends DoctorProfileStates {}

class DoctorProfileUpdateFieldLoadingState extends DoctorProfileStates {}

class DoctorProfileUpdateFieldErrorState extends DoctorProfileStates {}

class DoctorProfileUpdateImageSuccessState extends DoctorProfileStates {}

class DoctorProfileUpdateImageLoadingState extends DoctorProfileStates {}

class DoctorProfileUpdateImageErrorState extends DoctorProfileStates {}
