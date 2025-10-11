part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthUserAuthenticated extends AuthState {
  final User? user;

  AuthUserAuthenticated(this.user);
}

class AuthUserUnauthenticated extends AuthState {}

class AuthUserLogoutSuccess extends AuthState {}

class AuthUserLogoutFailed extends AuthState {
  final String message;

  AuthUserLogoutFailed(this.message);
}
