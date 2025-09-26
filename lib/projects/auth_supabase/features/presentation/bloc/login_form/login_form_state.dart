part of 'login_form_bloc.dart';

@immutable
class LoginFormState extends Equatable {
  final FormStatus status;
  final String email;
  final String password;
  final String? confirmPassword;
  final String? name;
  final bool isLoginMode;
  final Map<String, String> fieldErrors;
  final String? successMessage;
  final bool showPassword;

  const LoginFormState({
    this.status = FormStatus.initial,
    this.email = '',
    this.password = '',
    this.confirmPassword,
    this.name,
    this.isLoginMode = true,
    this.fieldErrors = const {},
    this.successMessage,
    this.showPassword = false,
  });

  LoginFormState copyWith({
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
    return LoginFormState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      isLoginMode: isLoginMode ?? this.isLoginMode,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      successMessage: successMessage ?? this.successMessage,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  bool get isFormValid {
    return email.isNotEmpty &&
        password.isNotEmpty &&
        /*confirmPassword != null &&
        confirmPassword!.isNotEmpty &&
        name != null &&
        name!.isNotEmpty &&*/
        fieldErrors.isEmpty;
  }

  @override
  List<Object?> get props => [
        status,
        name,
        email,
        password,
        confirmPassword,
        isLoginMode,
        fieldErrors,
        successMessage,
        showPassword,
      ];
}
