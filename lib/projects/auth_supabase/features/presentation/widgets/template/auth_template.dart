import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth_mode/auth_mode_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/login_form.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/signup_form.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';

class AuthTemplate extends StatelessWidget {
  const AuthTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: BlocBuilder<AuthModeBloc, AuthModeState>(
        builder: (context, authModeState) {
          return authModeState.isLogin
              ? BlocListener<LoginFormBloc, LoginState>(
                  bloc: context.read<LoginFormBloc>(),
                  listenWhen: (previous, current) => current.isSubmissionSuccessOrFailure(),
                  listener: (context, state) {
                    if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
                      context.snackBar(
                        message: 'Login failed. Please check your credentials.',
                        duration: 4,
                      );
                    }
                  },
                  child: const LoginForm(),
                )
              : BlocListener<SignUpFormBloc, SignUpFormState>(
                  bloc: context.read<SignUpFormBloc>(),
                  listenWhen: (previous, current) => current.isSubmissionSuccessOrFailure(),
                  listener: (context, state) {
                    if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
                      context.snackBar(
                        message: 'Sign up failed. Please try again.',
                        duration: 4,
                      );
                    }
                  },
                  child: const SignUpForm(),
                );
        },
      ),
    );
  }
}
