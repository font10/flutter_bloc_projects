import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/app/projects_screen/projects_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/screens/auth_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/screens/image_picker_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(navigatorKey: navigatorKey, initialLocation: Routes.projectsRoute, routes: [
  GoRoute(
      path: Routes.projectsRoute,
      name: Routes.projectsRoute,
      builder: (context, state) => const ProjectsScreen(),
      routes: [
        GoRoute(
          path: Routes.imagePickerRoute,
          name: Routes.imagePickerRoute,
          builder: (context, state) => const ImagePickerScreen(),
        ),
        GoRoute(
          path: Routes.authSupabaseRoute,
          name: Routes.authSupabaseRoute,
          builder: (context, state) => BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthUserAuthenticated) {
                return const HomeScreen();
              } else {
                return const AuthScreen();
              }
            },
          ),
        ),
        GoRoute(
          path: Routes.homePage,
          name: Routes.homePage,
          builder: (context, state) => const HomeScreen(),
        ),
      ]),
]);
