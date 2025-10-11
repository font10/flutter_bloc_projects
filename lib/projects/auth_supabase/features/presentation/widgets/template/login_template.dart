import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/login_form.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_projects/di/injection.dart' as inj;

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => inj.sl<LoginFormBloc>(),
      child: BlocConsumer<LoginFormBloc, LoginState>(
        listenWhen: (previous, current) => previous.formSubmissionStatus != current.formSubmissionStatus,
        listener: (context, state) {
          if (state.formSubmissionStatus == FormSubmissionStatus.success) {
            context.goNamed(Routes.homePage);
          } else if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
            context.snackBar(message: 'Login failed. Please check your credentials.');
          }
        },
        buildWhen: (previous, current) =>
            previous.email != current.email ||
            previous.password != current.password ||
            previous.formSubmissionStatus != current.formSubmissionStatus,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LoginForm(state: state),
          );
        },
      ),
    );
  }
}
