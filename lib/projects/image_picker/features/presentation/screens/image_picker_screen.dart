import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/image_preview.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/select_an_image.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/bloc/image_picker_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(TextExtension.name, style: const TextStyle(color: Colors.white, fontSize: 16)),
          backgroundColor: Colors.grey.shade900,
          centerTitle: true,
        ),
        body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          builder: (context, state) {
            return Column(
              children: [
                if (state.error != null)
                  Container(
                    color: Colors.red.shade100,
                    child: Text(
                      'Error: ${state.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                Expanded(
                  child: Center(
                    child: state.file == null
                        ? const SelectAnImage(key: ValueKey('noimage'))
                        : ImagePreview(filePath: state.file!.path),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
