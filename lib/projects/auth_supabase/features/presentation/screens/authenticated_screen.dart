import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/widget_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_button.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/custom_app_bar.dart';
import 'package:go_router/go_router.dart';

class AuthenticatedScreen extends StatelessWidget {
  final String uuid;
  const AuthenticatedScreen({required this.uuid, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: CustomAppBar(title: TextExtension.authenticated),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is LogoutSuccess) {
              context.goNamed(Routes.authSupabaseRoute);
            }
            if (state is LogoutFailed) {
              context.snackBar(message: state.message);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('${TextExtension.authenticated}: $uuid',
                  textAlign: TextAlign.center, style: TextStyleExtension.bodyLarge.copyWith(color: Colors.white)),
              const SizedBox(height: 16),
              AppButton(onPressed: () => context.read<AuthBloc>().add(LogoutEvent()), text: 'Logout'),
            ],
          ).paddingSymmetric(horizontal: 16),
        ));
  }
}
