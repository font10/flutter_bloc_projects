import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_mode_event.dart';
part 'auth_mode_state.dart';

class AuthModeBloc extends Bloc<AuthModeEvent, AuthModeState> {
  AuthModeBloc() : super(AuthModeState(AuthMode.login)) {
    on<ToggleAuthMode>(_onToggleAuthMode);
  }

  void _onToggleAuthMode(ToggleAuthMode event, Emitter<AuthModeState> emit) {
    final newMode = state.isLogin ? AuthMode.signUp : AuthMode.login;
    emit(AuthModeState(newMode));
  }
}
