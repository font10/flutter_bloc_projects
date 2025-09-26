import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/app_router.dart';
import 'package:flutter_bloc_projects/app/projects_screen/projects_screen.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/auth/auth_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/login_form/login_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/auth_supabase/features/presentation/bloc/signup_form/signup_form_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/bloc/bloc_observer.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/data/service/image_picker_service.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_projects/di/injection.dart' as inj;

void main() async {
  Bloc.observer = AppBlocObserver();
  await inj.configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(ImagePickerService()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => inj.sl<AuthBloc>(),
        ),
        BlocProvider<LoginFormBloc>(
          create: (context) => inj.sl<LoginFormBloc>(),
        ),
        BlocProvider<SignUpFormBloc>(
          create: (context) => inj.sl<SignUpFormBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Bloc image picker',
        color: Colors.grey.shade900,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade900, useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
