import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/app/config/routes/app_router.dart';
import 'package:flutter_bloc_projects/core/bloc/bloc_providers.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/bloc/bloc_observer.dart';
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
      providers: BlocProviders.blocs(),
      child: MaterialApp.router(
        title: 'Bloc image picker',
        color: Colors.grey.shade900,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade900, primaryColor: Colors.grey.shade900, useMaterial3: true),
        routerConfig: router,
      ),
    );
  }
}
