part of 'auth_mode_bloc.dart';

abstract class AuthModeEvent {}

class ToggleAuthMode extends AuthModeEvent {
  final AuthMode authMode;
  ToggleAuthMode(this.authMode);
}
