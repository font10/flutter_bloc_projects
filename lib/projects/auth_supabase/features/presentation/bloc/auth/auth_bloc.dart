import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/error/failure.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/logout_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/reset_password_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/save_uuid_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/sign_in_up_uc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignInUpUc signInUpUc;
  final LogoutUc logoutUc;
  final ResetPasswordUc resetPasswordUc;
  final SaveUuidUc saveUuidUc;
  AuthBloc({required this.signInUpUc, required this.logoutUc, required this.resetPasswordUc, required this.saveUuidUc})
      : super(AuthInitial()) {
    on<AuthSignEvent>((event, emit) async {
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
    });
  }
}
