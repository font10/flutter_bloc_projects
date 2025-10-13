part of 'signup_form_bloc.dart';

@immutable
sealed class SignUpFormEvent {}

class SignUpFormInitial extends SignUpFormEvent {}

class SignUpEmailAddressChanged extends SignUpFormEvent {
  final String email;

  SignUpEmailAddressChanged(this.email);

  List<Object?> get props => [email];
}

class SignUpPasswordChanged extends SignUpFormEvent {
  final String password;

  SignUpPasswordChanged(this.password);

  List<Object?> get props => [password];
}

class SignUpShowPasswordChanged extends SignUpFormEvent {
  final bool showPassword;

  SignUpShowPasswordChanged(this.showPassword);

  List<Object?> get props => [showPassword];
}

class SignUpFormSubmitted extends SignUpFormEvent {}

class SignUpClearFields extends SignUpFormEvent {}

class SignUpButtonPressed extends SignUpFormEvent {
  SignUpButtonPressed();

  @override
  List<Object?> get props => [];
}
