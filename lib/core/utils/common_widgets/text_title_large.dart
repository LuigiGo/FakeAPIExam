import 'package:flutter/material.dart';

import '../../resource/color_palette.dart';

class TextTitleLarge extends StatelessWidget {
  final String? value;
  final Color? textColor;
  final FontWeight? fontWeight;

  const TextTitleLarge({
    super.key,
    required this.value,
    this.textColor,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      value ?? '',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: textColor ?? AppColors.defaultLabelColor,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}
