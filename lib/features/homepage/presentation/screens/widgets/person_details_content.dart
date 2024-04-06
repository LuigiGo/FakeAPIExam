import 'package:fake_api_exam/core/utils/helpers/image_helpers.dart';
import 'package:flutter/material.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/common_widgets/text_body_large.dart';
import '../../../../../core/utils/common_widgets/text_body_medium.dart';
import '../../../data/models/person.dart';

class PersonDetailsContent extends StatelessWidget {
  final String? placeholder;
  final Person person;

  final ImageHelpers _imageHelpers = inject<ImageHelpers>();

  PersonDetailsContent({
    super.key,
    this.placeholder,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    String name = '${person.firstname} ${person.lastname}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _imageHelpers.loadNetworkImage(
              imgUrl: person.image,
              placeholder: placeholder,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextBodyLarge(
                value: name,
                fontWeight: FontWeight.bold,
              ),
              TextBodyMedium(value: person.email),
            ],
          ),
        ),
      ],
    );
  }
}
