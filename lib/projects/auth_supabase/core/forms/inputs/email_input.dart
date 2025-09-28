import 'package:equatable/equatable.dart';

class EmailInput extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const EmailInput({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory EmailInput.create(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@"
                r"[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?"
                r"(?:\.[a-zA-Z]{2,})+$")
            .hasMatch(value)) {
      return EmailInput(value: value, errorMessage: 'Please insert valid email address', hasError: true);
    }
    return EmailInput(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty = EmailInput(value: '', errorMessage: '', hasError: false);
}
