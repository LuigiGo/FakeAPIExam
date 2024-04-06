import 'package:flutter/material.dart';

class ReusableListItem extends StatelessWidget {
  final Widget card;
  final Widget? circularButton;

  const ReusableListItem({
    super.key,
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
