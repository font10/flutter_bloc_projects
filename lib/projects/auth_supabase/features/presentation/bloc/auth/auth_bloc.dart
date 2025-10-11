import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/auth_state_change_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/get_signed_user.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/logout_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/reset_password_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/save_uuid_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/sign_in_up_uc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  StreamSubscription<User?>? _userSubscription;

  final SignInUpUc signInUpUc;
  final LogoutUc logoutUc;
  final ResetPasswordUc resetPasswordUc;
  final SaveUuidUc saveUuidUc;
  final GetSignedUserUc getSignedUserUc;
  final AuthStateChangeUc authStateChangeUc;
  AuthBloc(
      {required this.signInUpUc,
      required this.logoutUc,
      required this.resetPasswordUc,
      required this.saveUuidUc,
      required this.getSignedUserUc,
      required this.authStateChangeUc})
      : super(AuthInitial()) {
    on<AuthInitialCheckRequested>(_onInitialAuthChecked);
    on<AuthLogoutButtonPressed>(_onLogoutButtonPressed);
    on<AuthOnCurrentUserChanged>(_onCurrentUserChanged);

    _startUserSubscription();
    /*on<AuthSignEvent>((event, emit) async {
      emit(AuthLoading());
      final Either<Failure, String> result = await signInUpUc.call(params: event.params, isSignIn: event.isSignIn);
      result.fold((l) => emit(AuthFailed(l.message)), (uuid) {
        saveUuidUc.call(uuid);
        emit(AuthSuccess(uuid));
      });
    });

    on<LogoutEvent>((event, emit) async {
      final Either<Failure, void> result = await logoutUc.call();
      result.fold((l) => emit(LogoutFailed(l.message)), (r) => emit(LogoutSuccess()));
    });

    on<ForgotPasswordEvent>((event, emit) async {
      final Either<Failure, void> result = await resetPasswordUc.call(event.email);
      result.fold((l) => emit(ResetPasswordFailed(l.message)), (r) => emit(ResetPasswordSuccess()));
    });*/
  }

  Future<void> _onInitialAuthChecked(AuthInitialCheckRequested event, Emitter<AuthState> emit) async {
    final Either<Failure, User?> signedInUser = await getSignedUserUc.call();
    print(signedInUser);
    signedInUser.fold((l) => emit(AuthUserUnauthenticated()), (r) => emit(AuthUserAuthenticated(r)));
    //signedInUser != null ? emit(AuthUserAuthenticated(signedInUser)) : emit(AuthUserUnauthenticated());
  }

  Future<void> _onLogoutButtonPressed(AuthLogoutButtonPressed event, Emitter<AuthState> emit) async {
    final Either<Failure, void> result = await logoutUc.call();
    //result.fold((l) => emit(LogoutFailed(l.message)), (r) => emit(LogoutSuccess()));
  }

  Future<void> _onCurrentUserChanged(AuthOnCurrentUserChanged event, Emitter<AuthState> emit) async =>
      event.user != null ? emit(AuthUserAuthenticated(event.user!)) : emit(AuthUserUnauthenticated());

  void _startUserSubscription() =>
      _userSubscription = authStateChangeUc.call().listen((user) => add(AuthOnCurrentUserChanged(user)));

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
