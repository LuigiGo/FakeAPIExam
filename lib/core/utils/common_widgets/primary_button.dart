import 'package:flutter/material.dart';

import '../../resource/color_palette.dart';
import 'text_title_medium.dart';

class PrimaryButton extends StatelessWidget {
  final String? buttonTitle;
  final Function? onPressed;

  const PrimaryButton({
    super.key,
    this.buttonTitle,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ElevatedButton(
        onPressed: () => onPressed?.call(),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.defaultButtonColor,
          shadowColor: Colors.grey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: TextTitleMedium(
          value: buttonTitle?.toUpperCase() ?? '',
          textColor: Colors.white,
        ),
      ),
    );
  }
}
