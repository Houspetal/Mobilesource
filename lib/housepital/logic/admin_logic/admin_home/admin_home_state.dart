part of 'admin_home_cubit.dart';

@immutable
abstract class AdminHomeStates {}

class AdminHomeInitial extends AdminHomeStates {}

class AdminHomeGetAdminSuccessState extends AdminHomeStates {}

class AdminHomeNameSearchSuccessState extends AdminHomeStates {}

class AdminHomeGetDoctorsLoadingState extends AdminHomeStates {}

class AdminHomeGetDoctorsSuccessState extends AdminHomeStates {}

class AdminHomeGetDoctorsErrorState extends AdminHomeStates {}

class AdminHomeGetUsersLoadingState extends AdminHomeStates {}

class AdminHomeGetUsersSuccessState extends AdminHomeStates {}

class AdminHomeGetUsersErrorState extends AdminHomeStates {}

class AdminHomeApproveDoctorsLoadingState extends AdminHomeStates {}

class AdminHomeApproveDoctorsSuccessState extends AdminHomeStates {}

class AdminHomeApproveDoctorsErrorState extends AdminHomeStates {}

class AdminHomeUnApproveDoctorsLoadingState extends AdminHomeStates {}

class AdminHomeUnApproveDoctorsSuccessState extends AdminHomeStates {}

class AdminHomeUnApproveDoctorsErrorState extends AdminHomeStates {}
