import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/template/forgot_password_template.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        bloc: context.read<AuthBloc>(),
        listener: (context, state) {
          /*if (state is ResetPasswordSuccess) {
            //context.snackBar(message: state.message);
            Navigator.pop(context);
          }
          if (state is ResetPasswordFailed) {
            context.snackBar(message: state.message);
          }*/
        },
        child: const ForgotPasswordTemplate());
  }
}
