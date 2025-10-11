import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/login_form.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';

class LoginTemplate extends StatelessWidget {
  const LoginTemplate({super.key});

  @override
  Widget build(BuildContext context) => BlocListener<LoginFormBloc, LoginState>(
        bloc: context.read<LoginFormBloc>(),
        listenWhen: (previous, current) => current.isSubmissionSuccessOrFailure(),
        listener: (context, state) {
          if (state.formSubmissionStatus == FormSubmissionStatus.success) {
            print('Successful');
          }
          if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
            context.snackBar(message: 'Login failed. Please check your credentials.', duration: 4);
          }
        },
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: 16.0), child: LoginForm()),
      );
}
