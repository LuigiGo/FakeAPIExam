import 'package:flutter/material.dart';

class ReusableCardContainer extends StatelessWidget {
  final double cardWidth;
  final double? cardMargin;
  final Widget? cardContent;

  const ReusableCardContainer({
    super.key,
    required this.cardWidth,
    this.cardMargin,
    this.cardContent,
  });

  @override
  Widget build(BuildContext context) {
    return UnconstrainedBox(
      child: Container(
        constraints: BoxConstraints(maxWidth: cardWidth),
        margin: EdgeInsets.symmetric(vertical: cardMargin ?? 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: cardContent ??
              const SizedBox(
                width: double.infinity,
                height: 120.0,
              ),
        ),
      ),
    );
  }
}
