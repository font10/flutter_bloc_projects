import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/bloc/bloc_observer.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/data/service/image_picker_service.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/screens/image_picker_screen.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ImagePickerBloc(ImagePickerService()),
      child: MaterialApp(
        title: 'Bloc image picker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(scaffoldBackgroundColor: Colors.grey.shade900, useMaterial3: true),
        home: const ImagePickerScreen(),
      ),
    );
  }
}
