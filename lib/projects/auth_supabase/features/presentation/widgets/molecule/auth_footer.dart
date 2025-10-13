import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/shared/extensions/color_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';

class AuthFooter extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function() onTap;
  const AuthFooter({required this.title, required this.subtitle, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyleExtension.titleMedium.copyWith(color: Colors.grey.shade500),
        ),
        const SizedBox(width: 8),
        GestureDetector(
          onTap: onTap,
          child: Text(
            subtitle,
            style:
                TextStyleExtension.titleMedium.copyWith(fontWeight: FontWeight.w600, color: ColorExtension.greyLight),
          ),
        ),
      ],
    );
  }
}
