import 'package:flutter/material.dart';

class ReusableListItem extends StatelessWidget {
  final Widget cardContent;
  final Widget? circularButton;

  const ReusableListItem({
    super.key,
    required this.cardContent,
    this.circularButton,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: cardContent,
        ),
        Positioned(
          right: 0,
          child: circularButton ?? const SizedBox(),
        ),
      ],
    );
  }
}
