import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/enum/status.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/forms/inputs/login_form_validation.dart';
import 'package:meta/meta.dart';

part 'signup_form_event.dart';
part 'signup_form_state.dart';

class SignUpFormBloc extends Bloc<SignUpFormEvent, SignUpFormState> {
  SignUpFormBloc() : super(const SignUpFormState()) {
    on<SignUpEmailChanged>(_onEmailChanged);
    on<SignUpPasswordChanged>(_onPasswordChanged);
    on<SignUpShowPasswordChanged>(_onShowPasswordChanged);
    on<SignUpFormSubmitted>(_onFormSubmitted);
    on<SignUpClearFields>(_onClearFields);
  }

  void _onEmailChanged(SignUpEmailChanged event, Emitter<SignUpFormState> emit) {
    Map<String, String> errors = Map<String, String>.from(state.fieldErrors);

    errors = ValidationInput.validateEmail(email: event.email, errors: errors);

    emit(state.copyWith(
      email: event.email,
      fieldErrors: errors,
    ));
  }

  void _onPasswordChanged(SignUpPasswordChanged event, Emitter<SignUpFormState> emit) {
    Map<String, String> errors = Map<String, String>.from(state.fieldErrors);

    errors = ValidationInput.validatePassword(password: event.password, errors: errors);

    emit(state.copyWith(
      password: event.password,
      fieldErrors: errors,
    ));
  }

  void _onShowPasswordChanged(SignUpShowPasswordChanged event, Emitter<SignUpFormState> emit) {
    emit(state.copyWith(
      showPassword: event.showPassword,
    ));
  }

  void _onClearFields(SignUpClearFields event, Emitter<SignUpFormState> emit) {
    emit(state.copyWith(
      email: '',
      password: '',
    ));
  }

  Future<void> _onFormSubmitted(SignUpFormSubmitted event, Emitter<SignUpFormState> emit) async {
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
