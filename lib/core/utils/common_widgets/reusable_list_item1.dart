import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:fake_api_exam/core/utils/helpers/image_helpers.dart';
import 'package:fake_api_exam/core/utils/mapper/list_item_mapper.dart';
import 'package:flutter/material.dart';

import '../../di/injection.dart';
import 'text_title_large.dart';
import 'text_title_medium.dart';

class ReusableListItem1 extends StatelessWidget {
  final String? placeholder;
  final ListItemMapper listItemMapper;

  final ImageHelpers _imageHelpers = inject<ImageHelpers>();

  ReusableListItem1({
    super.key,
    this.placeholder,
    required this.listItemMapper,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: _imageHelpers.loadImage(
              width: 50.0,
              height: 50.0,
              imgUrl: listItemMapper.image,
              placeholder: placeholder,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextTitleLarge(
                value: listItemMapper.title,
                fontWeight: FontWeight.bold,
              ),
              TextTitleMedium(
                value: listItemMapper.subtitle,
                textColor: AppColors.alternativeLabelColor,
                textOverflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
