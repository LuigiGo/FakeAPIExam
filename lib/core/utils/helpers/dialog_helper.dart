import 'package:fake_api_exam/core/utils/common_widgets/primary_button.dart';
import 'package:fake_api_exam/core/utils/common_widgets/text_title_large.dart';
import 'package:fake_api_exam/core/utils/common_widgets/text_title_medium.dart';
import 'package:flutter/material.dart';

class DialogHelper {
  void showOneButtonDialog(
    BuildContext context, {
    String? image,
    String? title,
    String? subtitle,
    String? buttonTitle,
    Function? onPressed,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.0,
            ),
          ),
          contentPadding: EdgeInsets.all(20.0),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 100.0,
                width: 100.0,
                child: Image.asset(image ?? ''),
              ),
              SizedBox(height: 20.0),
              TextTitleLarge(
                value: title,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10.0),
              TextTitleMedium(
                value: subtitle,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              PrimaryButton(
                buttonTitle: buttonTitle,
                onPressed: () {
                  Navigator.of(context).pop();
                  return onPressed?.call();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
