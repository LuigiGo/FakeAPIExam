import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:fake_api_exam/core/utils/mapper/list_item_mapper.dart';
import 'package:flutter/material.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/utils/common_widgets/text_headline_small.dart';
import '../../../../core/utils/common_widgets/text_title_medium.dart';
import '../../../../core/utils/helpers/image_helpers.dart';
import '../../../homepage/data/models/person.dart';

class PersonalInfoCardContent extends StatelessWidget {
  final ImageHelpers _imageHelpers = inject<ImageHelpers>();
  final Person? person;

  PersonalInfoCardContent({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    String name = '${person?.firstname} ${person?.lastname}';

    return Container(
      padding: const EdgeInsets.all(20.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 75.0,
            height: 75.0,
            child: _imageHelpers.loadImage(imgUrl: person?.image),
          ),
          const SizedBox(height: 15.0),
          TextHeadlineSmall(
            value: name,
            fontWeight: FontWeight.bold,
          ),
          TextTitleMedium(
            value: '${person?.address?.city}, ${person?.address?.country}',
            textColor: AppColors.alternativeLabelColor,
          ),
        ],
      ),
    );
  }
}
