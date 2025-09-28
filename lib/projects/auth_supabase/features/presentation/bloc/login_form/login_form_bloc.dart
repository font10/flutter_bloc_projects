import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/email_input.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/password_input.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/usecases/sign_in_up_uc.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginState> {
  final SignInUpUc signInUpUc;

  LoginFormBloc({required this.signInUpUc}) : super(const LoginState()) {
    on<LoginEmailAddressChanged>(_onEmailAddressChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    if (!state.isValid) return;

    emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.submitting));

    final result = await signInUpUc.call(
      params: AuthParamsEntity(email: state.email.value, password: state.password.value),
      isSignIn: true,
    );

    result.fold((l) => emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.failure)),
        (r) => emit(state.copyWith(formSubmissionStatus: FormSubmissionStatus.success)));
  }

  Future<void> _onEmailAddressChanged(
    LoginEmailAddressChanged event,
    Emitter<LoginState> emit,
  ) async =>
      emit(state.copyWith(
        email: EmailInput.create(event.value),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));

  Future<void> _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) async =>
      emit(state.copyWith(
        password: PasswordInput.create(event.value),
        formSubmissionStatus: FormSubmissionStatus.initial,
      ));
}

/*
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/enum/status.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/login_form_validation.dart';
import 'package:meta/meta.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  LoginFormBloc() : super(const LoginFormState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginShowPasswordChanged>(_onShowPasswordChanged);
    on<LoginFormSubmitted>(_onFormSubmitted);
    on<LoginClearFields>(_onClearFields);
  }

  void _onEmailChanged(LoginEmailChanged event, Emitter<LoginFormState> emit) {
    Map<String, String> errors = Map<String, String>.from(state.fieldErrors);

    errors = ValidationInput.validateEmail(email: event.email, errors: errors);

    emit(state.copyWith(
      email: event.email,
      fieldErrors: errors,
    ));
  }

  void _onPasswordChanged(LoginPasswordChanged event, Emitter<LoginFormState> emit) {
    Map<String, String> errors = Map<String, String>.from(state.fieldErrors);

    errors = ValidationInput.validatePassword(password: event.password, errors: errors);

    emit(state.copyWith(
      password: event.password,
      fieldErrors: errors,
    ));
  }

  void _onShowPasswordChanged(LoginShowPasswordChanged event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(
      showPassword: event.showPassword,
    ));
  }

  void _onClearFields(LoginClearFields event, Emitter<LoginFormState> emit) {
    emit(state.copyWith(
      email: '',
      password: '',
    ));
  }

  Future<void> _onFormSubmitted(LoginFormSubmitted event, Emitter<LoginFormState> emit) async {
    if (!state.isFormValid) {
      Map<String, String> errors = <String, String>{};

      errors = _onErrorsHandle(errors);

      emit(state.copyWith(
        fieldErrors: errors,
      ));
      return;
    }

    emit(state.copyWith(status: FormStatus.loading));

    try {
      emit(state.copyWith(
        status: FormStatus.success,
        successMessage: 'Formulario enviado exitosamente',
      ));

      // Reiniciar estado
      emit(state.copyWith(status: FormStatus.initial));
    } catch (e) {
      emit(state.copyWith(
        status: FormStatus.failure,
        successMessage: 'Error al enviar el formulario',
      ));
    }
  }

  Map<String, String> _onErrorsHandle(Map<String, String> errors) {
    if (state.email.isEmpty) {
      errors['email'] = 'Email es requerido';
    }
    if (state.password.isEmpty) {
      errors['password'] = 'Password es requerido';
    }

    return errors;
  }
}
*/
