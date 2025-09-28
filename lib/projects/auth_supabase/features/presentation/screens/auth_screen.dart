import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc_projects/di/injection.dart' as inj;

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Auth Screen')),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthUserUnauthenticated) {
              context.goNamed(Routes.authSupabaseRoute);
            }
            if (state is AuthUserAuthenticated) {
              context.goNamed(Routes.homePage);
            }
          },
          builder: (context, state) {
            return _LoginForm();
          },
        ));
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) => BlocListener<LoginFormBloc, LoginState>(
        listenWhen: (previous, current) => current.isSubmissionSuccessOrFailure(),
        listener: (context, state) {
          if (state.formSubmissionStatus == FormSubmissionStatus.success) {
            context.goNamed(Routes.homePage);
          }
          if (state.formSubmissionStatus == FormSubmissionStatus.failure) {
            context.snackBar(message: 'Login failed. Please check your credentials.');
          }
        },
        child: const Column(
          children: [
            _EmailInputField(),
            SizedBox(height: 8.0),
            _PasswordInputField(),
            SizedBox(height: 8.0),
            _LoginButton()
          ],
        ),
      );
}

class _EmailInputField extends StatelessWidget {
  const _EmailInputField();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginFormBloc, LoginState>(
      buildWhen: (previous, current) => current.email != previous.email,
      builder: (context, state) => TextField(
            onChanged: (email) => context.read<LoginFormBloc>().add(LoginEmailAddressChanged(email)),
            keyboardType: TextInputType.emailAddress,
            style: TextStyleExtension.titleMedium.copyWith(color: Colors.grey.shade400),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: 'Email address',
              errorText: state.email.hasError ? state.email.errorMessage : null,
              labelStyle: const TextStyle(color: Colors.white),
              hintStyle: const TextStyle(color: Colors.white),
            ),
          ));
}

class _PasswordInputField extends StatelessWidget {
  const _PasswordInputField();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginFormBloc, LoginState>(
        buildWhen: (previous, current) => current.password != previous.password,
        builder: (context, state) => TextFormField(
          onChanged: (password) => context.read<LoginFormBloc>().add(LoginPasswordChanged(password)),
          obscureText: true,
          style: TextStyleExtension.titleMedium.copyWith(color: Colors.grey.shade400),
          cursorColor: Colors.white,
          decoration: InputDecoration(
            labelText: 'Password',
            errorText: state.password.hasError ? state.password.errorMessage : null,
            labelStyle: const TextStyle(color: Colors.white),
            hintStyle: const TextStyle(color: Colors.white),
          ),
        ),
      );
}

class _LoginButton extends StatelessWidget {
  const _LoginButton();

  @override
  Widget build(BuildContext context) => BlocBuilder<LoginFormBloc, LoginState>(
        builder: (context, state) => ElevatedButton(
          onPressed: () =>
              state.isSubmitting() || !state.isValid ? null : context.read<LoginFormBloc>().add(LoginButtonPressed()),
          child: Text(state.isSubmitting() ? 'Submitting' : 'Login'),
        ),
      );
}

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/routes.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/core/enum/status.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/domain/entities/params/auth_params_entity.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/screens/forgot_password_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/widgets/template/auth_template.dart';
import 'package:flutter_bloc_projects/shared/extensions/context_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/text_extension.dart';
import 'package:go_router/go_router.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoginMode = true;
  bool _isLoading = false;

  void _toggleAuthMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
    });
  }

  void _changeLoading(bool value) {
    setState(() {
      _isLoading = value;
    });
  }

  void _handleLogin(String email, String password) {
    _changeLoading(true);
    context
        .read<AuthBloc>()
        .add(AuthSignEvent(params: AuthParamsEntity(email: email, password: password), isSignIn: _isLoginMode));
  }

  void _handleSignUp(String email, String password) {
    _changeLoading(true);
    context
        .read<AuthBloc>()
        .add(AuthSignEvent(params: AuthParamsEntity(email: email, password: password), isSignIn: false));
  }

  void _handleForgotPassword() =>
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()));

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginFormBloc, LoginFormState>(
          listener: (context, state) {
            if (state.status == FormStatus.success) {
              _changeLoading(false);
              _handleLogin(state.email, state.password);
            }
            if (state.status == FormStatus.failure) {
              context.snackBar(message: state.successMessage ?? TextExtension.errorSendingForm);
              _changeLoading(false);
            }
          },
        ),
        BlocListener<SignUpFormBloc, SignUpFormState>(
          listener: (context, state) {
            if (state.status == FormStatus.success) {
              _changeLoading(false);
              _handleSignUp(state.email, state.password);
            }
            if (state.status == FormStatus.failure) {
              context.snackBar(message: state.successMessage ?? TextExtension.errorSendingForm);
              _changeLoading(false);
            }
          },
        ),
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              _changeLoading(false);
              context.read<LoginFormBloc>().add(LoginClearFields());
              context.read<SignUpFormBloc>().add(SignUpClearFields());
              context.goNamed(Routes.authenticatedRoute, extra: state.uuid);
            }
            if (state is AuthFailed) {
              context.snackBar(message: state.message);
              _changeLoading(false);
            }
          },
        ),
      ],
      child: AuthTemplate(
          isLoginMode: _isLoginMode,
          isLoading: _isLoading,
          handleSignUp: _handleSignUp,
          handleLogin: _handleLogin,
          handleForgotPassword: _handleForgotPassword,
          toggleAuthMode: _toggleAuthMode),
    );
  }
}
*/
