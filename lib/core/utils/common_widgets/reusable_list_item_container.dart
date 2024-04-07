import 'package:flutter/material.dart';

class ReusableListItemContainer extends StatelessWidget {
  final double? cardWidth;
  final Widget card;
  final Widget? circularButton;

  const ReusableListItemContainer({
    super.key,
    this.cardWidth,
    required this.card,
    this.circularButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: card,
        ),
        Positioned(
          right: 0,
          child: circularButton ?? const SizedBox(),
        ),
      ],
    );
  }
}
