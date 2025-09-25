import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SelectSourceImagePicker extends StatelessWidget {
  const SelectSourceImagePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.photo, color: Colors.white, size: 32),
            title: Text(TextExtension.gallery, style: const TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              context.read<ImagePickerBloc>().add(const PickImageEvent(ImageSource.gallery));
            },
          ),
          ListTile(
            leading: const Icon(Icons.camera, color: Colors.white, size: 32),
            title: Text(TextExtension.camera, style: const TextStyle(color: Colors.white)),
            onTap: () {
              Navigator.pop(context);
              context.read<ImagePickerBloc>().add(const PickImageEvent(ImageSource.camera));
            },
          ),
        ],
      ),
    );
  }
}
