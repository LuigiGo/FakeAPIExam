import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:flutter/material.dart';

class TextBodyMedium extends StatelessWidget {
  final String? value;
  final Color? textColor;
  final FontWeight? fontWeight;

  const TextBodyMedium({
    super.key,
    required this.value,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value ?? '',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: textColor ?? AppColors.textColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
