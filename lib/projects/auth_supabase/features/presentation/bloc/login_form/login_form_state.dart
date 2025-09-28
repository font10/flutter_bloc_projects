part of 'login_form_bloc.dart';

enum FormSubmissionStatus {
  initial,
  submitting,
  success,
  failure,
}

class LoginState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormSubmissionStatus formSubmissionStatus;

  const LoginState({
    this.email = EmailInput.empty,
    this.password = PasswordInput.empty,
    this.formSubmissionStatus = FormSubmissionStatus.initial,
  });

  LoginState copyWith({
    EmailInput? email,
    PasswordInput? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) =>
      LoginState(
        email: email ?? this.email,
        password: password ?? this.password,
        formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      );

  @override
  List<Object?> get props => [
        email,
        password,
        formSubmissionStatus,
      ];

  bool isSubmitting() => formSubmissionStatus == FormSubmissionStatus.submitting;

  bool isSubmissionSuccessOrFailure() =>
      formSubmissionStatus == FormSubmissionStatus.success || formSubmissionStatus == FormSubmissionStatus.failure;

  bool get isValid => !email.hasError && !password.hasError;
}
