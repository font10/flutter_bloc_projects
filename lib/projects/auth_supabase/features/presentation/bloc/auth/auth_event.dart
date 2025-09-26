part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class SignUpEvent extends AuthEvent {
  final AuthParamsEntity params;
  SignUpEvent(this.params);
}

class LoginEvent extends AuthEvent {
  final AuthParamsEntity params;
  LoginEvent(this.params);
}

class AuthSignEvent extends AuthEvent {
  final bool isSignIn;
  final AuthParamsEntity params;
  AuthSignEvent({required this.isSignIn, required this.params});
}

class LogoutEvent extends AuthEvent {}

class ForgotPasswordEvent extends AuthEvent {
  final String email;
  ForgotPasswordEvent(this.email);
}

/*
class AuthEmailChanged extends AuthEvent {
  final String email;

  AuthEmailChanged(this.email);

  List<Object?> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  AuthPasswordChanged(this.password);

  List<Object?> get props => [password];
}

class AuthFormSubmitted extends AuthEvent {}
*/
