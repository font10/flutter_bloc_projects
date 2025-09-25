import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:image_picker/image_picker.dart';

import 'mock/mock_image_picker_service.dart';

void main() {
  group('ImagePickerBloc', () {
    //? Bloc instance
    late ImagePickerBloc bloc;
    late MockImagePickerService mockImagePickerService;
    late MockXFile mockXFile;

    //? Setup the bloc with the mocks
    setUp(() {
      mockImagePickerService = MockImagePickerService();
      mockXFile = MockXFile();
      bloc = ImagePickerBloc(mockImagePickerService);
    });

    //? Close the bloc
    tearDown(() {
      bloc.close();
    });

    group('PickImageEvent', () {
      blocTest<ImagePickerBloc, ImagePickerState>(
        'emits state with selected image when user picks image from gallery',
        //? Build the bloc with the mocks
        build: () {
          //? When the pickImage method is called, return the mock XFile
          when(() => mockImagePickerService.pickImage(
                source: ImageSource.gallery,
              )).thenAnswer((_) async => mockXFile);

          //? When the XFile path is called, return the mock path
          when(() => mockXFile.path).thenReturn('/mock/path/image.jpg');

          return bloc;
        },
        //? Simulate user picking an image from the gallery
        act: (bloc) => bloc.add(
          const PickImageEvent(ImageSource.gallery),
        ),
        //? Expect the bloc to emit the selected image
        expect: () => [
          //? isA is a comparator that checks if the emitted state is of type ImagePickerState
          //? having is a matcher that checks if the emitted state has the expected value
          isA<ImagePickerState>().having(
            (state) => state.file,
            'file',
            equals(mockXFile),
          ),
        ],
        //? Verify that the pickImage method was called once
        verify: (_) {
          verify(() => mockImagePickerService.pickImage(
                source: ImageSource.gallery,
              )).called(1);
        },
      );

      blocTest<ImagePickerBloc, ImagePickerState>(
        'emits state with selected image when user picks image from camera',
        build: () {
          when(() => mockImagePickerService.pickImage(
                source: ImageSource.camera,
              )).thenAnswer((_) async => mockXFile);

          return bloc;
        },
        act: (bloc) => bloc.add(
          const PickImageEvent(ImageSource.camera),
        ),
        expect: () => [
          isA<ImagePickerState>().having(
            (state) => state.file,
            'file',
            equals(mockXFile),
          ),
        ],
        verify: (_) {
          verify(() => mockImagePickerService.pickImage(
                source: ImageSource.camera,
              )).called(1);
        },
      );

      blocTest<ImagePickerBloc, ImagePickerState>(
        'emits state with null file when user cancels image selection',
        build: () {
          when(() => mockImagePickerService.pickImage(
                source: ImageSource.gallery,
              )).thenAnswer((_) async => null);

          return bloc;
        },
        act: (bloc) => bloc.add(
          const PickImageEvent(ImageSource.gallery),
        ),
        expect: () => [
          isA<ImagePickerState>().having(
            (state) => state.file,
            'file',
            isNull,
          ),
        ],
      );

      blocTest<ImagePickerBloc, ImagePickerState>(
        'emits state with error when image picker service fails',
        build: () {
          when(() => mockImagePickerService.pickImage(
                source: ImageSource.gallery,
              )).thenThrow(Exception('Permission denied'));

          return bloc;
        },
        act: (bloc) => bloc.add(
          const PickImageEvent(ImageSource.gallery),
        ),
        expect: () => [
          isA<ImagePickerState>().having(
            (state) => state.error,
            'error',
            contains('Permission denied'),
          ),
        ],
      );
    });

    group('ClearImageEvent', () {
      blocTest<ImagePickerBloc, ImagePickerState>(
        'emits state with null file when clear image is called',
        build: () => bloc,
        seed: () => ImagePickerState(file: mockXFile),
        act: (bloc) => bloc.add(const ClearImageEvent()),
        expect: () => [
          const ImagePickerState(),
        ],
      );
    });
  });
}
