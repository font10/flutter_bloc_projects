extension ValidationExtension on String {
  bool get isValidEmail => RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$').hasMatch(this);

  bool get isValidYear {
    return RegExp(r'\b(19|20)\d{2}\b').hasMatch(this);
  }

  static String? Function(String?)? get validateUser => (value) {
        if (value == null || value.trim().isEmpty) {
          return 'Este campo es obligatorio';
        }

        final input = value.trim().toUpperCase();

        final RegExp idRegExp = RegExp(
          r'^('
          r'\d{8}[A-HJ-NP-TV-Z]|' // NIF
          r'[XYZ]\d{7}[A-HJ-NP-TV-Z]|' // NIE
          r'[A-Z0-9]{6,9}|' // Pasaporte
          r'\d{8}[A-Z]' // CIAL
          r')$',
          caseSensitive: false,
        );

        if (!idRegExp.hasMatch(input)) {
          return 'Documento no válido (NIF, NIE, Pasaporte o CIAL)';
        }

        return null;
      };

  static String? Function(String?)? get validatePassword => (value) {
        if (value == null || value.isEmpty) {
          return 'Ingresa tu contraseña';
        }
        if (value.length < 4) {
          return 'La contraseña debe tener al menos 4 carácteres';
        }
        if (value.length > 50) {
          return 'La contraseña debe tener como máximo 50 carácteres';
        }
        return null;
      };

  static String? Function(String?)? get validateTitleBook => (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a title';
        }
        return null;
      };

  static String? Function(String?)? get validateAuthorBook => (value) {
        if (value == null || value.isEmpty) {
          return 'Enter an author';
        }
        return null;
      };

  static String? Function(String?)? get validateDescriptionBook => (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a description';
        }
        return null;
      };

  static String? Function(String?)? get validatePagesBook => (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a number of pages';
        }
        return null;
      };

  static String? Function(String?)? get validatePublishYearBook => (value) {
        if (value == null || value.isEmpty) {
          return 'Enter a publish year';
        }
        return null;
      };
}
