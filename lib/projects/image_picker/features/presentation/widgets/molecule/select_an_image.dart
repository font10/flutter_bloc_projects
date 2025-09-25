import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/extensions/context_extension.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/extensions/text_extension.dart';
import 'package:flutter_bloc_projects/projects/image_picker/core/extensions/widget_extension.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/atom/dashed_border_painter.dart';
import 'package:flutter_bloc_projects/projects/image_picker/features/presentation/widgets/molecule/select_image_source.dart';

class SelectAnImage extends StatelessWidget {
  const SelectAnImage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const ValueKey('select_an_image'),
      onTap: () => context.bottomSheet(child: const SelectSourceImagePicker()),
      child: Container(
        width: context.width,
        height: context.height,
        color: Colors.grey.shade900,
        child: CustomPaint(
          painter: DashedBorderPainter(colorBorder: Colors.grey.shade700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add_photo_alternate_outlined, color: Colors.grey.shade700, size: 28),
              const SizedBox(height: 4),
              Text(
                TextExtension.selectAnImage,
                style: TextStyle(color: Colors.grey.shade700),
              ).paddingAll(8),
            ],
          ),
        ),
      ),
    );
  }
}
