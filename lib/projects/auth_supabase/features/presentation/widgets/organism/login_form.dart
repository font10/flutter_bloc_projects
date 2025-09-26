import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/shared/extensions/color_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_text_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_textfield.dart';

class LoginForm extends StatefulWidget {
  final String email;
  final String password;
  final Function(String email) onEmailChanged;
  final Function(String password) onPasswordChanged;
  final Function(bool showPassword) onShowPassword;
  final Function(String email, String password) onLogin;
  final Map<String, String> fieldErrors;
  final VoidCallback onForgotPassword;
  final bool isLoading;
  final bool showPassword;

  const LoginForm({
    super.key,
    required this.email,
    required this.password,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.fieldErrors,
    required this.onShowPassword,
    required this.onLogin,
    required this.onForgotPassword,
    this.isLoading = false,
    this.showPassword = false,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  void _handleLogin() => context.read<LoginFormBloc>().add(LoginFormSubmitted());

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            hintText: "Correo electrónico",
            value: widget.email,
            prefixIcon: Icon(Icons.email, color: ColorExtension.greyMedium),
            onChanged: widget.onEmailChanged,
            errorText: widget.fieldErrors['email'],
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: 'Contraseña',
            value: widget.password,
            prefixIcon: Icon(Icons.lock, color: ColorExtension.greyMedium),
            onChanged: widget.onPasswordChanged,
            suffixIcon: Icon(Icons.visibility, color: ColorExtension.greyMedium),
            onSuffixIconPressed: () => widget.onShowPassword(!widget.showPassword),
            obscureText: !widget.showPassword,
            errorText: widget.fieldErrors['password'],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: AppTextButton(
              text: '¿Olvidaste tu contraseña?',
              onPressed: widget.onForgotPassword,
            ),
          ),
          const SizedBox(height: 24),
          AppButton(
            text: 'Iniciar Sesión',
            onPressed: _handleLogin,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
