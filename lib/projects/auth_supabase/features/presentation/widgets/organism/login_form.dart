import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/molecule/auth_header.dart';
import 'package:flutter_bloc_projects/shared/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_textfield.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginFormBloc, LoginState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthHeader(title: TextExtension.signIn, subtitle: TextExtension.signInSubtitle),
            const SizedBox(height: 24),
            CustomTextField(
                hintText: 'Email address',
                errorText: state.email.hasError ? state.email.errorMessage : null,
                prefixIcon: const Icon(Icons.email),
                onChanged: (email) => context.read<LoginFormBloc>().add(LoginEmailAddressChanged(email))),
            const SizedBox(height: 8.0),
            CustomTextField(
                hintText: 'Password',
                errorText: state.password.hasError ? state.password.errorMessage : null,
                prefixIcon: const Icon(Icons.lock),
                onChanged: (password) => context.read<LoginFormBloc>().add(LoginPasswordChanged(password))),
            const SizedBox(height: 8.0),
            AppButton(
              onPressed: () => !state.isValid ? null : context.read<LoginFormBloc>().add(const LoginButtonPressed()),
              text: 'Login',
              isLoading: state.isSubmitting() ? true : false,
            ),
          ],
        );
      },
    );
  }
}
