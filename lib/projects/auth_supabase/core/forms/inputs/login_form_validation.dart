import 'package:flutter_bloc_projects/shared/extensions/validation_extension.dart';

class ValidationInput {
  static Map<String, String> validateEmail({required String email, required Map<String, String> errors}) {
    if (email.isEmpty) {
      errors['email'] = 'El email es requerido';
    } else if (!email.contains('@') || !email.contains('.')) {
      errors['email'] = 'Email no válido';
    } else if (!email.isValidEmail) {
      errors['email'] = 'Email no válido';
    } else {
      errors.remove('email');
    }

    return errors;
  }

  static Map<String, String> validatePassword({required String password, required Map<String, String> errors}) {
    if (password.isEmpty) {
      errors['password'] = 'El password es requerido';
    } else if (password.length < 6) {
      errors['password'] = 'El password debe tener al menos 6 caracteres';
    } else {
      errors.remove('password');
    }

    return errors;
  }
}
