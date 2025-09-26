extension StringExtension on String {
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get quitCompositeKey {
    return replaceAll("[", "").replaceAll("]", "");
  }

  bool get isBase64 {
    return RegExp(r'^/9j/[a-zA-Z0-9+/=]+$').hasMatch(this);
  }
}
