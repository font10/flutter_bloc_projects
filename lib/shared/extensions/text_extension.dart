import 'package:flutter/material.dart';

extension TextExtension on BuildContext {
  static String get imagePickerTitle => 'Bloc Image Picker';
  static String get selectAnImage => 'Select an image';
  static String get gallery => 'Gallery';
  static String get camera => 'Camera';
  static String get authenticated => 'Authenticated';
  static String get signIn => 'Sign In';
  static String get signUp => 'Sign Up';
  static String get subtitleSignIn => "Enter your credentials to sign in";
  static String get subtitleSignUp => "Fill in the details to sign up";
  static String get dontHaveAccount => 'Don\'t have an account?';
  static String get haveAccount => 'Have an account?';
  static String get forgotPassword => 'Forgot Password';
  static String get logout => 'Logout';
  static String get errorSendingForm => 'Error sending form';
  static String get signInSubtitle => 'Enter your credentials to sign in';
}
