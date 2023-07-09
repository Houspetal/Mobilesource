part of 'admin_auth_cubit.dart';

@immutable
abstract class AdminAuthStates {}

class AdminAuthInitial extends AdminAuthStates {}

class AdminAuthLoginLoadingState extends AdminAuthStates {}

class AdminAuthLoginSuccessState extends AdminAuthStates {}

class AdminAuthLoginErrorState extends AdminAuthStates {}

class AdminAuthChangePasswordVisibilityState extends AdminAuthStates {}

class AdminAuthLogoutSuccessState extends AdminAuthStates {}

class AdminAuthLogoutErrorState extends AdminAuthStates {}
