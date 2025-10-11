part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthUserAuthenticated extends AuthState {
  final User? user;

  AuthUserAuthenticated(this.user);
}

class AuthUserUnauthenticated extends AuthState {}
