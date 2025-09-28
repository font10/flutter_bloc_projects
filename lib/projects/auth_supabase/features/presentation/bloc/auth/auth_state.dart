part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

class AuthInitial extends AuthState {}

class AuthUserAuthenticated extends AuthState {
  final User user;

  AuthUserAuthenticated(this.user);
}

class AuthUserUnauthenticated extends AuthState {}

/*
final class AuthInitial extends AuthState {}

final class AuthSuccess extends AuthState {
  final String uuid;

  AuthSuccess(this.uuid);
}

final class AuthLoading extends AuthState {}

final class AuthFailed extends AuthState {
  final String message;
  AuthFailed(this.message);
}

final class LogoutSuccess extends AuthState {}

final class LogoutFailed extends AuthState {
  final String message;
  LogoutFailed(this.message);
}

final class ResetPasswordSuccess extends AuthState {}

final class ResetPasswordFailed extends AuthState {
  final String message;
  ResetPasswordFailed(this.message);
}
*/
