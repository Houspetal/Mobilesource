part of 'user_home_cubit.dart';

@immutable
abstract class UserHomeStates {}

class UserHomeInitial extends UserHomeStates {}

class UserHomeGetUserLoadingState extends UserHomeStates {}

class UserHomeGetUserSuccessState extends UserHomeStates {}

class UserHomeGetUserErrorState extends UserHomeStates {}

class UserHomeGetDoctorsLoadingState extends UserHomeStates {}

class UserHomeGetDoctorsSuccessState extends UserHomeStates {}

class UserHomeDepartmentSearchSuccessState extends UserHomeStates {}
class UserHomeNameSearchSuccessState extends UserHomeStates {}

class UserHomeNameSearchLoadingState extends UserHomeStates {}

class UserHomeGetDoctorsErrorState extends UserHomeStates {}
