import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';

class MockImagePickerBloc extends MockBloc<ImagePickerEvent, ImagePickerState> implements ImagePickerBloc {}
