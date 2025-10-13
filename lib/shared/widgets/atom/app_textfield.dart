import 'package:flutter/material.dart';
import 'package:flutter_bloc_projects/shared/extensions/color_extension.dart';
import 'package:flutter_bloc_projects/shared/extensions/textstyle_extension.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final String? value;
  final String? errorText;
  final TextInputType? keyboardType;
  final int? maxLines;
  final double? borderRadius;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final Function(String) onChanged;
  final Function()? onSuffixIconPressed;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.onChanged,
    this.value,
    this.errorText,
    this.keyboardType,
    this.maxLines = 1,
    this.borderRadius,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.onSuffixIconPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: value,
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: TextStyleExtension.titleMedium.copyWith(color: Colors.grey.shade400),
      obscureText: obscureText,
      decoration: InputDecoration(
          errorText: errorText,
          errorStyle: TextStyleExtension.bodySmall.copyWith(color: Colors.red.shade800),
          suffixIcon: suffixIcon != null ? IconButton(icon: suffixIcon!, onPressed: onSuffixIconPressed) : null,
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            borderSide: BorderSide(
              color: Colors.grey.shade800,
              width: 1,
            ),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade700,
          ),
          iconColor: ColorExtension.greyDark,
          fillColor: ColorExtension.greyDark,
          filled: true),
    );
  }
}
