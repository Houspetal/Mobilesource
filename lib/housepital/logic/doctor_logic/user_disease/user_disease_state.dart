part of 'user_disease_cubit.dart';

@immutable
abstract class UserDiseaseStates {}

class UserDiseaseInitial extends UserDiseaseStates {}

class UserDiseaseGetDiseasesSuccessState extends UserDiseaseStates {}

class UserDiseaseGetDiseasesLoadingState extends UserDiseaseStates {}

class UserDiseaseGetDiseasesErrorState extends UserDiseaseStates {}
