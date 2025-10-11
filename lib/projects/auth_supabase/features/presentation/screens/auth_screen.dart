import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/template/login_template.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: const CustomAppBar(title: 'Auth Screen'),
        body: BlocListener<AuthBloc, AuthState>(
            bloc: context.read<AuthBloc>(),
            listener: (context, state) {
              if (state is AuthUserAuthenticated) {
                context.goNamed(Routes.homePage);
              }
            },
            child: const LoginTemplate()));
  }
}
