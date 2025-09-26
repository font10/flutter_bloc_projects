part of 'login_form_bloc.dart';

@immutable
sealed class LoginFormEvent {}

class LoginFormInitial extends LoginFormEvent {}

class LoginEmailChanged extends LoginFormEvent {
  final String email;

  LoginEmailChanged(this.email);

  List<Object?> get props => [email];
}

class LoginPasswordChanged extends LoginFormEvent {
  final String password;

  LoginPasswordChanged(this.password);

  List<Object?> get props => [password];
}

class LoginShowPasswordChanged extends LoginFormEvent {
  final bool showPassword;

  LoginShowPasswordChanged(this.showPassword);

  List<Object?> get props => [showPassword];
}

class LoginFormSubmitted extends LoginFormEvent {}

class LoginClearFields extends LoginFormEvent {}
