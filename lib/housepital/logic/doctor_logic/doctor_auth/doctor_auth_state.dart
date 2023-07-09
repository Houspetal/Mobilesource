part of 'doctor_auth_cubit.dart';

@immutable
abstract class DoctorAuthStates {}

class DoctorAuthInitial extends DoctorAuthStates {}

class DoctorAuthLoginLoadingState extends DoctorAuthStates {}

class DoctorAuthLoginSuccessState extends DoctorAuthStates {}

class DoctorChangeDepartmentSuccessState extends DoctorAuthStates {}

class DoctorChangeLocationSuccessState extends DoctorAuthStates {}

class DoctorAuthLoginErrorState extends DoctorAuthStates {}

class DoctorAuthGoogleLoginLoadingState extends DoctorAuthStates {}

class DoctorAuthGoogleLoginSuccessState extends DoctorAuthStates {}

class DoctorAuthGoogleLoginErrorState extends DoctorAuthStates {}

class DoctorAuthFacebookLoginLoadingState extends DoctorAuthStates {}

class DoctorAuthFacebookLoginSuccessState extends DoctorAuthStates {}

class DoctorAuthFacebookLoginErrorState extends DoctorAuthStates {}

class DoctorAuthChangePasswordLoadingState extends DoctorAuthStates {}

class DoctorAuthChangePasswordSuccessState extends DoctorAuthStates {}

class DoctorAuthChangePasswordErrorState extends DoctorAuthStates {}

class DoctorAuthChangePasswordVisibilityState extends DoctorAuthStates {}

class DoctorAuthRegisterLoadingState extends DoctorAuthStates {}

class DoctorAuthRegisterSuccessState extends DoctorAuthStates {}

class DoctorAuthRegisterErrorState extends DoctorAuthStates {}

class DoctorAuthLogoutSuccessState extends DoctorAuthStates {}

class DoctorAuthLogoutErrorState extends DoctorAuthStates {}
