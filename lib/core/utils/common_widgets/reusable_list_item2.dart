import 'package:fake_api_exam/core/resource/color_palette.dart';
import 'package:fake_api_exam/core/utils/helpers/image_helpers.dart';
import 'package:fake_api_exam/core/utils/mapper/list_item_mapper.dart';
import 'package:flutter/material.dart';

import '../../di/injection.dart';
import 'text_title_large.dart';
import 'text_title_medium.dart';

class ReusableListItem2 extends StatelessWidget {
  final String? placeholder;
  final ListItemMapper listItemMapper;

  final ImageHelpers _imageHelpers = inject<ImageHelpers>();

  ReusableListItem2({
    super.key,
    this.placeholder,
    required this.listItemMapper,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: _imageHelpers.loadImage(
              width: 20.0,
              height: 20.0,
              imgUrl: listItemMapper.image,
              placeholder: placeholder,
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextTitleMedium(
                  value: listItemMapper.title,
                  fontWeight: FontWeight.bold,
                ),
                TextTitleMedium(
                  value: listItemMapper.subtitle,
                  textColor: AppColors.alternativeLabelColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
