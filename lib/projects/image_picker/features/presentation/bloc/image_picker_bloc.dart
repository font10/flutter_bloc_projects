import 'package:flutter_bloc_projects/projects/image_picker/features/data/service/image_picker_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerService _imagePickerService;

  ImagePickerBloc(this._imagePickerService) : super(const ImagePickerState()) {
    on<PickImageEvent>(_onCameraCapture);
    on<ClearImageEvent>(_onClearImage);
  }

  Future<void> _onCameraCapture(PickImageEvent event, Emitter<ImagePickerState> emit) async {
    try {
      final XFile? image = await _imagePickerService.pickImage(source: event.imageSource);
      emit(state.copyWith(file: image, error: null)); // Limpia error solo cuando es exitoso
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onClearImage(ClearImageEvent event, Emitter<ImagePickerState> emit) async {
    emit(const ImagePickerState());
  }
}
