import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/widget_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_text_field.dart';

class ForgotPasswordTemplate extends StatefulWidget {
  const ForgotPasswordTemplate({super.key});

  @override
  State<ForgotPasswordTemplate> createState() => _ForgotPasswordTemplateState();
}

class _ForgotPasswordTemplateState extends State<ForgotPasswordTemplate> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey.shade900,
        title: Text("Forgot Password",
            style: TextStyleExtension.bodyLarge.copyWith(color: Colors.white, fontWeight: FontWeight.w500)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Por favor ingresa tu correo electrónica para restablecer tu contraseña",
              style:
                  TextStyleExtension.bodyLarge.copyWith(color: Colors.blueGrey.shade100, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          AppTextField(
            controller: emailController,
            hintText: "Correo electrónico",
            isDark: true,
            validator: (value) => value!.isEmpty ? "Por favor, ingresa tu correo" : null,
            prefixIcon: const Icon(Icons.email_outlined),
          ),
          const SizedBox(height: 16),
          AppButton(
              onPressed: () => context.read<AuthBloc>().add(ForgotPasswordEvent(emailController.text)), text: "Enviar"),
        ],
      ).paddingAll(16),
    );
  }
}
