import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/email_input.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/password_input.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/sign_in_up_uc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:meta/meta.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  final SignInUpUc signInUpUc;
  SignUpFormBloc({required this.signInUpUc}) : super(const SignUpFormState()) {
    on<SignUpEmailAddressChanged>(_onEmailAddressChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpShowPasswordChanged>(_onShowPasswordChanged);
    on<SignUpButtonPressed>(_onSignUpButtonPressed);
    on<SignUpClearFields>(_onClearFields);
  }

  Future<void> _onEmailAddressChanged(
    SignUpEmailAddressChanged event,
    Emitter<SignUpFormState> emit,
  ) async =>
      emit(state.copyWith(
        email: EmailInput.create(event.email),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onPasswordChanged(
    SignUpPasswordChanged event,
    Emitter<SignUpFormState> emit,
  ) async =>
      emit(state.copyWith(
        password: PasswordInput.create(event.password),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  void _onShowPasswordChanged(SignUpShowPasswordChanged event, Emitter<SignUpFormState> emit) {
    emit(state.copyWith(
      showPassword: event.showPassword,
    ));
  }

  void _onClearFields(SignUpClearFields event, Emitter<SignUpFormState> emit) {
    emit(state.copyWith(
      email: EmailInput.empty,
      password: PasswordInput.empty,
    ));
  }

  Future<void> _onSignUpButtonPressed(
    SignUpButtonPressed event,
    Emitter<SignUpFormState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.submitting));

    final result = await signInUpUc.call(
      params: AuthParamsEntity(email: state.email.value, password: state.password.value),
      isSignIn: false,
    );

    result.fold((l) => emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure)),
        (r) => emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success)));
  }
}
