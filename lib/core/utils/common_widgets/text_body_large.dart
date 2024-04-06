import 'package:flutter/material.dart';

import '../../resource/color_palette.dart';

class TextBodyLarge extends StatelessWidget {
  final String? value;
  final Color? textColor;
  final FontWeight? fontWeight;

  const TextBodyLarge({
    super.key,
    required this.value,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value ?? '',
      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: textColor ?? AppColors.textColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
