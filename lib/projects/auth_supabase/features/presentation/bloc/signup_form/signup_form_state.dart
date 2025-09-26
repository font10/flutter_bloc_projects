part of 'signup_form_bloc.dart';

@immutable
class SignUpFormState extends Equatable {
  final FormStatus status;
  final String email;
  final String password;
  final bool isLoginMode;
  final Map<String, String> fieldErrors;
  final String? successMessage;
  final bool showPassword;

  const SignUpFormState({
    this.status = FormStatus.initial,
    this.email = '',
    this.password = '',
    this.isLoginMode = true,
    this.fieldErrors = const {},
    this.successMessage,
    this.showPassword = false,
  });

  SignUpFormState copyWith({
    FormStatus? status,
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    bool? isLoginMode,
    Map<String, String>? fieldErrors,
    String? successMessage,
    bool? showPassword,
  }) {
    return SignUpFormState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoginMode: isLoginMode ?? this.isLoginMode,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      successMessage: successMessage ?? this.successMessage,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  bool get isFormValid {
    return email.isNotEmpty && password.isNotEmpty && fieldErrors.isEmpty;
  }

  @override
  List<Object?> get props => [
        status,
        email,
        password,
        isLoginMode,
        fieldErrors,
        successMessage,
        showPassword,
      ];
}
