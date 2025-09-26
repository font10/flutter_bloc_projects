import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;

  Future<void> snackBar(
          {required String message, Color? color, int? duration}) async =>
      ScaffoldMessenger.of(this).showSnackBar(SnackBar(
          content: Text(message),
          duration: Duration(seconds: duration ?? 2),
          backgroundColor: color ?? Colors.red));

  Future<T?> bottomSheet<T>({required Widget child}) async =>
      showModalBottomSheet<T>(
        context: this,
        builder: (BuildContext context) => Container(
          width: width,
          color: Colors.blueGrey.shade900,
          child: child,
        ),
      );
}
