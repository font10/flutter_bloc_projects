import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/molecule/auth_footer.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/molecule/auth_header.dart';
import 'package:flutter_bloc_projects/shared/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_textfield.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpFormBloc, SignUpFormState>(
      builder: (context, state) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthHeader(title: TextExtension.signUp, subtitle: TextExtension.subtitleSignUp),
            const SizedBox(height: 24),
            AppTextField(
                hintText: TextExtension.emailAddres,
                errorText: state.email.hasError ? state.email.errorMessage : null,
                prefixIcon: const Icon(Icons.email),
                onChanged: (email) => context.read<SignUpFormBloc>().add(SignUpEmailAddressChanged(email))),
            const SizedBox(height: 8.0),
            AppTextField(
                hintText: TextExtension.password,
                errorText: state.password.hasError ? state.password.errorMessage : null,
                prefixIcon: const Icon(Icons.lock),
                onChanged: (password) => context.read<SignUpFormBloc>().add(SignUpPasswordChanged(password))),
            const SizedBox(height: 24),
            AuthFooter(
                title: TextExtension.haveAccount,
                subtitle: TextExtension.signIn,
                onTap: () => context.read<AuthModeBloc>().add(ToggleAuthMode(AuthMode.signUp))),
            const SizedBox(height: 24),
            AppButton(
              onPressed: () => state.isValid ? context.read<SignUpFormBloc>().add(SignUpButtonPressed()) : null,
              text: TextExtension.signUp,
              isLoading: state.isSubmitting() ? true : false,
            ),
          ],
        );
      },
    );
  }
}
