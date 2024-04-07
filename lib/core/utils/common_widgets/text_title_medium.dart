import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:flutter/material.dart';

class TextTitleMedium extends StatelessWidget {
  final String? value;
  final Color? textColor;
  final FontWeight? fontWeight;

  const TextTitleMedium({
    super.key,
    required this.value,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value ?? '',
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: textColor ?? AppColors.defaultLabelColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
