part of 'auth_mode_bloc.dart';

enum AuthMode { login, signUp }

class AuthModeState {
  final AuthMode mode;

  AuthModeState(this.mode);

  bool get isLogin => mode == AuthMode.login;
  bool get isSignUp => mode == AuthMode.signUp;
}
