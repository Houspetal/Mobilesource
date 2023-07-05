part of 'user_auth_cubit.dart';

@immutable
abstract class UserAuthStates {}

class UserAuthInitial extends UserAuthStates {}

class UserAuthLoginLoadingState extends UserAuthStates {}

class UserAuthLoginSuccessState extends UserAuthStates {}

class UserAuthLoginErrorState extends UserAuthStates {}

class UserAuthGoogleLoginLoadingState extends UserAuthStates {}

class UserAuthGoogleLoginSuccessState extends UserAuthStates {}

class UserAuthGoogleLoginErrorState extends UserAuthStates {}

class UserAuthFacebookLoginLoadingState extends UserAuthStates {}

class UserAuthFacebookLoginSuccessState extends UserAuthStates {}

class UserAuthFacebookLoginErrorState extends UserAuthStates {}

class UserAuthChangePasswordLoadingState extends UserAuthStates {}

class UserAuthChangePasswordSuccessState extends UserAuthStates {}

class UserAuthChangePasswordErrorState extends UserAuthStates {}

class UserAuthChangePasswordVisibilityState extends UserAuthStates {}

class UserAuthRegisterLoadingState extends UserAuthStates {}

class UserAuthRegisterSuccessState extends UserAuthStates {}

class UserAuthRegisterErrorState extends UserAuthStates {}

class UserAuthLogoutSuccessState extends UserAuthStates {}

class UserAuthLogoutErrorState extends UserAuthStates {}
