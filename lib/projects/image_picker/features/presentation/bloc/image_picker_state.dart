part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  final XFile? file;
  final String? error;

  const ImagePickerState({
    this.file,
    this.error,
  });

  ImagePickerState copyWith({
    XFile? file,
    String? error,
  }) =>
      ImagePickerState(
        file: file ?? this.file,
        error: error,
      );

  ImagePickerState clearError() => ImagePickerState(
        file: file,
        error: null,
      );

  @override
  List<Object?> get props => [file, error];
}
