part of 'signup_form_bloc.dart';

@immutable
class SignUpFormState extends Equatable {
  final EmailInput email;
  final PasswordInput password;
  final FormSubmissionStatus formSubmissionStatus;
  final bool showPassword;

  const SignUpFormState({
    this.email = EmailInput.empty,
    this.password = PasswordInput.empty,
    this.formSubmissionStatus = FormSubmissionStatus.initial,
    this.showPassword = false,
  });

  SignUpFormState copyWith(
          {EmailInput? email,
          PasswordInput? password,
          FormSubmissionStatus? formSubmissionStatus,
          bool? showPassword}) =>
      SignUpFormState(
        email: email ?? this.email,
        password: password ?? this.password,
        formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
        showPassword: showPassword ?? this.showPassword,
      );

  @override
  List<Object?> get props => [email, password, formSubmissionStatus, showPassword];

  bool isSubmitting() => formSubmissionStatus == FormSubmissionStatus.submitting;

  bool isSubmissionSuccessOrFailure() =>
      formSubmissionStatus == FormSubmissionStatus.success || formSubmissionStatus == FormSubmissionStatus.failure;

  bool get isValid => !email.hasError && !password.hasError;
}
