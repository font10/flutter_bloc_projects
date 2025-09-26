import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/molecule/auth_header.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/login_form.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/organism/sign_up_form.dart';
import 'package:flutter_bloc_projects/shared/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/widget_extension.dart';
import 'package:flutter_bloc_projects/shared/widgets/atom/app_text_button.dart';

class AuthTemplate extends StatelessWidget {
  final bool isLoginMode;
  final bool isLoading;
  final Function(String email, String password) handleSignUp;
  final Function(String email, String password) handleLogin;
  final Function() handleForgotPassword;
  final Function() toggleAuthMode;

  const AuthTemplate(
      {required this.isLoginMode,
      required this.isLoading,
      required this.handleSignUp,
      required this.handleLogin,
      required this.handleForgotPassword,
      required this.toggleAuthMode,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthHeader(
                title: isLoginMode ? TextExtension.signIn : TextExtension.signUp,
                subtitle: isLoginMode ? TextExtension.subtitleSignIn : TextExtension.subtitleSignUp,
              ),
              const SizedBox(height: 40),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: isLoginMode
                    ? BlocBuilder<LoginFormBloc, LoginFormState>(
                        builder: (context, state) {
                          return LoginForm(
                            key: const ValueKey('login'),
                            email: state.email,
                            password: state.password,
                            onEmailChanged: (email) => context.read<LoginFormBloc>().add(LoginEmailChanged(email)),
                            onPasswordChanged: (password) =>
                                context.read<LoginFormBloc>().add(LoginPasswordChanged(password)),
                            fieldErrors: state.fieldErrors,
                            onLogin: handleLogin,
                            onForgotPassword: handleForgotPassword,
                            isLoading: isLoading,
                            showPassword: state.showPassword,
                            onShowPassword: (showPassword) =>
                                context.read<LoginFormBloc>().add(LoginShowPasswordChanged(showPassword)),
                          );
                        },
                      )
                    : BlocBuilder<SignUpFormBloc, SignUpFormState>(
                        builder: (context, state) {
                          return SignUpForm(
                            key: const ValueKey('signup'),
                            email: state.email,
                            password: state.password,
                            onEmailChanged: (email) => context.read<SignUpFormBloc>().add(SignUpEmailChanged(email)),
                            onPasswordChanged: (password) =>
                                context.read<SignUpFormBloc>().add(SignUpPasswordChanged(password)),
                            fieldErrors: state.fieldErrors,
                            showPassword: state.showPassword,
                            onShowPassword: (showPassword) =>
                                context.read<SignUpFormBloc>().add(SignUpShowPasswordChanged(showPassword)),
                            onSignUp: handleSignUp,
                            isLoading: isLoading,
                          );
                        },
                      ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isLoginMode ? TextExtension.dontHaveAccount : TextExtension.haveAccount,
                      style: const TextStyle(color: Colors.white)),
                  AppTextButton(
                    text: isLoginMode ? TextExtension.signUp : TextExtension.signIn,
                    onPressed: toggleAuthMode,
                  ),
                ],
              ),
            ],
          ).scrollable(),
        ).paddingAll(24),
      ),
    );
  }
}
