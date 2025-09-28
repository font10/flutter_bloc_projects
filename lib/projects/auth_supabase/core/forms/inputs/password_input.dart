import 'package:equatable/equatable.dart';

class PasswordInput extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const PasswordInput({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory PasswordInput.create(String value) {
    if (value.isEmpty || value.length < 6) {
      return PasswordInput(
          value: value, errorMessage: 'Password must be at least 6 characters length.', hasError: true);
    }
    return PasswordInput(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty = PasswordInput(value: '', errorMessage: '', hasError: false);
}
