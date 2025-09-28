part of 'login_form_bloc.dart';

@immutable
abstract class LoginFormEvent extends Equatable {
  const LoginFormEvent();

  @override
  List<Object?> get props => [];
}

class LoginEmailAddressChanged extends LoginFormEvent {
  final String value;

  const LoginEmailAddressChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class LoginPasswordChanged extends LoginFormEvent {
  final String value;

  const LoginPasswordChanged(this.value);
  @override
  List<Object?> get props => [value];
}

class LoginButtonPressed extends LoginFormEvent {
  const LoginButtonPressed();

  @override
  List<Object?> get props => [];
}
