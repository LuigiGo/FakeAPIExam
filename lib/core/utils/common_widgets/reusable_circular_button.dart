import 'package:flutter/material.dart';

class ReusableCircularButton extends StatelessWidget {
  final IconData? icon;
  final Color? buttonColor;
  final Function? onPressed;

  const ReusableCircularButton({
    super.key,
    this.icon,
    this.buttonColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () => onPressed?.call(),
      constraints: const BoxConstraints.tightFor(
        height: 32.0,
        width: 32.0,
      ),
      shape: const CircleBorder(),
      fillColor: buttonColor,
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
