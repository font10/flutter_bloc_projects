import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/login_form.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_app_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_projects/di/injection.dart' as inj;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: 'Auth Screen'),
        body: BlocConsumer<AuthBloc, AuthState>(
          bloc: context.read<AuthBloc>(),
          listener: (context, state) {
            if (state is AuthUserUnauthenticated) {
              context.goNamed(Routes.authSupabaseRoute);
            }
            if (state is AuthUserAuthenticated) {
              context.goNamed(Routes.homePage);
            }
          },
          builder: (context, state) {
            return BlocProvider(create: (context) => inj.sl<LoginFormBloc>(), child: const _LoginForm());
          },
        ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) => BlocListener<LoginFormBloc, LoginState>(
        bloc: context.read<LoginFormBloc>(),
        listenWhen: (previous, current) => current.isSubmissionSuccessOrFailure(),
        listener: (context, state) {
          if (state.formSubmissionStatus == FormSubmissionStatus.success) {
            context.goNamed(Routes.homePage);
          }
          if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
            context.snackBar(message: 'Login failed. Please check your credentials.');
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<LoginFormBloc, LoginState>(
            builder: (context, state) {
              return LoginForm(state: state);
            },
          ),
        ),
      );
}
