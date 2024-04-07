import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../resource/color_palette.dart';

class ReusableDottedContainer extends StatelessWidget {
  final Widget? cardContent;

  const ReusableDottedContainer({
    super.key,
    this.cardContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.dottedContainerColor,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: const Radius.circular(20),
        color: AppColors.dottedBorderColor,
        strokeWidth: 3,
        dashPattern: const [5],
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          child: cardContent,
        ),
      ),
    );
  }
}
