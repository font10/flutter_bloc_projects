part of 'image_picker_bloc.dart';

@immutable
sealed class ImagePickerEvent {
  const ImagePickerEvent();
}

class PickImageEvent extends ImagePickerEvent {
  final ImageSource imageSource;
  const PickImageEvent(this.imageSource);
}

class ClearImageEvent extends ImagePickerEvent {
  const ClearImageEvent();
}
