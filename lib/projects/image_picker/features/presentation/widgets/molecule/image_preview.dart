import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';

class ImagePreview extends StatelessWidget {
  final String filePath;
  const ImagePreview({required this.filePath, super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 100, minHeight: 100),
      child: Stack(
        children: [
          Image.file(key: const ValueKey('image'), File(filePath)),
          Positioned(
            top: 8,
            right: 8,
            child: CircleAvatar(
              backgroundColor: Colors.red.shade100,
              child: IconButton(
                key: const ValueKey('delete_image'),
                icon: Icon(Icons.delete, color: Colors.red.shade300),
                onPressed: () => context.read<ImagePickerBloc>().add(const ClearImageEvent()),
              ),
            ),
          )
        ],
      ),
    );
  }
}
