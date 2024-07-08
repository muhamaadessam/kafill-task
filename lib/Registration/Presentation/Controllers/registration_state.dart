part of 'registration_cubit.dart';

@immutable
abstract class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class ChangeRememberMeStatus extends RegistrationState {}

class ChangeShowPasswordStatus extends RegistrationState {}

class ChangeLoginAndSignUp extends RegistrationState {}

class SignUpSuccess extends RegistrationState {}

class SignUpLoading extends RegistrationState {}

class SignUpError extends RegistrationState {
  final String? error;

  SignUpError({this.error});
}

class CheckOTPSuccess extends RegistrationState {}

class CheckOTPLoading extends RegistrationState {}

class CheckOTPError extends RegistrationState {
  final String? error;

  CheckOTPError({this.error});
}

class PickFileLoadingState extends RegistrationState {}

class PickFileSuccessState extends RegistrationState {}

class PickFileErrorState extends RegistrationState {
  final String error;

  PickFileErrorState(this.error);
}

class ChangeSalaryStatus extends RegistrationState {}

class ChangeGenderStatus extends RegistrationState {}

class ChangeSocialMediaCheckStatus extends RegistrationState {}

class RemoveSkillStatus extends RegistrationState {}

class ShowErrorMessageStatus extends RegistrationState {}
