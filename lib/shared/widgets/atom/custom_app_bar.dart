import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: TextStyleExtension.titleMedium.copyWith(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.grey.shade900,
      iconTheme: const IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
