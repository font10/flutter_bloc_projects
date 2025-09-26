import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/app/projects_screen/projects_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/screens/auth_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/screens/authenticated_screen.dart';
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
          builder: (context, state) => const AuthScreen(),
          routes: [
            GoRoute(
              path: Routes.authenticatedRoute,
              name: Routes.authenticatedRoute,
              builder: (context, state) {
                final uuid = state.extra as String;
                return AuthenticatedScreen(uuid: uuid);
              },
            ),
          ],
        ),
      ]),
]);
