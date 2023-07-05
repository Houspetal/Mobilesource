part of 'user_profile_cubit.dart';

@immutable
abstract class UserProfileStates {}

class UserProfileInitial extends UserProfileStates {}

class UserProfileUpdateFieldSuccessState extends UserProfileStates {}

class UserProfileUpdateFieldLoadingState extends UserProfileStates {}

class UserProfileUpdateFieldErrorState extends UserProfileStates {}

class UserProfileUpdateImageSuccessState extends UserProfileStates {}

class UserProfileUpdateImageLoadingState extends UserProfileStates {}

class UserProfileUpdateImageErrorState extends UserProfileStates {}
