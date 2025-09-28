import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home')),
        body: BlocListener<AuthBloc, AuthState>(
          bloc: context.read<AuthBloc>(),
          listener: (context, state) {
            if (state is AuthUserUnauthenticated) {
              context.goNamed(Routes.authSupabaseRoute);
            }
          },
          child: Center(child: const _LogoutButton()),
        ));
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton();

  @override
  Widget build(BuildContext context) => ElevatedButton(
        onPressed: () => context.read<AuthBloc>().add(AuthLogoutButtonPressed()),
        child: const Text('Logout', style: TextStyle(color: Colors.red)),
      );
}
