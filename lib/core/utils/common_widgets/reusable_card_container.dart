import 'package:flutter/material.dart';

class ReusableCardContainer extends StatelessWidget {
  final Widget? cardContent;

  const ReusableCardContainer({
    super.key,
    this.cardContent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
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
    );
  }
}
