import 'package:flutter_bloc_projects/projects/image_picker/features/data/service/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mocktail/mocktail.dart';

//? Mock del servicio image picker
class MockImagePickerService extends Mock implements ImagePickerService {}

//? Mock de la imagen seleccionada
class MockXFile extends Mock implements XFile {}
