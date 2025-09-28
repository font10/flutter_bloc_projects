part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class AuthInitialCheckRequested extends AuthEvent {}

class AuthOnCurrentUserChanged extends AuthEvent {
  final User? user;

  AuthOnCurrentUserChanged(this.user);
}

class AuthLogoutButtonPressed extends AuthEvent {}

/*class SignUpEvent extends AuthEvent {
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
}*/
