import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/shared/extensions/color_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_textfield.dart';

class SignUpForm extends StatefulWidget {
  final String email;
  final String password;
  final Function(String email, String password) onSignUp;
  final Function(String email) onEmailChanged;
  final Function(String password) onPasswordChanged;
  final Function(bool showPassword) onShowPassword;
  final Map<String, String> fieldErrors;
  final bool isLoading;
  final bool showPassword;

  const SignUpForm({
    Key? key,
    required this.email,
    required this.password,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onShowPassword,
    required this.onSignUp,
    required this.fieldErrors,
    required this.showPassword,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final formKey = GlobalKey<FormState>();

  void handleSignUp() {
    // Falta pasar params
    context.read<SignUpFormBloc>().add(SignUpFormSubmitted());
  }

  /* final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }*/

  /* String? _validateName(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu nombre';
    if (value.length < 2) return 'Mínimo 2 caracteres';
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu correo';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) return 'Correo inválido';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Ingresa tu contraseña';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) return 'Confirma tu contraseña';
    if (value != _passwordController.text) return 'Las contraseñas no coinciden';
    return null;
  }
*/

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
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
          const SizedBox(height: 24),
          AppButton(
            text: 'Crear cuenta',
            onPressed: handleSignUp,
            isLoading: widget.isLoading,
          ),
        ],
      ),
    );
  }
}
